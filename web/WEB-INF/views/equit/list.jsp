
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
                                <input type="text" id="equit_name" name="equit_name" value="${searchInfo.equit_name}" class="form-control" placeholder="equit_name">
                                <span class="input-group-btn"><button class="btn btn-secondary" type="button" onclick="search()">查询</button></span>
                                <span class="input-group-btn"><button class="btn btn-secondary" type="button" onclick="addEquit()">添加器材</button></span>
                            </div>
                        </div>
                    </div>
                </form>


                <table class="table table-striped jambo_table bulk_action">
                    <thead>
                    <tr class="headings">
                        <th class="column-title">器材ID </th>
                        <th class="column-title">器材名</th>
                        <th class="column-title">器材可借数量</th>
                        <th class="column-title">器材入库时间</th>
                        <th class="column-title">入库负责人</th>
                        <th class="column-title">更新器材时间</th>
                        <th class="column-title">更新负责人</th>
                        <th class="column-title">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="item" varStatus="cur">

                        <tr class="${cur.index%2==0?'even':'odd'} pointer">
                            <td>${item.equit_id}</td>
                            <td>${item.equit_name}</td>
                            <td>${item.equit_num}</td>
                            <td>${item.createDateStr}</td>
                            <td>${item.user.user_name}</td>
                            <td>${item.updateDate!=null?item.updateDateStr:'暂无更新'}</td>
                            <td>${item.updateDate!=null?item.update_user.user_name:'暂无更新'}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${loginUser.role.role_name=='超级管理员' or loginUser.role.role_name=='器材管理员'}">
                                         <button class="btn btn-secondary" onclick="deleteEquit(${item.equit_id})">删除</button>
                                         <button class="btn btn-secondary" onclick="javascript:;">修改</button>
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

    function deleteEquit(id) {
       if(confirm('确认删除?')){
           $.get('equit/delete',{equit_id:id},function (res) {
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