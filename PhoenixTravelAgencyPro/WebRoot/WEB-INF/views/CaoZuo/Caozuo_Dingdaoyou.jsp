<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Caozuo_Dingdaoyou.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <table id="caozuoliebiaodg" class="easyui-datagrid"
		data-options="url:'fenghuang/Operateinfo.do',border:false,singleSelect:true,fit:true,fitColumns:true,onRowContextMenu:DaoyouContextMenu"
		pagination="true">
		<thead>
			<tr>
				<th data-options="field:'oid',hidden:true" width="20">编号</th>
				<th data-options="field:'tuanNo'" width="20">团号</th>
				<th data-options="field:'tuanName'" width="20">团名</th>
				<th data-options="field:'chutuantime'" width="20">出团时间</th>
				<th data-options="field:'huituantime'" width="20">回团时间</th>
				<th data-options="field:''" width="20">导游</th>			
			</tr>
		</thead>
	</table>
	<div id="adddaoyou" class="easyui-dialog" title="导游安排"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:240px;padding:10px;">
		<form id="adddaoyouForm" method="post">
			<table align="center">
			<tr>
<td><div class="fitem"><label>编号:</label></td><td>--系统自动生成--</div></td>
<td><br></td>
</tr>
<tr>
<td><div class="fitem"><label>团号:</label></td><td><input name="tuanNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>导游:</label></td><td><input name="daoyouId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=15',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
</tr>

<tr>
<tr><td colspan="4" align="center"><a href="javascript:SaveDaoyou();" class="easyui-linkbutton" iconCls="icon-ok">安排导游</a>
 <a  class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#addHangkongForm').form('clear')">重置</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	<div id="anpaidaoyou" class="easyui-menu" style="width:120px;">
    <div onClick="dingdaoyou()" data-options="iconCls:'icon-search'">导游安排</div>
   </div>
   <script type="text/javascript">
    function DaoyouContextMenu(e, rowIndex, rowData){
	 e.preventDefault();
	  $('#anpaidaoyou').menu('show', {
        left:e.pageX,
        top:e.pageY
    });  
	}
	function saveDaoyouOpen(){
	   $("").dafalog();
	   
	}
	function SaveDaoyou(){
	    
	
	}
   </script>
  </body>
</html>
