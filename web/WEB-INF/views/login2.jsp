<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
    <!-- Animate.css -->
    <link href="${basePath}/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${basePath}/build/css/custom.min.css" rel="stylesheet">
    <style>
        .login_content h1:before{
            width: 15%;
        }
        .login_content h1:after{
            width: 15%;
        }
        .login {
            background:url("${basePath}/images/background.jpg") no-repeat center/cover;
        }
    </style>
</head>

<body class="login" >

<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>
    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content" >
                <form action="${pageContext.request.contextPath}/login/login" method="post">
                    <h1 style="">体育器材管理系统登录</h1>
                    <div>
                        <input type="text" name="user_name" class="form-control" placeholder="${errormsg eq null? 'Username':errormsg}" autofocus required />
                    </div>
                    <div>
                        <input type="password" name="password" class="form-control" placeholder="Password" required />
                    </div>
                    <div >
<%--                        <a class="btn btn-default submit" href="${basePath}/login/login">登录</a>--%>
<%--                        <a class="reset_pass" href="#">Lost your password?</a>--%>
<%--                            <input type="submit" value="登录" >--%>
<%--                        <button type="submit" style="background: #E8F0FE">登录</button>--%>
                        <button type="submit" class="btn btn-primary">登录</button>
                    </div>

                    <div class="clearfix" ></div>

                    <div class="separator">
                        <p class="change_link" style="color: #6C757D">New to site?
                            <a href="#signup" class="to_register"> 注册 </a>
                        </p>

                        <div class="clearfix"></div>
                        <br />

<%--                        <div>--%>
<%--                            <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>--%>
<%--                            <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </form>
            </section>
        </div>

        <div id="register" class="animate form registration_form">
            <section class="login_content">
                <form id="registerForm" action="${basePath}/login/register" method="post">
                    <h1>注册</h1>
                    <div>
                        <input type="text" name="user_name" id="username" class="form-control" placeholder="用户名" oninput="checkUsername(this)" required />
                    </div>
                    <div>
                        <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码" required />
                    </div>
                    <div>
                        <input type="password" name="repassword" class="form-control" placeholder="确认密码" oninput="checkrePassword(this)" required />
                    </div>
                    <div >
                        <div style="float: left">
                            <label class="control-label" style="font-size: 1rem" >角色</label>
                        </div>
                        <div style="float: left">
                            <select class="form-control" >
                                <option selected>教师</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link" style="color: #6C757D">已经存在账户 ?
                            <a href="#signin" class="to_register"> 去登录 </a>
                        </p>

                        <div class="clearfix"></div>
                        <br />

<%--                        <div>--%>
<%--                            <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>--%>
<%--                            <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>--%>
<%--                        </div>--%>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
<script src="${basePath}/js/jquery-3.3.1.min.js"></script>
<script src="${basePath}/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#registerForm").submit(function () {
            $.ajax({
                url:"${basePath}/login/register",
                data:{
                    user_name:$("#username").val(),
                    password:$("#password").val(),
                },
                method:"post",
                dataType:"json",
                success:function (res) {
                    if (res.code==1) {
                        alert("成功");
                    }else {
                        alert("失败请重新尝试！")
                    }
                }
            });
            return false;
        })
    });
        function checkrePassword(_this) {
            var fp=$("#password").val()
            if(fp!=_this.value){
                _this.setCustomValidity("密码不一致！")
            }else {
                _this.setCustomValidity("")
            }
        };
        function checkUsername(_this) {
            $.ajax({
                url:"${basePath}/login/rename",
                data:{
                    user_name:$(_this).val(),
                },
                method: "post",
                dataType: "json",
                success:res=>{
                    if (res.code==1){
                        _this.setCustomValidity("该用户名已存在")
                    }else{
                        _this.setCustomValidity("")
                    }
            }
            });
        }
</script>
</html>
