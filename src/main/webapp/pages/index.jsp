<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/easyui/include.jsp" %>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/index.js"></script>
    <title>Insert title here</title>
</head>
<body>
<div class="easyui-layout" data-options="fit:true" >
    <div data-options="region:'north',split:true" style="height:80px;">
        <div style="float:right;margin-right:20px;line-height: 65px;
    	">
    		<span>
    			欢迎: ${emp.ename }
    		</span>
            <span>
    			<a href="javascript:void(0);" onclick="logout();"> 退出</a>
    		</span>
        </div>
    </div>



    <div data-options="region:'west',title:'菜单',split:true,width:270">
        <div id="aa" class="easyui-accordion" data-options="fit:true">
            <div title="Title1" style="overflow:auto;padding:10px;">
                <ul class="easyui-tree">
                    <li><a class="opts" url="/emp/list2" >用户权限</a></li>
                    <li><a class="opts" >角色权限</a></li>
                    <li><a class="opts" >管理权限</a></li>
                    <li><a class="opts" >总权限</a></li>
                </ul>

            </div>
            <div title="员工管理" style="padding:10px;">
                <ul class="easyui-tree">
                    <li><a class="opts" url="/emp/list">员工入职</a></li>
                </ul>
            </div>
            <div title="Title3">
                content3
            </div>
        </div>
    </div>
    <div data-options="region:'center'">
        <div id="content" class="easyui-tabs" data-options="fit:true">



        </div>
    </div>
</div>

</body>
</html>
