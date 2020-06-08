
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-sm-5">
        <div class="dataTables_info" id="datatable-responsive_info" role="status" aria-live="polite">
            total:${pageInfo.total}&nbsp;&nbsp;totalPage:${pageInfo.pages}&nbsp;&nbsp;curPage:${pageInfo.pageNum}
        </div>
    </div>
    <div class="col-sm-7">
        <div class="dataTables_paginate paging_simple_numbers" id="datatable-responsive_paginate">
            <ul class="pagination">
                <li class="paginate_button " <c:if test='${!pageInfo.hasPreviousPage}'>disabled</c:if>>
                    <a href="javascript:prePage();">上一页</a>
                </li>
                &nbsp;&nbsp;
                <li class="paginate_button " <c:if test='${!pageInfo.hasNextPage}'>disabled</c:if>>
                    <a href="javascript:nextPage();">下一页</a>
                </li>

            </ul>
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