<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
  <div class="col-md-4"></div>
  <div class="col-md-6">
   <div class="bs-component">
       <div>
         <ul class="pagination">
           <li class="page-item <c:if test='${!pageInfo.hasPreviousPage}'>disabled</c:if>">
           	<a class="page-link" href="javascript:prePage();">上一页</a>
           </li>
           <li class="page-item disabled"><a class="page-link" href="#">总条数：${pageInfo.total}</a></li>
           <li class="page-item disabled"><a class="page-link" href="#">当前页：${pageInfo.pageNum}</a></li>
           <li class="page-item disabled"><a class="page-link" href="#">总页数：${pageInfo.pages}</a></li>
           <li class="page-item <c:if test='${!pageInfo.hasNextPage}'>disabled</c:if>">
           	<a class="page-link" href="javascript:nextPage();">下一页</a>
           </li>
         </ul>
       </div>
     </div>
    </div>
 </div>
 <script type="text/javascript">
     function prePage() {
         var url = '${uri}?pageNum=${pageInfo.prePage}'
         var data = $('#sForm').serialize()
         getData(url,data,'GET')
     }
     function nextPage() {
         var url = '${uri}?pageNum=${pageInfo.nextPage}'
         var data = $('#sForm').serialize()
         getData(url,data,'GET')
     }
 </script>