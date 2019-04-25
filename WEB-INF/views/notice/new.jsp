<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h3>공지글쓰기</h3>
<!-- 파일첨부 
1. form 태그의 method는 반드시 post 방식으로 지정한다.
2. form 태그의 enctype 을 multipart/form-data
-->
<form method="post" action="insert.no" enctype="multipart/form-data">
<table>
<tr><th style="width: 20%">제목</th>
	<td class="left"><input title="제목" class="need" style="width: 98.5%" type="text" name="title"/></td>
</tr>
<tr><th>작성자</th>
	<td class="left"><input title="작성자" class="need" type="text" name="writer"/></td>
</tr>
<tr><th>내용</th>
	<td><textarea title="내용" class="need" name="content" style="width: 99%; height: 200px;"></textarea></td>
</tr>
<tr><th>첨부파일</th>
	<td class="left"><input type="file" name="file" /></td>
</tr>
</table><br>
<a class="btn-fill" 
	onclick="if( necessary() ){ $('form').submit() }">저장</a>
<a class="btn-empty" onclick="location='list.no'">취소</a>
</form>
<script type="text/javascript" src="js/need_check.js"></script>
</body>
</html>



