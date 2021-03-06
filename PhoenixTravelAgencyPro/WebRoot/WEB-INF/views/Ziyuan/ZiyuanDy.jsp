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
	<div class="easyui-panel" title="导游查询"
		style="height:85px;padding:10px;width:auto;"
		data-options="closable:false,tools:'#searchpanel'" align="center">
		<form id="daoyouForm">
		<table>
			<tr>
				<td><div class="fitem">
						<label>姓名:</label>
				</td>
				<td><input id="name" name="name" class="easyui-validatebox">
					</div>
				</td>
				<td><div class="fitem">
						<label>国籍:</label>
				</td>
				<td><input id="guojiaId" name="guojiaId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=7',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
				<td><div class="fitem">
						<label>常驻地:</label>
				</td>
				<td><input id="chengshiId" name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
				<td>
					<a href="javascript:daoyouSelectLike();" 
								class="easyui-linkbutton" iconCls="icon-ok">查询</a>
						<a href="javascript:void(0)" class="easyui-linkbutton"
							iconCls="icon-undo" onclick="$('#daoyouForm').form('clear')">重置</a>
				</td>
				
			</tr>			
		</table>
		</form>
	</div>
	
		<div class="easyui-panel" title="导游列表"
		style="height:480px;width: auto;">
		<table id="dgDaoyou" class="easyui-datagrid"
			data-options="url:'fenghuang/daoyouSelect.do',border:false,singleSelect:true,fit:true,fitColumns:true,pageSize:20"
			pagination="true" toolbar="#currencyDatagridtoolbar">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'guojia'" width="80">国籍</th>
					<th data-options="field:'name'" width="80">姓名</th>
					<th data-options="field:'zjhm'" width="80">证件号码</th>
					<th data-options="field:'chengshi'" width="80">常驻地</th>
					<th data-options="field:'dinhua'" width="80">移动电话</th>
					<th data-options="field:'fax'" width="80">传真</th>
					<th data-options="field:'shouji'" width="80">手机</th>
					<th data-options="field:'email'" width="80">EMAIL</th>
					<th data-options="field:'bz'" width="80">备注</th>	
				</tr>
			</thead>
		</table>
		<div id="currencyDatagridtoolbar">
		     <a href="javascript:addDaoyou();" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>  
		    <a href="javascript:daoyouSelectId();" class="easyui-linkbutton" iconCls="icon-save"  plain="true">修改</a>
		     <a href="javascript:daoyouDelete();" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>  
		</div>
	</div>
	
	


<div id="addDaoyou" class="easyui-dialog" title="导游新增"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;">
		<form id="addDaoyouForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>编号:</label></td><td>--系统自动生成--</div></td>
<td><div class="fitem"><label>国籍：</label></td><td><input name="guojiaId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=7',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>姓名：</label></td><td><input name="name" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>姓名拼音：</label></td><td><input name="name2" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>英文名称：</label></td><td><input name="name3"  class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>证件类型：</label></td><td><input name="zjlx"  class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>证件号码：</label></td><td><input name="zjhm" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>常驻地：</label></td><td><input  name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>电话：</label></td><td><input name="dinhua" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>联系方式1：</label></td><td><input name="lxfs1" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>手机：</label></td><td><input name="shouji" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>联系2：</label></td><td><input name="lxfs2" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>传真：</label></td><td><input name="fax" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>联系3：</label></td><td><input name="lxfs3" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>EMAIL：</label></td><td><input name="email" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>合作级别：</label></td><td><input name="hzjbId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>导游费用：</label></td><td><input name="dyfy"  class="easyui-numberspinner" min="1" max="999999" ></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>备注：</label></td><td colspan="3"><input name="bz" class="easyui-validatebox" size="70"></div></td>
<td></td>
</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:SaveDaoyou();" class="easyui-linkbutton" iconCls="icon-ok">保存</a> 
<a class="easyui-linkbutton" iconCls="icon-undo" onclick="$('#addDaoyouForm').form('clear')">重置</a></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>


<div id="updateDaoyou" class="easyui-dialog" title="导游修改"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;">
		<form id="updateDaoyouForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>编号:</label></td><td><input name="id" class="easyui-validatebox" readonly="true" style="width:40px;">--不可修改</div></td>
<td><div class="fitem"><label>国籍：</label></td><td><input name="guojiaId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=7',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>姓名：</label></td><td><input name="name" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>姓名拼音：</label></td><td><input name="name2" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>英文名称：</label></td><td><input name="name3"  class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>证件类型：</label></td><td><input name="zjlx"  class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>证件号码：</label></td><td><input name="zjhm" class="easyui-validatebox"></div></td>
<td><div class="fitem"><label>常驻地：</label></td><td><input  name="chengshiId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=8',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>电话：</label></td><td><input name="dinhua" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>联系方式1：</label></td><td><input name="lxfs1" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>手机：</label></td><td><input name="shouji" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>联系2：</label></td><td><input name="lxfs2" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>传真：</label></td><td><input name="fax" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>联系3：</label></td><td><input name="lxfs3" class="easyui-validatebox" ></div></td>
</tr>
<tr>
<td><div class="fitem"><label>EMAIL：</label></td><td><input name="email" class="easyui-validatebox" ></div></td>
<td><div class="fitem"><label>合作级别：</label></td><td><input name="hzjbId" class="easyui-combobox" data-options="url:'fenghuang/getDicByTypeComboboxs.do?dicType=4',
					valueField:'dicNo',
					textField:'dicName',
					panelHeight:'auto',
					editable:false "></div></td>
</tr>
<tr>
<td><div class="fitem"><label>导游费用：</label></td><td><input name="dyfy"  class="easyui-numberspinner" min="1" max="999999" ></div></td>
<td></td>
</tr>
<tr>
<td><div class="fitem"><label>备注：</label></td><td colspan="3"><input name="bz" class="easyui-validatebox" size="70"></div></td>
<td></td>
</tr>
<tr><td colspan="4" align="center"><a href="javascript:daoyouUpdate();" class="easyui-linkbutton" iconCls="icon-ok">保存</a> 
<a href="javascript:closedupdateDaoyou();" class="easyui-linkbutton" iconCls="icon-undo">取消</a></td>
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
	
	/**
 * 查询按钮
 */
		function daoyouSelectLike(){

		var opts = $('#dgDaoyou').datagrid('options') ;//options中有分页信息：pageNumber:相当于后台的Page , pageSize:相当于后台的rows
			var param = {
				name: $("#name").val(),//获取databox的值   ,传递Id：$('#combo_id').combobox('getValue')，传递值：$('#combo_id').combobox('getText')
				guojiaId: $("#guojiaId").combobox('getValue') ,
				chengshiId : $("#chengshiId").combobox('getValue'),
				page:  opts.pageNumber ,
				rows:  opts.pageSize
			};

				$.ajax({
					url : 'fenghuang/daoyouSelect.do' ,
					data :  param,
					type : 'POST' ,
					dataType : 'json' ,
					success : function(data){
						$('#dgDaoyou').datagrid('loadData',data);
					}
				});
		}
		
	
	
	  //新增
		function addDaoyou() {
			$("#addDaoyou").dialog("open");
			$("#addDaoyouForm").form("clear");
		}
         
		function SaveDaoyou() {
			$('#addDaoyouForm').form('submit', {
				url : 'fenghuang/daoyouAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addDaoyou').dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info");
						 $('#dgDaoyou').datagrid('reload'); 
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dgDaoyou').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addDaoyou').dialog('close');
		} 
	
	//删除操作要执行的方法
	function daoyouDelete(){
	  var row = $("#dgDaoyou").datagrid("getSelected");
			if (row) {
				var param = {
					"id" :  row.id
				};
			  if (confirm("确认要删除名称为 “ "+row.name+" ”的供应商吗？")) {
				$.ajax({
					url : "fenghuang/daoyouDelete.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dgDaoyou").datagrid('reload');
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
		function daoyouSelectId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#updateDaoyou").dialog("open");
			//准备回显的数据
			var row = $("#dgDaoyou").datagrid("getSelected");
			alert(row.id);
		
			if(row){
				var param = {
					"id" : row.id
				};
				
				$.ajax({
					url : "fenghuang/daoyouSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateDaoyouForm').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
		}
		}
		 //修改
		function daoyouUpdate() {
			$("#updateDaoyouForm").form('submit', {
				url : 'fenghuang/daoyouUpdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;

					if (result.success) {
					  $("#updateDaoyou").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dgDaoyou").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dgDaoyou").datagrid('reload');
					}
				}
			});
		}
		
		//关闭
		function closedupdateDaoyou() {
			$('#updateDaoyou').dialog('close');
		}
	
	
	</script>



</body>
</html>
