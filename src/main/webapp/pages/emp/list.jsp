<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/easyui/include.jsp" %>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/emp/list.js"></script>
    <title>Insert title here</title>
</head>
<body>
    <!-- 员工列表 -->
    <table id="emp-list"></table>

    <div id="emp-list-toolbar">
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="eventObj.query();">查询</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="eventObj.add();">添加</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"onclick="eventObj.update();">修改</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove'"onclick="eventObj.remove();">删除</a>
    </div>

    <div id="emp-dialog" >


    </div>

</body>
</html>
