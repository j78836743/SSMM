<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>query</title>


</head>
<body>
	
		<table style="margin:20px auto;" cellpadding="5px" cellspacing="5px">	
			<tr>
				<td>员工姓名</td>
				<td><input id="ename" name="ename" class="easyui-textbox" data-options="width:180" /></td>				
			</tr>				
			<tr>
				<td>员工部门</td>
				<td><input id="did" name="did" class="easyui-combotree" data-options="width:180,
					url:'${pageContext.request.contextPath}/dept/getDept',
					method:'post',
					animate:true,
					lines:true				
				" /></td>				
			</tr>		
			<tr>
				<td>开始时间</td>
				<td><input id="startTime" name="startTime" class="easyui-datebox" data-options="width:180" /></td>				
			</tr>	
			<tr>
				<td>结束时间</td>
				<td><input id="endTime" name="endTime" class="easyui-datebox" data-options="width:180" /></td>				
			</tr>	
				
		</table>		
			
</body>
</html>