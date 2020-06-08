
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <form id="sForm">
                    <div class="title_right">
                        <div class="col-md-5 col-sm-5   form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" id="username" name="user_name" value="${searchdata.user_name}" class="form-control" placeholder="用户名">
                                    <span class="input-group-btn">
                                        <a  onclick="action('${basePath}/user/listUsers','post','sForm')">
                                            <button class="btn btn-secondary" type="button" >查询</button></a></span>
                            </div>
                        </div>
                    </div>
                </form>


                <table class="table table-striped jambo_table bulk_action">
                    <thead>
                    <tr class="headings">
                        <th class="column-title">用户ID </th>
                        <th class="column-title">账号</th>
                        <th class="column-title">创建时间</th>
                        <th class="column-title">用户职位</th>
                        <th class="column-title">状态</th>
                        <th class="column-title">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="user">
                        <tr>
                            <td>${user.user_id }</td>
                            <td>${user.user_name }</td>
                            <td>${user.createDateStr}</td>
                            <td>${user.role.role_name }</td>
                            <td><c:if test="${user.userStatus==1}">正常</c:if>
                            <c:if test="${user.userStatus==0}">离职</c:if>

                            </td>
                            <td>

                                <a href="javascript:;"  onclick="action('${basePath}/user/getUserById?user_id=${user.user_id}','get','')">
                                    <button class="btn btn-success btn-sm" type="button">修改</button>
                                </a>
                                <a href="javascript:;" onclick="action('${basePath}/user/deleteUserById?user_id=${user.user_id}','get','')">
                                    <button class="btn btn-danger btn-sm" type="button">删除</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
<%@ include file="page.jsp" %>
</div>
</div>
</div>
</div>

<script>
    function search() {
        alert("aaa")
    }
</script>