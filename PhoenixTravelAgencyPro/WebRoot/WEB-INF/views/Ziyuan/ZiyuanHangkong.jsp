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
	<div class="easyui-panel" title="航空公司查询"
		style="height:85px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="hangkongForm">
		<table>
			<tr>
				<td><div class="fitem">
						<label>国际航协代码:</label>
				</td>
				<td><input id="daima" name="daima" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>航空公司名称:</label>
				</td>
				<td><input id="name" name="name" class="easyui-validatebox">
					</div>
				</td>
				<td>	<a href="javascript:hangkongSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询</a>
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#hangkongForm').form('clear')">重置</a>
							</td>
			</tr>
		</table>
		</form>
	</div>
		<div class="easyui-panel" title="航空公司列表"
		style="height:480px;width: auto;">
		<table id="dgHangkong" class="easyui-datagrid"
			data-options="url:'fenghuang/hangkongSelect.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<!--<th data-options="field:'id'" width="80">编号</th>-->
					<th data-options="field:'daima'" width="80">国际航协代码</th>
					<th data-options="field:'name'" width="80">航空公司名称</th>
					<th data-options="field:'shui'" width="80">税</th>
					<th data-options="field:'dicName'" width="80">币种</th>
					
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:addHangkong();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		    <a href="javascript:hangkongSelectId();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:hangkongDelete();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>
		</div>
	</div>
	
<div id="addHangkong" class="easyui-dialog" title="航空公司新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:240px;padding:10px;">
		<form id="addHangkongForm" method="post">
			<table align="center">
			<tr>
<td><div class="fitem"><label>编号:</label></td><td>--系统自动生成--</div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>国际航协代码:</label></td><td><input name="daima" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>航空公司名称:</label></td><td><input name="name" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>税：</label></td><td><input name="shui" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>币种：</label></td><td><input name="bizongId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
</tr>

<tr>
<tr><td colspan="4" align="center"><a href="javascript:SaveHangkong();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 <a  class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#addHangkongForm').form('clear')">重置</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>

<div id="hangkongUpdate" class="easyui-dialog" title="航空公司修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:240px;padding:10px;">
		<form id="updateHangkongForm" method="post">
			<table align="center">
							<tr>
<td><div class="fitem"><label>编号:</label></td><td><input name="id" class="easyui-validatebox" readonly="true" style="width:40px;">--不可修改--</div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>国际航协代码:</label></td><td><input name="daima" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>航空公司名称:</label></td><td><input name="name" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>税：</label></td><td><input name="shui" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>币种：</label></td><td><input name="bizongId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=5',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>			
</tr>

<tr>
<tr><td colspan="4" align="center"><a href="javascript:hangkongUpdate();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a href="javascript:closedhangkongUpdate();" class="easyui-linkbutton" iconCls="icon-undo">取消</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>


	<script type="text/javascript">
   
    //这个方法是格式化是否可用列的，0：为不使用，1：为使用
	function onIsUesStyle(val,row){
	  if(val =='1'){
	      return "使用";
	  }else{
	     return "不使用";
	  }
	  
	}
        //新增
		function addHangkong() {
			$("#addHangkong").dialog("open");
			$("#addHangkongForm").form("clear");
		}
         
		function SaveHangkong() {
			$('#addHangkongForm').form('submit', {
				url : 'fenghuang/hangkongAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addHangkong').dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info");
						 $('#dgHangkong').datagrid('reload'); 
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dgHangkong').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addHangkong').dialog('close');
		} 
	
	//删除操作要执行的方法
	function hangkongDelete(){
	  var row = $("#dgHangkong").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};
				if (confirm("确认要删除名称为 “ "+row.name+" ”的供应商吗？")) {
				$.ajax({
					url : "fenghuang/hangkongDelete.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgHangkong").datagrid('reload');
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
		function hangkongSelectId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#hangkongUpdate").dialog("open");
			//准备回显的数据
			var row = $("#dgHangkong").datagrid("getSelected");
		
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/hangkongSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateHangkongForm').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		 //修改
		function hangkongUpdate() {
			$("#updateHangkongForm").form('submit', {
				url : 'fenghuang/hangkongUpdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#hangkongUpdate").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dgHangkong").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dgHangkong").datagrid('reload');
					}
				}
			});
		}
		
		//关闭
		function closedhangkongUpdate() {
			$('#hangkongUpdate').dialog('close');
		}
		
		//模糊查询
		function hangkongSelectLike(){
		var opts = $('#dgHangkong').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				"daima" : $("#daima").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				"name" : $("#name").val() ,
				"page" :  opts.pageNumber ,
				"rows" :  opts.pageSize
			};
				$.ajax({
					url : 'fenghuang/hangkongSelectLike.do' ,
					data : param ,
					dataType : 'json' ,
					success : function(data){
						$('#dgHangkong').datagrid('loadData',data);
					}
				});
		}
		

	
	
	</script>



</body>
</html>
