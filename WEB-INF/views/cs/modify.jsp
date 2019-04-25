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

td, th, tr{
	border: 1px solid gray;
}
</style>

<body>
	<h3>게시글 내용 변경</h3>
	<form method="post" action="update.qu" enctype="multipart/form-data"
		id="modify">
		<table style="text-align: center; margin: 0 auto; width: 1000px;">
			<tr>
				<th style="width: 100px;">제목</th>
				<td class="left"><input name="title" type="text" class="need"
					title="제목" value="${vo.title }" style="width: 99%" /></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td class="left">${vo.name }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="left"><textarea name="content" class="need"
						title="내용" style="width: 99%; height: 100px;">${vo.content }</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td class="left"><%@ taglib
						uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
					<c:if test="${ !empty vo.filepath }">
						<original> <a><img id="delete"
							style="vertical-align: middle;" src="img/delete.png" /></a>
						${vo.filename }</original>
					</c:if> <input name="file" type="file" onchange="file_change(this)" /></td>
			</tr>
		</table>
		<br>
		<script type="text/javascript">
			function file_change(f) {
				if ($(f).val() == '') { //취소한 형태
					//원래파일이 보여지게
					var tag = '<a><img id="delete" '
				+ 'style="vertical-align: middle;" ' 
				+ 'src="img/delete.png"/></a>';
					$('original').html(tag + '${vo.filename}');
				} else {
					//원래파일은 안 보이게
					$('original').html('');
				}
			}
			$(document).on('click', '#delete', function() {
				$('original').html('');
				$('[name=delete]').val('y');
			});
		</script>
		<a class="btn-fill" onclick="if( necessary() ){ $('form').submit() }">저장</a>
		<a class="btn-empty"
			onclick="$('form').attr('action', 'detail.qu'); $('form').submit()">취소</a>
		<input type="hidden" name="id" value="${vo.id }" /> 
		<input type="hidden" name="subject" value="${subject }" />
		<input	type="hidden" name="delete" />
	</form>
	<script type="text/javascript" src="js/need_check.js"></script>

</body>
</html>