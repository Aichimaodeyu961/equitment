<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="app-title">
    <div>
        <h1><i class="fa fa-users"></i> 器材信息列表</h1>
    </div>
    <ul class="app-breadcrumb breadcrumb">
        <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
        <li class="breadcrumb-item"><a href="#">器材信息列表</a></li>
    </ul>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="tile">
            <div class="tile-body">

                <form class="row" id="sForm">
                    <div class="form-group col-md-2">
                        <input class="form-control" id="equit_name" name="equit_name" type="text" placeholder="equit_name" value="${searchInfo.equit_name}">
                    </div>
                    <div class="form-group col-md-4 align-self-end">
                            <button class="btn btn-primary" type="button" onclick="search()"><i class="fa fa-fw fa-lg fa-search"></i>查询</button>
                            <button class="btn btn-primary" type="button" onclick="borrowEquit()">提交清单</button>
                    </div>
                </form>


                <table class="table table-bordered table-sm">
                    <thead>
                    <tr>
                        <th>Equit_ID</th>
                        <th>Equit_name</th>
                        <th>Equit_num</th>
                        <th>createTime</th>
                        <th>operate</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="item">
                        <tr>
                            <td>${item.equit_id}</td>
                            <td>${item.equit_name}</td>
                            <td>${item.equit_num}</td>
                            <td>${item.createDateStr}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.equit_num>0}">
                                <input class="box" type="checkbox" id="box${item.equit_id}" onchange="equitArr(this,${item.equit_id},${item.equit_num})">选中 |||
                                数量：<input class="num" type="number" id="num${item.equit_id}" placeholder="0"  onchange="numArr(this,${item.equit_id},${item.equit_num})" name="${item.equit_id}" >
                                    </c:when>
                                    <c:otherwise>
                                        器材不可借
                                    </c:otherwise>
                                </c:choose>
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

    $(function () {
        $('.box').each(function (index , element) {
            var tarid = element.id
            for(var i =0 ;i<equit.length;i++){
                if(('box'+equit[i]) == tarid){
                    element.checked = true
                    $('#num'+equit[i]).val(num[i])
                    break;
                }
            }
        })
    })

    function search() {
        var url = '${uri}'
        var data = $('#sForm').serialize()
        getData(url,data,'GET')
    }


    function borrowEquit() {
        if(equit.length==0){
            alert('请选择器材')
            return
        }

        var borrow = ''
        for(var i =0;i<equit.length;i++){
            var temp = equit[i]+','+num[i]+';'
            borrow+=temp
        }

        if(!confirm('此次借'+equit.length+'种器材,确定？')){
            return;
        }
        $.ajax({
            url:'borrow/borrow',
            data:{
                'borrow':borrow
            },
            method:'POST',
            dataType:'json',
            success:function (res) {
                if(res.msg ==1 ){
                    alert('借单开具成功，请在25分钟内交代学生领取器材，超时失效')
                    equit=[]
                    num=[]
                    getData('borrow/goBorrow','','GET')
                }else {
                    alert('借单开具失败，请重试')
                }

            }
        })

    }

</script>
