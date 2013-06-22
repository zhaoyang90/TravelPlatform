/**
 * 
 */
package com.fenghuang.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fenghuang.entiey.DictionaryDesc;
import com.fenghuang.service.IDictionaryDescService;
import com.fenghuang.util.Pagination;

/**
 * @author 鲍国浩
 * 
 *         版本 ： 1.0
 * 
 *         日期 ：2013-6-5
 * 
 *         描述 ：
 * 
 * 
 */
@Controller
public class DictionaryDescController {

	@Autowired
	private IDictionaryDescService iDictionaryDescService;
	@RequestMapping("fenghuang/getDictionaryDescs.do")
	@ResponseBody
	public Map<String, Object> getDictionaryDescS(HttpServletRequest request,
			HttpServletResponse response, Integer page, Integer rows,
			String dicType,String dicNo,String dicName,String dicHelp,String dicSortNo,String dicDesc) {

		int dicTypeCount = 0;
		if (dicType != null && !"".equals(dicType)) {
			dicTypeCount = Integer.valueOf(dicType);
		}
		DictionaryDesc ddDesc = new DictionaryDesc();
		ddDesc.setDicNo(dicNo);
		ddDesc.setDicName(dicName);
		ddDesc.setDicDesc(dicDesc);
		ddDesc.setDicHelp(dicHelp);
		if(dicSortNo != null&&!"".equals(dicSortNo)){
			ddDesc.setDicSortNo(Integer.valueOf(dicSortNo));
		}else{
			ddDesc.setDicSortNo(-1);
		}
		ddDesc.setDicType(dicTypeCount);
		
		
		try {
			Pagination<DictionaryDesc> dicDescs = iDictionaryDescService.getDictionaryDescPaginations(page, rows, ddDesc);
			List<Map<String, Object>> dicDescRows = dicDescs.getResultList();
			Map<String, Object> returnValue = new HashMap<String, Object>();
			returnValue.put("total", dicDescs.getTotalRows());
			returnValue.put("rows", dicDescRows);
			return returnValue;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
    
	@RequestMapping("fenghuang/updateDic.do")
	@ResponseBody
	public Map<String,Object> updateDic(HttpServletRequest request,
			HttpServletResponse response,String updateRows){
	
		Map<String,Object>  result = new HashMap<String, Object>();
		JSONArray jsonArray =  JSONArray.fromObject(updateRows);
		List<DictionaryDesc>  dics = JSONArray.toList(jsonArray, DictionaryDesc.class);	
		boolean isSuccess = false;
		
		try {
			iDictionaryDescService.updateDictionaryDescs(dics);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		
		}		
		result.put("success", isSuccess);
		return result;
		
	}
	
	@RequestMapping("fenghuang/saveDic.do")
	@ResponseBody
	public Map<String,Object>  saveDic(HttpServletRequest request,HttpServletResponse response,String dicNo,String dicName,String dicHelp,Integer dicSortNo,Integer dicType,String dicDesc){
		Map<String,Object>  result = new HashMap<String, Object>();
		boolean  isSuccess = false;
		DictionaryDesc ddDesc = new DictionaryDesc();
		ddDesc.setDicNo(dicNo);
		ddDesc.setDicName(dicName);
		ddDesc.setDicDesc(dicDesc);
		ddDesc.setDicHelp(dicHelp);
		ddDesc.setDicSortNo(dicSortNo);
		ddDesc.setDicType(dicType);
		try {
			isSuccess = iDictionaryDescService.insertDictionaryDesc(ddDesc);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("success", isSuccess);
		
		return result;
	}
	
	@RequestMapping("fenghuang/deleteDics.do")
	@ResponseBody
	public Map<String,Object> deleteDics(HttpServletRequest request,
			HttpServletResponse response,String deleteRows){
		Map<String,Object>  result = new HashMap<String, Object>();
		JSONArray jsonArray =  JSONArray.fromObject(deleteRows);
		List<DictionaryDesc>  dicDescs = JSONArray.toList(jsonArray, DictionaryDesc.class);	
		boolean isSuccess = false;
		try {
			iDictionaryDescService.deleteDictionaryDescs(dicDescs);
			isSuccess = true;
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		}	
		result.put("success", isSuccess);
		
		return result;
	}
	@RequestMapping("fenghuang/getDicByTypeComboboxs.do")
	public List<Map<String, Object>> getComboxs(HttpServletRequest request,
			HttpServletResponse response,String dicType){
		
		try {
			return iDictionaryDescService.getDictionaryComboboxs(dicType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	
	
	
}
