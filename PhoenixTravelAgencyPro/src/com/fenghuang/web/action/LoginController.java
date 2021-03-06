/**
 * 
 */
package com.fenghuang.web.action;

import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.PersonalEvent;
import com.fenghuang.entiey.Users;
import com.fenghuang.service.IPersonalEventService;
import com.fenghuang.service.IUsersService;
import com.fenghuang.util.CommonUtil;
import com.fenghuang.util.FengHuangDateUtil;
import com.fenghuang.util.FengHuangMd5Util;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-8-4
 * 
 *         描述 ：
 * 
 * 
 */
@Controller
public class LoginController {

	@Autowired
	private IUsersService iUsersService;
    @Autowired
	private IPersonalEventService iPersonalEventService; 
	@RequestMapping("login.do")
	public String login(HttpServletRequest request,
			HttpServletResponse response, String loginName, String password,String code,ModelMap map) {

		try {
			String  yanzhengCode = (String)request.getSession().getAttribute("code");
			if(!"".equals(yanzhengCode)){
				if(!yanzhengCode.equals(code)){
					map.put("loginError", "验证码不正确！");
					return "index";
				}
			}
			 boolean isExist = iUsersService.isExistUserLoginName(loginName);
			if(isExist){
				Users users = iUsersService.getUsersByLoginName(loginName);
				if(users != null&&FengHuangMd5Util.getMD5(password).equals(users.getPassword()))
				{
					map.put("userId",users.getId());
					HttpSession  session = request.getSession();
					session.setAttribute("userId", users.getId());
					session.setAttribute("userNumber", users.getUserNumber());
					map.put("dateTime", FengHuangDateUtil.getTimeShow());
					map.put("userName", users.getLoginName());
					//验证成功
					//在这里还可以添加 用户的操作事件。 以后我还可以用spring的拦截器进行方法拦截，插入事件。
					//这些就要他们总结操作的方法了，并在数据库中建立一张表。
		            //目前先这样写。测试用的
					PersonalEvent personalEvent = new PersonalEvent();
					personalEvent.setEventDate(new Date());
					personalEvent.setEventDesc("登陆操作，并且在这里还要记录ip");
					personalEvent.setEventType("登陆操作");
					personalEvent.setUserId(users.getId());
					iPersonalEventService.insertPersonalEvent(personalEvent);
					 if("admin".equals(loginName)){
							map.put("dateTime", FengHuangDateUtil.getTimeShow());
						 return "layout";
					 }else {
						
						 return "layouttest";
					}
				}else{
					map.put("loginError", "密码不正确！");
					map.put("loginName", loginName);
				  return "index";
				}
			}else{
				map.put("loginError", "用户不存在！");
				return "index";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}
	
	@RequestMapping("fenghuang/getUserMenus.do")
	@ResponseBody
	public List<Map<String, Object>> getFunctions(HttpServletRequest request,HttpServletResponse response,Long userId){
		
		try {
			List<Map<String, Object>> functions = iUsersService.getFunctionMenusByUserId(userId);
		    return functions;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	@RequestMapping("index.do")
	public String index(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		String code = CommonUtil.getCode();
		map.put("code", code);
		request.getSession().setAttribute("code", code);
		return "index";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
        Enumeration<String>  attrs =  session.getAttributeNames();
        while(attrs.hasMoreElements()){
        	String name = attrs.nextElement();
        	session.removeAttribute(name);
        	
        }
		return "redirect:index.do";
	}

}
