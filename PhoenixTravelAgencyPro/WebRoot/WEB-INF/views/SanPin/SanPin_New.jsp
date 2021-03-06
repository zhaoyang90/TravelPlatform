
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page import="com.ckeditor.CKEditorConfig"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    <title>新建散拼</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/ckeditor/ckeditor.js"></script>
	<link href="js/ckeditor/sample.css" rel="stylesheet">
	
	

  </head>
  
  <body>
   <div style="background:#fafafa;padding:10px;width:10	00px;height:300px;">
  <form id="addsanpinform" method="post" >
  <div >
  <h4>基础信息</h4> 
  <table style="" >
  	<tr><td>价格体系（RMB）：</td>
  	<td>直客：</td><td><input class="easyui-validatebox" type="text" name="zhikejia" style="width: 70px; height: 15px;"></input></td>
  	<td>同行：</td><td><input class="easyui-validatebox" type="text" name="tonghang" style="width: 70px; height: 15px;"></input></td>
  	<td>儿童占床：</td><td><input class="easyui-validatebox" type="text" name="ertongzhanchuang" style="width: 70px; height: 15px;"></input></td>
 	<td>儿童不占床：</td><td><input class="easyui-validatebox" type="text" name="ertongbuzhanchuang" style="width: 70px; height: 15px;"></input></td>
 	<td>大客户：</td><td><input class="easyui-validatebox" type="text" name="dakehujia" style="width: 70px; height: 15px;"></input></td>
 	<td>自备签价：</td><td><input class="easyui-validatebox" type="text" name="zibeiqianjia" style="width: 70px; height: 15px;"></input></td>
  	</tr>
  </table>
  <table>
   	<tr>
  	<td>出团计划名称：</td><td><input class="easyui-validatebox" type="text" required="true" name="tuanName" ></input></td>
  	<td></td><td></td>
  	<td>出团计划编号：</td><td><input name="tuanNo" class="easyui-validatebox"   readonly="readonly"   ></td>
  	</tr>
  	<tr>
  	<td>全程天数：</td><td><input id="ss" name="numberday" class="easyui-numberspinner" min="1" max="100" required="true" style="width:133px;"></input></td>
  	<td></td><td></td>
  	<td>全程国家数：</td><td><input id="ss" name="numbercountry" class="easyui-numberspinner" min="1" max="100"  style="width:133px;"></input></td>
  	</tr>
  	<tr>
  	<td>出团日期：</td><td><input id="dd" name="groupdate" class="easyui-datebox" required="true" ></input></td>
  	<td></td><td></td>
  	<td>预收人数：</td><td><input id="ss" name="numbermaster" class="easyui-numberspinner" min="1" max="100" style="width:133px;" required="true"></input></td>
  	</tr>
  	  	<tr>
  	  	
  	
  	  	
  	  	
  	  	
  	<td>回团日期：</td><td><input id="dd" name="Tourdate" class="easyui-datebox" required="true" ></input></td>
  	<td></td><td></td>
  	<td>地域类型：</td><td>
  	<input id="Areatype" name="Areatype" required="true" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=6',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto'
	">
	</td>
  	</tr>
  	  	<tr>
  	<td>航空公司：</td><td><input class="easyui-validatebox" type="text" name="airways" style="width: 400px;"></input></td>
  	<td></td><td></td>
  	<td>目标人群：</td><td>
  	<input name="targetpopulation" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=30',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto'
	"></td>
  	</tr>
  	  	
  	  	<tr>
  	<td>去程航班：</td><td><input class="easyui-validatebox" type="text" name="groupflight" style="width: 400px;"></input></td>
  	<td></td><td></td>
  	<td>出发城市：</td><td>
  	<input name="Departurecity" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto'
	"></td>
  	</tr>
  	  	<tr>
  	<td>回程航班：</td><td><input class="easyui-validatebox" type="text" name="Tourflight" style="width: 400px;"></input></td>
  	<td></td><td></td>
  	<td>终点城市：</td><td>
  	<input name="TerminalCity" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto' 
	"></td>
  	</tr>
  	  	<tr>
  	<td>酒店标准：</td><td>
  	<input name="hotel" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=16',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto'
	">
	</td>
  	<td></td><td></td>
  	<td>产品类型：</td><td>
  	 <input name="Producttypes" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=31',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto'
	"></td>
  	</tr>
  	  	<tr>
  	<td>用餐标准：</td><td>
  	<input name="zao" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=22',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto'
	">
	<input name="zhong" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=23',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto' 
	">
	<input name="wan" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=24',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto'
	">
	
	</td>
  	<td></td><td></td>
  	<td>产品品牌：</td><td>
  	<input name="productbrand" class="easyui-combobox" data-options="
					url:'fenghuang/getDicByTypeComboboxs.do?dicType=32',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto'
	"></td>
  	</tr>
  	<tr>
  	<td>出团日期备注：</td><td colspan="5"><textarea name="groupdatebeizhu" style="height:40px; width: 640px;"></textarea></td>
  	
  	</tr>
  </table>
  </div>
  
  <div>
  <h4>出境团基础信息</h4>
   预报人数<input class="easyui-validatebox" type="text" name="predict" style=" "></input>

  </div>
        <div>
        <h4>扩展信息</h4>
        		<%
        		String value = "";
				Map<String, String> attr = new HashMap<String, String>();
				CKEditorConfig settings = new CKEditorConfig();
				  %>
     团队特色说明：
   <p>
			<% 
				
				attr.put("rows", "8");
				attr.put("cols", "10");
				
				settings.addConfigValue("width", "1000");
				settings.addConfigValue("toolbar", "Basic");
			%>
			<ckeditor:editor textareaAttributes="<%=attr %>"
				basePath="ckeditor/" config="<%=settings %>"
				editor="teamexplains" value="<%= value %>"/>
		</p>
   服务包含： 
   		<p>
			<ckeditor:editor textareaAttributes="<%=attr %>"
				basePath="ckeditor/" config="<%=settings %>"
				editor="Servicesinclude" value="<%= value %>"/>
		</p>
   服务不含： 
   		<p>
			<ckeditor:editor textareaAttributes="<%=attr %>"
				basePath="ckeditor/" config="<%=settings %>"
				editor="servicenoinclude" value="<%= value %>"/>
		</p>
   参团须知： 
   		<p>
			<ckeditor:editor textareaAttributes="<%=attr %>"
				basePath="ckeditor/" config="<%=settings %>"
				editor="notes" value="<%= value %>"/>
		</p>
   备注： 
   		<p>
			<ckeditor:editor textareaAttributes="<%=attr %>"
				basePath="ckeditor/" config="<%=settings %>"
				editor="beizhu" value="<%= value %>"/>
		</p>
  <a href="javascript:sanpinSave();" class="easyui-linkbutton" >保存</a>
        </div>
       <input id="master" name="master" type="hidden"  >
       <input id="areatype" name="areatypetext" type="hidden"  >
    </form>
</div>
<script type="text/javascript">
	$(document).ready(function(){
	var tuanNo = '${param.tuanNo}';
	if(tuanNo!="" && tuanNo!=null){
		var  url = "fenghuang/Sanpinliebiao.do?tuanNo="+tuanNo;
           $.ajax({
					url :url,
					data : tuanNo,
					dataType : "json",
					success : function(data) {
					$('#addsanpinform').form('load',data.rows[0]);
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
	});

			function sanpinSave() {
			var userid = '${sessionScope.userId}';
			$('#master').attr('value',userid);
			
			var areatype = $('#Areatype').combobox('getText');
			$('#areatype').attr('value',areatype);
			$('#addsanpinform').form('submit', {
				url : 'fenghuang/addsanpin.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
			
						$.messager.alert("保存成功", "保存成功！", "info");
					   
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
					
					}
				}
			});
		}
		
	</script>
  </body>
</html>
