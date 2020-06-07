<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${basePath}/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
    <title>体育器材管理系统</title>

    <!-- Bootstrap -->
    <link href="${basePath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${basePath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${basePath}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="${basePath}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${basePath}/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="javascript:return false;"  class="site_title">
                        <i class="fa fa-paw"></i> <span>体育器材管理系统</span>
                    </a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile clearfix">
                    <div class="profile_pic">
                        <img src="${basePath}/images/img.jpg" alt="..." class="img-circle profile_img">
                    </div>
                    <div class="profile_info">
                        <h3>${loginUser.user_name}</h3>
                        <h2>${loginUser.role.role_name}</h2>
                    </div>
                </div>
                <!-- /menu profile quick info -->

                <br />

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <h2>主面板</h2>
                        <ul class="nav side-menu">
                            <li <c:if test="${loginUser.role_id==3||loginUser.role_id==4}">style="display: none" </c:if>><a><i class="fa fa-home"></i> 系统模块 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="javascript:;" onclick="action('${basePath}/user/listUsers','get','')">用户管理</a></li>
                                    <li><a href="javascript:;" onclick="action('${basePath}/user/listUsers','get','')">角色管理</a></li>
                                </ul>


                            </li>
                            <li><a><i class="fa fa-edit"></i> 业务模块 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <c:if test="${loginUser.role.role_name != '体育教师'}">
                                        <li><a href="javascript:;" onclick="getData('equit/getEquitList','','GET')">器材管理</a></li>

                                    </c:if>
                                    <c:if test="${loginUser.role.role_name == '体育教师'}">
                                       <li><a href="javascript:;" onclick="getEquitInfo()">教师借器材</a></li>
                                    </c:if>
                                       <li><a href="javascript:;" onclick="getBorrowList()">借单管理</a></li>
                                </ul>
                            </li>
                            <script src="js/borrow/borrow.js"></script>
                        </ul>
                    </div>

                </div>
                <!-- /sidebar menu -->

                <!-- /menu footer buttons -->
                <div class="sidebar-footer hidden-small">
                    <a data-toggle="tooltip" data-placement="top" title="Settings">
                        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Lock">
                        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                    </a>
                </div>
                <!-- /menu footer buttons -->
            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <div class="nav toggle">
                    <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>
                <nav class="nav navbar-nav">
                    <ul class=" navbar-right">
                        <li class="nav-item dropdown open" style="padding-left: 15px;">
                            <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                                <img src="${basePath}/images/img.jpg" alt="">${loginUser.user_name}
                            </a>
                            <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item"  href="${basePath}/login/logout"><i class="fa fa-sign-out pull-right"></i> 注销</a>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="right_col" role="main" id="insert" >

        </div>

        <footer>
            <div class="pull-right">
                第七小组
            </div>
            <div class="clearfix"></div>
        </footer>
    </div>
</div>

<!-- jQuery -->
<script src="${basePath}/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${basePath}/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="${basePath}/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="${basePath}/vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="${basePath}/vendors/Chart.js/dist/Chart.min.js"></script>
<!-- jQuery Sparklines -->
<script src="${basePath}/vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- Flot -->
<script src="${basePath}/vendors/Flot/jquery.flot.js"></script>
<script src="${basePath}/vendors/Flot/jquery.flot.pie.js"></script>
<script src="${basePath}/vendors/Flot/jquery.flot.time.js"></script>
<script src="${basePath}/vendors/Flot/jquery.flot.stack.js"></script>
<script src="${basePath}/vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="${basePath}/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="${basePath}/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="${basePath}/vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="${basePath}/vendors/DateJS/build/date.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="${basePath}/vendors/moment/min/moment.min.js"></script>
<script src="${basePath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="${basePath}/build/js/custom.min.js"></script>
</body>
<script type="text/javascript">
    $(function(){
        <%--action("${basePath}/login/main",'get','');--%>
    });
    function action(url,method,formId){
        if(method == 'post'){
            $.post(
                url,
                $("#"+formId).serialize(),
                function(data){
                    $("#insert").html(data);
                }
            );
        }else{
            $.get(url,function(data){
                $("#insert").html(data);
            });
        }
    }
</script>
</html>