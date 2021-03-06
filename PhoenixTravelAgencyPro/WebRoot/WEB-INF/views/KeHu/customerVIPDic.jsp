<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" type="text/css"
	href="js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="js/demo/demo.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery.json.js"></script>

</head>

<body>
<div class="easyui-panel" title="客户VIP字典查询"
		style="height:85px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="VIPForm">
		<table>
	
			<tr>
			<td><div class="fitem">
						<label>名称:</label>
				</td>
				<td><input id="dicName" name="dicName" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>说明:</label>
				</td>
				<td><input id="dicDesc" name="dicDesc" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>帮助提示:</label>
				</td>
				<td><input id="dicHelp" name="dicHelp" class="easyui-validatebox">
					</div>
				</td>
				<td>
					<a href="javascript:VIPSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询</a>
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#VIPForm').form('clear')">重置</a>
				</td>
			</tr>
		</table>
		</form>
	</div>
    <!-- 查询结果展示 -->
    
	  <div class="easyui-panel" title="客户VIP字典列表"
		style="height:480px;width: auto;">
		<table id="dgVIP" class="easyui-datagrid"
			data-options="url:'fenghuang/getDictionaryDescs2.do?dicType=29',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			  pagination="true" toolbar="#currencyDatagridtoolbar">
		
			<thead>
				<tr>
				    <th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'dicName',align:'right'" width="100" editor="text">名称</th>
					<th data-options="field:'dicDesc',align:'right'" width="100" editor="text">说明</th>
					<th data-options="field:'dicHelp',align:'right'" width="100" editor="text">帮助提示</th>
				</tr>
		</thead>
	</table>
	<!-- 查询结果展示 -->
	<div id="currencyDatagridtoolbar">
		     <a href="javascript:addVIP();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		     <a href="javascript:VIPselectId();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:shanchuVIP();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>  
		</div>   
	</div>
	
	<!-- 新增客户资信字典 -->
	<div id="addVIP" class="easyui-dialog" title="新增客户VIP字典"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:200px;padding:10px;">
		<form id="addVIPForm" method="post">
			<table align="center">
				<tr>
					<td><div class="fitem">
							<label>编号:</label> 
					</td>
					<td>--系统自动生成--</div></td>
						<td><div class="fitem">
							<label>名称:</label>
					</td>
					<td><input  name="dicName" class="easyui-validatebox" required="true">
						</input>
						</div></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>说明:</label>
					</td>
					<td><input name="dicDesc" class="easyui-validatebox" required="true">
						</div></td>
					<td><div class="fitem">
							<label>帮助提示:</label>
					</td>
					<td><input name="dicHelp" class="easyui-validatebox" required="true" >
						</div></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
					<a href="javascript:SaveVIP();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeaddMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 新增客户资信字典结束 -->
	
	
		<!-- 修改客户资信字典 -->
	<div id="updateVIP" class="easyui-dialog" title="修改客户VIP字典"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:200px;padding:10px;">
		<form id="updateVIPForm" method="post">
			<table align="center">
				<tr>
						<td>
						<input name="dicNo" class="easyui-validatebox" hidden="true">
						<div class="fitem">
							<label>名称:</label>
					</td>
					<td><input  name="dicName" class="easyui-validatebox" required="true">
						</input>
						</div></td><td></td><td></td>
				</tr>
				<tr>
					<td><div class="fitem">
							<label>说明:</label>
					</td>
					<td><input name="dicDesc" class="easyui-validatebox" required="true">
						</div></td>
					<td><div class="fitem">
							<label>帮助提示:</label>
					</td>
					<td><input name="dicHelp" class="easyui-validatebox">
					<!-- required="true" missingMessage="请输入数字." invalidMessage="请输入数字." -->
						</div></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><a
						href="javascript:VIPUpdate();" class="easyui-linkbutton"
						iconCls="icon-ok">保存</a> <a href="javascript:closeaddMianBan();"
						class="easyui-linkbutton" iconCls="icon-cancel">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 修改客户资信字典结束 -->
	
   <script type="text/javascript">
 
   	/**
 * 查询按钮
 */
		function VIPSelectLike(){
		var opts = $('#dgVIP').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				dicName: $("#dicName").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				dicDesc: $("#dicDesc").val() ,
				dicHelp : $("#dicHelp").val(),
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};
		
				$.ajax({
					url : 'fenghuang/getDictionaryDescsPaginations.do?dicType=29' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dgVIP').datagrid('loadData',data);
					}
				});
		}
		

	   //新增
		function addVIP() {
			$("#addVIP").dialog("open");
			$("#addVIPForm").form("clear");
		}
         
		function SaveVIP() {
			$('#addVIPForm').form('submit', {
				url : 'fenghuang/saveDic.do?dicType=29',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addVIP').dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info");
						 $('#dgVIP').datagrid('reload'); 
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dgVIP').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addVIP').dialog('close');
		} 
	//删除操作要执行的方法
	function shanchuVIP(){
	  var row = $("#dgVIP").datagrid("getSelected");
			if (row) {
				var param = {
					"dicNo" :  row.dicNo
				};
			
				if(confirm("确认要删除名称为 “ "+row.dicName+" ”的客户资信字典吗？")){

				$.ajax({
					url : "fenghuang/deleteDics.do?",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgVIP").datagrid('reload');
						} else {
							$.messager.alert("删除失败", "删除失败!", "error");
						}
					},
					error : function() {
						$.messager.alert("删除失败", "服务器请求失败!", "error");
					}
				});
				}
			}
	}
	//按id查询
		function VIPselectId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
	
			//准备回显的数据
			var row = $("#dgVIP").datagrid("getSelected");
		    $('#updateVIPForm').form('load',row);
	     	$("#updateVIP").dialog("open");
			
		}
		 //修改
		function VIPUpdate() {
			$("#updateVIPForm").form('submit', {
				url : 'fenghuang/updatedictionary.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#updateVIP").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dgVIP").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dgVIP").datagrid('reload');
					}
				}
			});
		}
		
		//关闭
		function closedSearch() {
			$('#updateVIP').dialog('close');
		}
	
   </script>
    	
    
</body>
</html>

    	
