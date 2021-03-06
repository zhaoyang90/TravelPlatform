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

<title></title>
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

<script>
	
</script>
</head>

<body>
	<!-- 如果在正式开发环境下 url可以为后台的请求，地址 -->
	<table id="dg" class="easyui-datagrid"
		data-options="url:'fenghuang/dantuancaiwuxianshi.do',border:false,singleSelect:false,fit:true,fitColumns:true, onClickRow: onClickRow,pageSize:20"
		pagination="true" toolbar="#tb">
		<thead>  
                    <tr>  
                      <th data-options="field:'ck',checkbox:true"></th>
                     <th  data-options="field:'tuanduimc'" width="40" >团号</th>  
                     <th data-options="field:'team'" width="60">团队名称</th> 
                     <th data-options="field:'chutuantime'" width="60">出团时间</th> 
                     <th data-options="field:'huituantime'" width="60">回团时间</th>  
                    <th data-options="field:'caozuo'" width="60"> 销售编号</th>  
                     <th data-options="field:'khmc'" width="60"> 客户名称</th> 
                     <th data-options="field:'confirmed'" width="60"> 团队状态</th>                                          
                    </tr>  
                </thead>  
	</table>
	 
	
	<div id="tb">
	 <a href="javascript:addDt();" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">新增(面板模式)</a>&nbsp;&nbsp;|
     <a href="javascript:shanchu();" class="easyui-linkbutton"
			iconCls="icon-cut" plain="true">删除</a>&nbsp;&nbsp;| 
	 <a href="javascript:selectDtId();" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	
	
	<div id="addDt" class="easyui-dialog" title="新增业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;">
		<form id="addForm" method="post">
			<table align="center">
				<tr>
<td><div class="fitem"><label>客户名称:</label></td><td><input name="khId" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>团号:</label></td><td><input name="tuanNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>团队操作类型：</label></td><td><input name="tdczlx" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>团队级别：</label></td><td><input name="tdjb" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>团名：</label></td><td><input name="tuanName" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>团对状态：</label></td><td><input name="tdzt" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>出访人数：</label></td><td><input name="cfrs" class="easyui-validatebox" required="true"></div></td>
<!-- CountrySettingDictionary 旅游国家 -->
<td><div class="fitem"><label>出访国家：</label></td><td><input  name="cfgj" class="easyui-combobox"
 data-options="url:'fenghuang/CountrySetting.do',valueField:'csdNo',textField:'csdName'"></td>
</tr>
<tr>
<td><div class="fitem"><label>出访天数：</label></td><td><input name="cfts" class="easyui-validatebox" required="true"></div></td>
<!-- CountryState 国家所属州 --> 
<td><div class="fitem"><label>旅游区域：</label></td><td><input name="lyqy" class="easyui-combobox"
 data-options="url:'fenghuang/CountryState.do',valueField:'id',textField:'csName'"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>出团时间：</label></td><td><input name="ctsj" type="text" class="easyui-datebox" required="required"></div></td>
<td><div class="fitem"><label>回团时间：</label></td><td><input name="htsj" type="text" class="easyui-datebox" required="required"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>销售：</label></td><td><input name="xsNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>计调：</label></td><td><input name="jdNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>客户经理：</label></td><td><input name="khjlNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>签证类型：</label></td><td><input name="qzlx" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>需办签证：</label></td><td><input name="xbqz" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>需办邀请：</label></td><td><input name="xbyq" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<!-- HotleStardictionary 酒店-星级字典维护 --> 
<td><div class="fitem"><label>酒店标准：</label></td><td><input name="jdbzNo" class="easyui-combobox"
  data-options="url:'fenghuang/HotleStar.do',valueField:'hsdNo',textField:'hsbName'"></div></td>
<td><div class="fitem"><label>酒店报价标准：</label></td><td><input name="jdbjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>早餐标准：</label></td><td><input name="zcNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>午餐标准：</label></td><td><input name="zhongcNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>晚餐标准：</label></td><td><input name="wcNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>用餐报价标准：</label></td><td><input name="ycbjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>巴士司导：</label></td><td><input name="bssdNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>巴士报价标准：</label></td><td><input name="bsbjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>车型：</label></td><td><input name="bssdNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>导游报价标准：</label></td><td><input name="dybjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>其他地接要求：</label></td><td><input name="qtdjDesc" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>特殊要求：</label></td><td><input name="tsDesc" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:dantuanSave();" class="easyui-linkbutton" iconCls="icon-ok">保存</a> <input  type="reset" value="重置"></td>
</tr>
			</table>
			<input id="dicType" name="dicType" type="hidden">
		</form>
	</div>
	
	
	
	<div id="updateDt" class="easyui-dialog" title="修改业务字段"
		data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width:600px;height:500px;padding:10px;">
		<form id="updateForm" action="">
			<table align="center">
				<tr>
<td><div class="fitem"><label>客户名称:</label></td><td><input name="khId" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>团号:</label></td><td><input name="tuanNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>团队操作类型：</label></td><td><input name="tdczlx" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>团队级别：</label></td><td><input name="tdjb" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>团名：</label></td><td><input name="tuanName" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>团对状态：</label></td><td><input name="tdzt" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>出访人数：</label></td><td><input name="cfrs" class="easyui-validatebox" required="true"></div></td>
<!-- CountrySettingDictionary 旅游国家 -->
<td><div class="fitem"><label>出访国家：</label></td><td><input  name="cfgj" class="easyui-combobox"
 data-options="url:'fenghuang/CountrySetting.do',valueField:'csdNo',textField:'csdName'"></td>
</tr>
<tr>
<td><div class="fitem"><label>出访天数：</label></td><td><input name="cfts" class="easyui-validatebox" required="true"></div></td>
<!-- CountryState 国家所属州 --> 
<td><div class="fitem"><label>旅游区域：</label></td><td><input name="lyqy" class="easyui-combobox"
 data-options="url:'fenghuang/CountryState.do',valueField:'id',textField:'csName'"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>出团时间：</label></td><td><input name="ctsj" type="text" class="easyui-datebox" required="required"></div></td>
<td><div class="fitem"><label>回团时间：</label></td><td><input name="htsj" type="text" class="easyui-datebox" required="required"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>销售：</label></td><td><input name="xsNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>计调：</label></td><td><input name="jdNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>客户经理：</label></td><td><input name="khjlNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>签证类型：</label></td><td><input name="qzlx" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>需办签证：</label></td><td><input name="xbqz" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>需办邀请：</label></td><td><input name="xbyq" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<!-- HotleStardictionary 酒店-星级字典维护 --> 
<td><div class="fitem"><label>酒店标准：</label></td><td><input name="jdbzNo" class="easyui-combobox"
  data-options="url:'fenghuang/HotleStar.do',valueField:'hsdNo',textField:'hsbName'"></div></td>
<td><div class="fitem"><label>酒店报价标准：</label></td><td><input name="jdbjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>早餐标准：</label></td><td><input name="zcNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>午餐标准：</label></td><td><input name="zhongcNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>晚餐标准：</label></td><td><input name="wcNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>用餐报价标准：</label></td><td><input name="ycbjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>巴士司导：</label></td><td><input name="bssdNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>巴士报价标准：</label></td><td><input name="bsbjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>车型：</label></td><td><input name="bssdNo" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>导游报价标准：</label></td><td><input name="dybjNo" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<td><div class="fitem"><label>其他地接要求：</label></td><td><input name="qtdjDesc" class="easyui-validatebox" required="true"></div></td>
<td><div class="fitem"><label>特殊要求：</label></td><td><input name="tsDesc" class="easyui-validatebox" required="true"></div></td>
</tr>
<tr>
<tr><td colspan="4" align="center"><a href="javascript:dantuanUpdate();" 
				class="easyui-linkbutton" iconCls="icon-ok">保存</a> <input  type="reset" value="重置"></td>
</tr>
				
			</table>
	
		</form>
	</div>
	<script type="text/javascript">
		var editIndex = undefined;
		function endEditing() {
			if (editIndex == undefined) {
				return true ;
			}
			if ($('#dg').datagrid('validateRow', editIndex)) {
				$('#dg').datagrid('endEdit', editIndex);
				$('#dg').datagrid('unselectRow', editIndex);
				editIndex = undefined;
				return true;
			} else {
				return false;
			}
		}
		
		function onClickRow(index) {
			if (editIndex != index) {
				if (endEditing()) {
					$('#dg').datagrid('selectRow', index).datagrid('beginEdit',
							index);
					editIndex = index;
				} else {
					$('#dg').datagrid('selectRow', editIndex);
				}
			}
		}
			
		
      //新增
		function addDt() {
			$("#addDt").dialog("open");
			$("#addFrome").form("clear");
		}
         //新增
		function dantuanSave() {
			$('#addForm').form('submit', {
				url : 'fenghuang/DantuanAdd.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
					$('#addDt').dialog('close');
						$.messager.alert("保存成功", "保存成功！", "info");
						 $('#dg').datagrid('reload'); 
					} else {
						$.messager.alert("保存失败", "保存失败!", "error");
						$('#dg').datagrid('reload');
					}
				}
			});
		}
			//关闭
		function closeEditDic() {
			$('#addDt').dialog('close');
		} 
		
        //删除
		function shanchu() {
			var row = $("#dg").datagrid("getSelected");
			if (row) {
				var param = {
					"deleteRows" :  row.tuanNo
				};
				$.ajax({
					url : "fenghuang/deleteDantuan.do",
					data : param,
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$.messager.alert("删除成功", "删除成功！", "info");
							$("#dg").datagrid('reload');
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
	
		//按id查询
		function selectDtId() {
          //通过主键，查询该操作，并处于编辑状态。 是否打开tab，还是直接弹出window 
			$("#updateDt").dialog("open");
			//准备回显的数据
			var row = $("#dg").datagrid("getSelected");
			//alert(row.tuanNO);
			if(row){
				var param = {
					"updateTuanNO" : row.tuanNo
				};
				
				$.ajax({
					url : "fenghuang/DantuanSelectId.do",
					data : param,
					dataType : "json",
					success : function(data) {
		
					   $('#updateForm').form('load',data.rows[0]);
				
					},
					error : function() {
						$.messager.alert("查询失败", "服务器请求失败!", "error");
					}
				});
				
          }
		}
		 //修改
		function dantuanUpdate() {
			$("#updateForm").form('submit', {
				url : 'fenghuang/DantuanUpdate.do',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {//data 是一个字符串  $.ajax(success:function(data):是一个对象)
					console.info(data);
					//var result = val('(' + data + ')');//吧字符串转换为对象
					var result = $.parseJSON(data) ;
					console.info(result);
					alert(result.success);
					if (result.success) {
					  $("#updateDt").dialog('close');
						$.messager.alert("修改成功", "修改成功！", "info"); 
						$("#dg").datagrid('reload');
					} else {
						$.messager.alert("修改失败", "修改失败!", "error");
						$("#dg").datagrid('reload');
					}
				}
			});
		}
		
		//关闭
		function closedSearch() {
			$('#updateDt').dialog('close');
		}
		
	</script>
</body>
</html>
