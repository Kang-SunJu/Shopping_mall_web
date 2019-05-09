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

#new{
	margin: 0 auto;
	width: 1000px;
}
</style>
<body>
	<h3>게시글쓰기</h3>

	<form method="post" action="insert.bo" enctype="multipart/form-data">
		<input type="hidden" name="subject" value="${subject}" />
		<table id="new">
			<tr>
				<th style="width: 100px;">제목</th>
				<td class="left"><input class="need" title="제목"
					style="width: 98.5%" type="text" name="title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="need" title="내용" name="content"
						style="width: 99%; height: 150px;"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td class="left"><input type="file" name="file" /></td>
			</tr>
		</table>
		<br> <a onclick="if( necessary() ) { $('form').submit() }"
			class="btn-fill">저장</a> <a onclick="location='list.bo?subject=${subject}'"
			class="btn-empty">취소</a>
	</form>

	<script type="text/javascript" src="js/need_check.js"></script>





</body>
</html>