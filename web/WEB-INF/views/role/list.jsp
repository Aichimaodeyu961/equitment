
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row"></div>
<div class="col-md-12 col-sm-12  ">
    <div class="x_panel">
        <div class="x_content">
            <div class="table-responsive">
                <form id="sForm">
                    <div class="title_right">
                        <div class="col-md-5 col-sm-5   form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" id="role_id" name="role_id" value="${searchInfo.role_id}" class="form-control" placeholder="role_id">
                                <input type="text" id="role_name" name="role_name" value="${searchInfo.role_name}" class="form-control" placeholder="role_name">
                                <span class="input-group-btn"><button class="btn btn-secondary" type="button" onclick="search()">查询</button></span>
                                <span class="input-group-btn">
                                    <button class="btn btn-secondary" type="button" onclick="addRole()">添加角色</button>
                               </span>
                            </div>
                        </div>
                    </div>
                </form>


                <table class="table table-striped jambo_table bulk_action">
                    <thead>
                    <tr class="headings">
                        <th class="column-title">角色ID </th>
                        <th class="column-title">角色名</th>
                        <th class="column-title">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="item" varStatus="cur">

                        <tr class="${cur.index%2==0?'even':'odd'} pointer">
                            <td>${item.role_id}</td>
                            <td>${item.role_name}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${loginUser.role.role_name=='超级管理员'}">
                                         <c:choose>
                                             <c:when test="${item.role_name=='超级管理员' or item.role_name=='器材管理员' or item.role_name=='体育教师'}">
                                                 此角色为基本角色,不可操作
                                             </c:when>
                                             <c:otherwise>
                                                 <button class="btn btn-secondary" onclick="deleteRole(${item.role_id})">删除</button>
                                                 <button class="btn btn-secondary" onclick="updateRole(${item.role_id})">修改</button>
                                             </c:otherwise>
                                         </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        无权限操作
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%@include file="../borrow/p.jsp"%>
            </div>
        </div>
    </div>
</div>

<script>
    function updateRole(id){
        getData('role/toUpdate',{role_id:id},'GET')
    }


    function addRole() {
        getData('role/toUpdate','','GET')
    }
    function deleteRole(id) {
       if(confirm('确认删除?')){
           $.get('role/deleteRole',{role_id:id},function (res) {
              if(res.msg == 1){
                  alert('删除成功')
                  search();
              }else {
                  alert('删除失败')
              }
           })
       }
    }


    function search() {
        var url = '${uri}'
        var data = $('#sForm').serialize()
        getData(url,data,'GET')
    }

</script>