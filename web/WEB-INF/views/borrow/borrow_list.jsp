<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="app-title">
    <div>
        <h1><i class="fa fa-users"></i> 器材租借信息列表</h1>
    </div>
    <ul class="app-breadcrumb breadcrumb">
        <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
        <li class="breadcrumb-item"><a href="#">器材租借信息列表</a></li>
    </ul>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="tile">
            <div class="tile-body">

                <form class="row" id="sForm">
                    <div class="form-group col-md-2">
                        <input class="form-control" id="borrow_id" name="borrow_id" type="text" placeholder="borrow_id" value="${searchInfo.borrow_id}">
                    </div>
                    <div class="form-group col-md-2">
                        <input class="form-control" id="user_id" name="user_id" type="text" placeholder="user_id" value="${searchInfo.user_id}">
                    </div>
                    <div class="form-group col-md-2">
                        <input class="form-control" id="user_name" name="user.user_name" type="text" placeholder="teacher_name" value="${searchInfo.user.user_name}">
                    </div>
                    <div class="form-group col-md-2">
                        <input class="form-control" id="operate_id" name="operate_id" type="text" placeholder="operate_id" value="${searchInfo.operate_id}">
                    </div>
                    <div class="form-group col-md-2">
                        <select id="borrow_status" class="form-control"  name="borrow_status">
                            <option id="nostatus" value="">选择状态</option>
                            <option value="已预定">已预定</option>
                            <option value="已领取">已领取</option>
                            <option value="超时">超时</option>
                            <option value="归还">归还</option>
                            <option value="已撤销">已撤销</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4 align-self-end">
                        <button class="btn btn-primary" type="button" onclick="search()"><i class="fa fa-fw fa-lg fa-search"></i>查询</button>
                        <button class="btn btn-primary" type="button" onclick="initInput()">重置</button>
                    </div>
                </form>

                <table class="table table-bordered table-sm">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>体育老师</th>
                        <th>借器材信息</th>
                        <th>借器材状态</th>
                        <th>借器材日期</th>
                        <th>应归还日期</th>
                        <th>归还日期</th>
                        <th>操作人员姓名</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="item">

                        <tr>
                            <td>${item.borrow_id}</td>
                            <td>${item.user.user_name}</td>
                            <td>
                                <c:forEach items="${item.borrow_equit_info}" var="info">
                                    ${info.equit.equit_name}*${info.equit_num}<br>
                                </c:forEach>
                            </td>
                            <td>${item.borrow_status}</td>
                            <td>${item.borrow_date_str}</td>
                            <td>${item.should_back_date_str}</td>
                            <td>${item.back_date==null?'暂无信息':item.back_date_str}</td>
                            <td>${item.operate_id==null?'暂无信息':item.operater.user_name}</td>
                            <td>
                                <c:if test="${(loginUser.role_id==2 or loginUser.user_id == item.user_id ) and item.borrow_status=='已预定'}">
                                      <button class="btn btn-danger" type="button" onclick="deleteBorrowInfo(${item.borrow_id})">撤销</button>
                                </c:if>

                                  <c:if test="${loginUser.role_id==3 and item.borrow_status=='已预定'}">
                                        <button type="button" class="btn btn-success" onclick="outEquit(${item.borrow_id})">领取</button>
                                  </c:if>
                                  <c:if test="${loginUser.role_id==3 and item.borrow_status=='已领取'}">
                                        <button type="button" class="btn btn-success" onclick="backEquit(${item.borrow_id})">归还</button>
                                  </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%@include file="page.jsp"%>
            </div>
        </div>
    </div>
</div>
<script>
    function initInput() {

        $('#borrow_id').val('')
        $('#user_id').val('')
        $('#user_name').val('')
        $('#operate_id').val('')
        $('#borrow_status option').each(function () {
            $(this).attr('selected',false)
        })
        $('#nostatus').attr('selected',true)
    }
    function deleteBorrowInfo(borrowid){
       $.ajax({
           url:'borrow/delete',

           data:{
               borrow_id:borrowid,
               operate_id:'${loginUser.user_id}'
           },
           method:'POST',
           success:res=>{
               if(res.msg==1){
                   alert('撤销成功')
                   getData('borrow/getBorrowInfo',{pageNum:'${pageInfo.pageNum}',borrow_id:$('#borrow_id').val() , user_id:$('#user_id').val(),
                       user_name:$('#user_name').val(),operate_id:$('#operate_id').val()},'GET')
               }else {
                   alert('撤销失败')
               }
           },
           error:res=>{
               alert(res.responseText)
           }
       })
    }

    function outEquit(borrowid){
        $.ajax({
            url:'borrow/out',
            data:{
                borrow_id:borrowid,
                operate_id:'${loginUser.user_id}'
            },
            method:'POST',
            success:res=>{
                if(res.msg==1){
                    alert('操作成功')
                    getData('borrow/getBorrowInfo',{pageNum:'${pageInfo.pageNum}',borrow_id:$('#borrow_id').val() , user_id:$('#user_id').val(),
                        user_name:$('#user_name').val(),operate_id:$('#operate_id').val()},'GET')
                }else {
                    alert('操作失败')
                }
            }
        })
    }

    function backEquit(borrowid){
        $.ajax({
            url:'borrow/back',
            data:{
                borrow_id:borrowid,
                operate_id:'${loginUser.user_id}'
            },
            method:'POST',
            success:res=>{
                if(res.msg==1){
                    alert('操作成功')
                    getData('borrow/getBorrowInfo',{pageNum:'${pageInfo.pageNum}',borrow_id:$('#borrow_id').val() , user_id:$('#user_id').val(),
                        user_name:$('#user_name').val(),operate_id:$('#operate_id').val()},'GET')
                }else {
                    alert('操作失败')
                }
            }
        })
    }

    $(function () {
         $('#borrow_status option').each(function () {
              if($(this).val() == '${searchInfo.borrow_status}'){
                  $(this).attr('selected' , true)
              }
         })
    })

    function search() {
        var data = $("#sForm").serialize()
        getData('${uri}',data,'GET')
    }
</script>