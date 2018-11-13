<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add</title>


</head>
<body>
	<form id="emp-form" method="GET">
		<table style="margin:20px auto;" cellpadding="5px" cellspacing="5px">

			<input type="hidden" name="id" value="">
			<tr>
				<td>员工姓名</td>
				<td><input  name="ename" class="easyui-textbox" data-options="required:true,width:180" /></td>				
			</tr>		
			<tr>
				<td>密码</td>
				<td><input type="password" id="password" name="password" class="easyui-textbox" data-options="required:true,width:180" /></td>
			</tr>		
			<tr>
				<td>员工编号</td>
				<td><input  name="eno" class="easyui-textbox" data-options="required:true,width:180" /></td>
			</tr>		
		
			<tr>
				<td>员工职位</td>
				<td><input  name="job" class="easyui-combobox" 
							data-options="required:true,width:180,valueField: 'label',
							textField: 'value',
							data: [{
								label: 'gcs',
								value: '工程师'
							},{
								label: 'xzzl',
								value: '行政助理'
							}]"  /></td>				
			</tr>

			<tr>
				<td>员工薪资：</td>
				<td>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',onClick:function(){
					var i = $('#salary').numberbox('getValue');
					$('#salary').numberbox('setValue',parseInt(i)-200);
					}" ></a>
					<input name="salary" id="salary"
						   class="easyui-numberbox"
						   data-options="required:true,width:180" />
					<a href="javascript:void(0)" class="easyui-linkbutton"
					   data-options="iconCls:'icon-add',onClick:function(){
					var i = $('#salary').numberbox('getValue');
					$('#salary').numberbox('setValue',parseInt(i)+200);
					}" ></a>
				</td>
			</tr>
			
			<tr>
				<td>员工部门</td>
				<td><input id="cc" name="did" class="easyui-combotree" data-options="required:true,width:180,
					url:'${pageContext.request.contextPath}/dept/getDept',
					method:'post',
					animate:true,
					lines:true
				" /></td>
			</tr>		
		
			
				
		</table>		
			
	</form>	
</body>
</html>