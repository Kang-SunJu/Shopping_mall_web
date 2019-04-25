<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	margin: 0;
	padding: 0;
	background: ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}
</style>

<body>
	<h3>공지글 안내</h3>
	<table>
		<tr>
			<th style="width: 15%">제목</th>
			<td class="left" colspan="5">${vo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td class="left">${vo.writer }</td>
			<th style="width: 12%">작성일자</th>
			<td style="width: 18%">${vo.writedate }</td>
			<th style="width: 10%">조회수</th>
			<td style="width: 10%">${vo.readcnt }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="left" colspan="5">${fn:replace(vo.content, crlf, '<br>') }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td class="left" colspan="5">${vo.filename }<c:if
					test="${ !empty vo.filepath }">
					<input onclick="location='download.no?id=${vo.id}'" type="button"
						value="다운로드" />
				</c:if>
			</td>
		</tr>
	</table>
	<br>
	<!-- 로그인한 경우 답글작성 가능 -->
	<a onclick="location='reply.no?id=${vo.id}'" class="btn-fill">답글작성</a>

	<!-- 수정,삭제의 권한은 로그인한 관리자가 갖는다. -->
	<a onclick="location='modify.no?id=${vo.id}'" class="btn-fill">수정</a>
	<a
		onclick="if( confirm('정말 삭제??') ){ location='delete.no?id=${vo.id}' }"
		class="btn-fill">삭제</a>

	<a class="btn-fill" onclick="$('form').submit()">목록으로</a>

	<form action="list.no" method="post">
		<input type="hidden" name="curPage" value="${page.curPage }" /> <input
			type="hidden" name="search" value="${page.search }" /> <input
			type="hidden" name="keyword" value="${page.keyword }" />
	</form>


</body>
</html>





