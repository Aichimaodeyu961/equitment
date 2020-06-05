
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row"></div>
<div class="col-md-12 col-sm-12  ">
    <div class="x_panel">
        <div class="x_content">
            <div class="table-responsive">

<%--                <div class="title_left">--%>
<%--                    <h3>Typography</h3> page-title--%>
<%--                </div>--%>

              <form id="sForm">
                <div class="title_right">
                    <div class="col-md-10 col-sm-10  form-group pull-right top_search">
                        <div class="input-group">
                            <input type="text" id="borrow_id" name="borrow_id" value="${searchInfo.borrow_id}" class="form-control" placeholder="borrowid">
                            <input type="text" id="user_name" name="user.user_name" value="${searchInfo.user.user_name}" class="form-control" placeholder="教师">
                            <input type="text" id="user_id" name="user_id" value="${searchInfo.user_id}" class="form-control" placeholder="教师ID">

                            <select id="borrow_status" class="form-control"  name="borrow_status">
                                <option id="nostatus" value="">状态</option>
                                <option value="已预定">已预定</option>
                                <option value="已领取">已领取</option>
                                <option value="超时">超时</option>
                                <option value="已归还">已归还</option>
                                <option value="已撤销">已撤销</option>
                            </select>
                            <input type="text" value="${searchInfo.operate_id}" id="operate_id" name="operate_id" class="form-control" placeholder="操作员ID">

                            <span class="input-group-btn"><button class="btn btn-secondary" type="button" onclick="search()">查询</button></span>
                            <span class="input-group-btn"><button class="btn btn-secondary" type="button" onclick="initInput()">重置</button></span>

                        </div>
                    </div>
                </div>
              </form>

                <table class="table table-striped jambo_table bulk_action">
                    <thead>
                    <tr class="headings">
                        <th class="column-title">ID </th>
                        <th class="column-title">体育老师</th>
                        <th class="column-title">借器材信息</th>
                        <th class="column-title">借器材状态</th>
                        <th class="column-title">借器材日期</th>
                        <th class="column-title">应归还日期</th>
                        <th class="column-title">归还日期</th>
                        <th class="column-title">操作人员姓名</th>
                        <th class="column-title">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="item" varStatus="cur">

                    <tr class="${cur.index%2==0?'even':'odd'} pointer">
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
                <%@include file="p.jsp"%>
                </div>
        </div>
    </div>
</div>

<script type="text/javascript">

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
                    var data = {pageNum:'${pageInfo.pageNum}',borrow_id:$('#borrow_id').val() , user_id:$('#user_id').val(),
                        user_name:$('#user_name').val(),borrow_status:$('#borrow_status').val(),operate_id:$('#operate_id').val()}
                    getData('borrow/getBorrowInfo',data,'GET')
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
                        user_name:$('#user_name').val(),borrow_status:$('#borrow_status').val(),operate_id:$('#operate_id').val()},'GET')
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
                        user_name:$('#user_name').val(),borrow_status:$('#borrow_status').val(),operate_id:$('#operate_id').val()},'GET')
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

</script>