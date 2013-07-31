package com.fenghuang.web.action;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.Canyin;
import com.fenghuang.entiey.Xianlu;
import com.fenghuang.service.IXianluService;
import com.fenghuang.util.DateJsonValueProcessor;
import com.fenghuang.util.Pagination;

@Controller
public class XianluController {
	@Autowired
	IXianluService xlservice;
	@RequestMapping("fenghuang/xianluinfo.do")
	@ResponseBody
	public Map<String,Object> xianluinfo(HttpServletRequest request,
			HttpServletResponse response, Integer page,Integer rows,Xianlu x){
		try{
			Pagination<Xianlu> pagination=(Pagination<Xianlu>)xlservice.xianluinfo(page, rows, x);
			List<Map<String, Object>> xlservice=pagination.getResultList();
			Map<String,Object> returnValue  = new HashMap<String, Object>();
			for(int i = 0 ;i<xlservice.size();i++){
				for(Entry<String, Object> entry : xlservice.get(i).entrySet()){
					if(entry.getValue() == null){
						entry.setValue("") ;
					}
				}
			}
			returnValue.put("total",  pagination.getTotalRows());
			returnValue.put("rows", xlservice);	
			JsonConfig config = new JsonConfig();
	     	config.registerJsonValueProcessor(Timestamp.class,new DateJsonValueProcessor("yyyy-MM-dd"));
	     			//把MAP转换成JSON，返回到前台
	     	JSONObject fromObject = JSONObject.fromObject(returnValue,config);
	     	//System.out.println(fromObject);
			return fromObject;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}