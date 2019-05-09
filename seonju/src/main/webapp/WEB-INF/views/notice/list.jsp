<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

#list-top {
	width: 80%;
	padding-left: 10%;
	padding-bottom: 20px;
}
</style>
</head>
<body>
	<h3>공지글 목록</h3>
	<form id="list" method="post" action="list.no">
		<input type="hidden" name="curPage" />
		<p id="list-top">
			<span style="float: left;"> <select name="search"
				style="height: 28px; width: 92px;">
					<option ${page.search eq 'all' ? 'selected' : '' } value="all">전체</option>
					<option ${page.search eq 'title' ? 'selected' : '' } value="title">제목</option>
					<option ${page.search eq 'writer' ? 'selected' : '' }
						value="writer">작성자</option>
					<option ${page.search eq 'content' ? 'selected' : '' }
						value="content">내용</option>
			</select> <input name="keyword" type="text" value="${page.keyword }"
				style="vertical-align: top; width: 350px;" /> <a
				onclick="$('form').submit()" class="btn-fill">검색</a>
			</span>

			<!-- 관리자로 로그인한 경우만 글쓰기버튼이 활성화되게 -->
			<c:if test="${ login_info.admin eq 'Y' }">
				<a onclick="location='new.no'" style="float: right;"
					class="btn-fill">글쓰기</a>
			</c:if>
		</p>
	</form>

	<table border="1">
		<tr>
			<th style="width: 80px">번호</th>
			<th>제목</th>
			<th style="width: 15%">작성자</th>
			<th style="width: 65px;">첨부파일</th>
		</tr>
		<c:forEach items="${page.list }" var="vo">
			<tr>
				<td>${vo.no }</td>
				<td class="left"><c:forEach var="i" begin="1"
						end="${vo.indent }">
	 ${i eq vo.indent ? '<img src="img/re.gif"/>' : '&nbsp;&nbsp;' }
	</c:forEach> <a onclick="location='detail.no?id=${vo.id}'">${vo.title }</a></td>
				<td>${vo.writer }</td>
				<td>${!empty vo.filepath ? '<img src="img/attachfile.png"/>' : ''}</td>
			</tr>
		</c:forEach>

	</table>
	<br>

	<jsp:include page="/WEB-INF/views/include/page.jsp" />

</body>
</html>






