<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<p id="page_list">

<c:if test="${page.curBlock gt 1 }">
<a class="page_first" onclick="go_page(1)">처음</a>
<!-- 이전블럭의 마지막페이지 -->
<%-- <a class="page_prev" onclick="go_page(${page.beginPage-1})">이전</a> --%>
<!-- 이전블럭의 첫페이지 -->
<a class="page_prev" onclick="go_page(${page.beginPage-page.blockPage})">이전</a>
</c:if>

<c:forEach var="no" begin="${page.beginPage }" 
						end="${page.endPage }">
	<c:if test="${no eq page.curPage }">
		<span class="page_on">${no }</span>
	</c:if>
	<c:if test="${no ne page.curPage }">
		<a onclick="go_page(${no})" class="page_off">${no }</a>
	</c:if>
</c:forEach>
<!-- 현재블럭이 마지막블럭이 아닌 경우 -->
<c:if test="${page.curBlock lt page.totalBlock }">
<a class="page_next" onclick="go_page(${page.endPage+1})">다음</a>
<a class="page_last" onclick="go_page(${page.totalPage})">마지막</a>
</c:if>

</p>

<script type="text/javascript">
function go_page(no){
	$('[name=curPage]').val(no);
	$('#list').submit();
}
</script>

<style type="text/css">
.page_on, .page_off { 
	display: inline-block; width: 30px; 
	line-height: 28px; 
}
.page_on { border: 1px solid gray; font-weight: bold;
	color: #fff;  background-color: gray;
}
.page_off:hover { text-decoration: none; }
.page_next, .page_last, .page_first, .page_prev{
	display: inline-block; width: 30px; 
	line-height: 28px; border: 1px solid #d0d0d0;
	text-indent: -9999px;
}
.page_prev {
	background: url("img/page_prev.jpg") center no-repeat;
}
.page_first {
	background: url("img/page_first.jpg") center no-repeat;
}
.page_next {
	background: url("img/page_next.jpg") center no-repeat;
}
.page_last {
	background: url("img/page_last.jpg") center no-repeat;
}
</style>









