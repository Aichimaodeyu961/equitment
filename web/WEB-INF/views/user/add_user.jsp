<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<div class="row">
    <div class="col-md-12 col-sm-12 ">
        <div class="x_panel">
            <div class="x_title">
                <h2>用户修改 </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <br>
                <form class="form-horizontal form-label-left" id="updateForm" novalidate="" data-parsley-validate="">
                    <input type="hidden" id="user_id" name="user_id" value=""/>
                    <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="user_name">用户名 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 ">
                            <input class="form-control" type="text" id="user_name" placeholder="请输入用户名" name="user_name" value="" onblur="checkUsername(this.value)">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="password">密码 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 ">
                            <input class="form-control" type="password" id="password" placeholder="请输入密码" name="password" value="" >
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="createDate">创建日期 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 ">
                            <%Date date=new Date();
                           Long time=date.getTime();%>
                            <input class="form-control" type="password" id="createDate"  name="createDate" value="<%=time%>" readonly="true" >
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="col-form-label col-md-3 col-sm-3 label-align" for="role.role_id">用户职位</label>
                        <div class="col-md-6 col-sm-6 ">
                            <select class="form-control" id="role.role_id" name="role_id">
                                <c:forEach items="${roles}" var="role">
                                    <option value="${role.role_id}" <c:if test="${role.role_id eq user.role.role_id}">selected</c:if>>${role.role_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <input type="hidden" id="userStatus" name="userStatus" value="1"/>
                    <div class="ln_solid"></div>
                    <div class="item form-group">
                        <div class="col-md-6 col-sm-6 offset-md-3">
                            <a onclick="action('${basePath}/user/listUsers','get','')">
                                <button class="btn btn-primary" type="button" href="#">返回</button>
                            </a>
                            <button class="btn btn-primary" type="reset">重置</button>
                            <a onclick="action('${basePath}/user/addUser2','post','updateForm')">
                                <button class="btn btn-success" type="button">提交</button>
                            </a>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<script  type="text/javascript">
    function checkUsername(user_name){
        var user_id = $("#user_id").val();
        $.ajax({
            url:"${basePath}/user/checkUsername",
            type:"post",
            data:{"name":user_name,"user_id":user_id},
            dataType:"text",
            success:function(data){
                if(data == "isExist"){
                    $("#user_name").val("");
                    $("#user_name").attr("placeholder","用户名已存在！");
                }
            }
        });
    }

</script>