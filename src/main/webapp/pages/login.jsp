<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/easyui/include.jsp" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
    <title>Insert title here</title>
</head>
<body>
<div id="login-dialog">
    <form id="login-form">

        <table style="margin:10px auto;" cellpadding="15px">
            <tr>
                <td>用户名</td>
                <td> <input type="text"  id="username" name="username"/> </td>
            </tr>
            <tr>
                <td>密码</td>
                <td> <input type="password"  id="password" name="password"/> </td>
            </tr>
        </table>
    </form>
</div>

<div id="register-dialog" class="easyui-dialog" >


</div>

</body>
</html>