<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>欢迎使用体育器材管理系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="app sidebar-mini">
<!-- Navbar-->
<header class="app-header"><a class="app-header__logo" style="font-size: 20px" href="javascript:;">体育器材管理系统</a>
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
            <ul class="dropdown-menu settings-menu dropdown-menu-right">
                <li><a class="dropdown-item" href="${basePath}/login/logout"><i class="fa fa-sign-out fa-lg"></i> 注销</a></li>
            </ul>
        </li>
    </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image">
        <div>
            <p class="app-sidebar__user-name">${loginUser.user_name}</p>
            <p class="app-sidebar__user-designation">${loginUser.role.role_name}</p>
        </div>
    </div>
    <ul class="app-menu" id="app-menu">
        <li><a class="app-menu__item active" href="javascript:;" onclick="action('${basePath}/index/main','get','')"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">主面板</span></a></li>
        <li <c:if test="${loginUser.role_id==3||loginUser.role_id==4}">style="display: none" </c:if>class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">系统模块</span><i class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="javascript:;" onclick="action('${basePath}/user/listUsers','get','')"><i class="icon fa fa-circle-o"></i> 用户管理</a></li>
                <li><a class="treeview-item" href="javascript:;" onclick="action('${basePath}/user/listUsers','get','')" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> 角色管理</a></li>
            </ul>
        </li>
        <li <c:if test="${loginUser.role_id==2}">style="display: none" </c:if> class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">业务模块</span><i class="treeview-indicator fa fa-angle-right"></i></a>
            <ul class="treeview-menu">
                <li <c:if test="${loginUser.role_id==4}">style="display: none" </c:if><a class="treeview-item" href="javascript:;" onclick="action('${basePath}/user/listUsers','get','')"><i class="icon fa fa-circle-o"></i> 器材管理</a></li>
                <li <c:if test="${loginUser.role_id==3}">style="display: none" </c:if>><a class="treeview-item" href="javascript:;" onclick="action('${basePath}/user/listUsers','get','')"><i class="icon fa fa-circle-o"></i> 生成租借单</a></li>
                <li <c:if test="${loginUser.role_id==4}">style="display: none" </c:if>><a class="treeview-item" href="javascript:;" onclick="action('${basePath}/user/listUsers','get','')"><i class="icon fa fa-circle-o"></i> 借单管理</a></li>

            </ul>
        </li>
    </ul>
</aside>
<main class="app-content" id="maincontent">

</main>
<!-- Essential javascripts for application to work-->
<script src="${basePath}/js/jquery-3.3.1.min.js"></script>
<script src="${basePath}/js/popper.min.js"></script>
<script src="${basePath}/js/bootstrap.min.js"></script>
<script src="${basePath}/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="${basePath}/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script type="text/javascript" src="${basePath}/js/plugins/chart.js"></script>
<script type="text/javascript">
    $(function(){
        action("${basePath}/login/main",'get','');
    });
    function action(url,method,formId){
        if(method == 'post'){
            $.post(
                url,
                $("#"+formId).serialize(),
                function(data){
                    $("#maincontent").html(data);
                }
            );
        }else{
            $.get(url,function(data){
                $("#maincontent").html(data);
            });
        }
    }
</script>

</body>
</html>