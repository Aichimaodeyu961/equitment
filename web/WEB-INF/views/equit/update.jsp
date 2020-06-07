<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body class="nav-md">

<div class="x_content">
    <form id="equit_update" class="" action="" method="post" novalidate>
<%--        <span>器材管理</span>--%>
        <input type="hidden" name="equit_id" value="${equit.equit_id}">

        <div class="field item form-group">
            <label class="col-form-label col-md-3 col-sm-3  label-align">器材名称<span
                    class="required"></span></label>
            <div class="col-md-6 col-sm-6">
                <input class="form-control" data-validate-length-range="6" data-validate-words="2" name="equit_name"
                       placeholder="" required="required" value="${equit.equit_name}"/>
            </div>
        </div>

        <div class="field item form-group">
            <label class="col-form-label col-md-3 col-sm-3  label-align">器材可借数量<span
                    class="required"></span></label>
            <div class="col-md-6 col-sm-6">
                <input class="form-control" class='equit_num' name="equit_num" data-validate-length-range="5,15" value="${equit.equit_num}" type="text"/></div>
        </div>

<%--        <div class="field item form-group">--%>
<%--            <label class="col-form-label col-md-3 col-sm-3  label-align">入库负责人<span--%>
<%--                    class="required"></span></label>--%>
<%--            <div class="col-md-6 col-sm-6">--%>
<%--                <input class="form-control" name="create_user_id" class='create_user_id' required="required" value="${equit.create_user_id}" type="text"/></div>--%>
<%--        </div>--%>
        <div class="ln_solid">
            <div class="form-group">
                <div class="col-md-6 offset-md-3">
                    <button type='submit' class="btn btn-primary" >提交</button>
                    <button type='button' class="btn btn-success" onclick="back_equit()">返回</button>
                </div>
            </div>
        </div>
    </form>
</div>

<script src="${basePath}/js/jquery-3.3.1.min.js"></script>

<script>
    <%--function sub(){--%>
    <%--    alert('fsa')--%>
    <%--    $.ajax({--%>
    <%--        url:"${basePath}/equit/update",--%>
    <%--        data:$(this).serialize(),--%>
    <%--        method:"post",--%>
    <%--        // dataType:"json",--%>
    <%--        success:function (res) {--%>
    <%--            if(res.msg==1){--%>
    <%--                alert("更新成功！");--%>
    <%--                location.href="equit/getEquitList";--%>
    <%--            }else{--%>
    <%--                alert("更新失败！");--%>
    <%--            }--%>
    <%--        },--%>
    <%--        error:function (res){--%>
    <%--            alert(res.responseText)--%>
    <%--        }--%>
    <%--    });--%>
    <%--}--%>
    $(function () {
        $("#equit_update").submit(function () {
            $.ajax({
                url:"${basePath}/equit/update",
                data:$(this).serialize(),
                method:"post",
                // dataType:"json",
                success:function (res) {
                    alert('操作成功')
                    getData('equit/getEquitList','','GET')
                },
                error:function (res) {
                    alert(res.responseText)
                }
            });
            return false;
        });
    })

    function back_equit() {
        getData('equit/getEquitList','','GET')
    }
    // $.get('equit/update',{equit_id:id},function (res) {

</script>
