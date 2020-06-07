
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
                            <span class="input-group-btn"><button class="btn btn-secondary" type="button" onclick="borrowEquit()">提交</button></span>
                        </div>
                    </div>
                </div>
              </form>

                <table class="table table-striped jambo_table bulk_action">
                    <thead>
                    <tr class="headings">
                        <th class="column-title">Equit_ID </th>
                        <th class="column-title">Equit_name</th>
                        <th class="column-title">Equit_num</th>
                        <th class="column-title">operate</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="item" varStatus="cur">

                    <tr class="${cur.index%2==0?'even':'odd'} pointer">
                        <td>${item.equit_id}</td>
                        <td>${item.equit_name}</td>
                        <td>${item.equit_num}</td>
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
                <%@include file="p.jsp"%>
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