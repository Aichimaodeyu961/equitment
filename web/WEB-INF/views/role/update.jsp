<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body class="nav-md">

<div class="x_content">
    <form id="Form" method="post" novalidate>
        <input type="hidden" name="role_id" value="${role.role_id}">

        <div class="field item form-group">
            <label class="col-form-label col-md-3 col-sm-3  label-align">角色名<span
                    class="required"></span></label>
            <div class="col-md-6 col-sm-6">
                <input class="form-control" data-validate-length-range="6" data-validate-words="2" name="role_name"
                       placeholder="role_name" required="required" value="${role.role_name}"/>
            </div>
        </div>


        <div class="ln_solid">
            <div class="form-group">
                <div class="col-md-6 offset-md-3">
                    <button type='button' class="btn btn-primary" onclick="subData()">提交</button>
                    <button type='button' class="btn btn-success" onclick="back()">返回</button>
                </div>
            </div>
        </div>
    </form>
</div>

<script src="${basePath}/js/jquery-3.3.1.min.js"></script>

<script>
    function subData(){
        $.ajax({
            url:"${basePath}/role/doUpdate",
            data:$('#Form').serialize(),
            method:"post",
            success:function (res) {
                if(res.msg==1){
                    alert("操作成功！");
                    getData('role/getRoleList','','GET')
                }else{
                    alert("更新失败！");
                }
            },
            error:function (res){
                alert(res.responseText)
            }
        });
    }


    function back() {
        getData('role/getRoleList','','GET')
    }

</script>
