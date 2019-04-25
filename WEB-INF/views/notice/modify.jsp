<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<h3>공지글안내 변경</h3>
	<form method="post" enctype="multipart/form-data" action="update.no">
		<input type="hidden" name="id" value="${vo.id }" />
		<table>
			<tr>
				<th style="width: 20%">제목</th>
				<td><input name="title" class="need" title="제목"
					style="width: 98.5%" type='text' value="${vo.title }" /></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td class="left">${vo.writer }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" class="need" title="내용"
						style="width: 99%; height: 150px;">${vo.content }</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td class="left"><c:if test="${ !empty vo.filepath }">
						<original> <a><img style="vertical-align: middle;"
							id="delete" src="img/delete.png" /></a>&nbsp;&nbsp;${vo.filename } </original>
					</c:if> <input onchange="file_change(this)" type="file" name="file" /></td>
			</tr>
		</table>
		<br> <a onclick="if( necessary() ){ $('form').submit() }"
			class="btn-fill">저장</a> <a onclick="location='detail.no?id=${vo.id}'"
			class="btn-empty">취소</a> <input type="hidden" name="attach" />
	</form>
	<script type="text/javascript">
		$(function() {
			$(document).on('click', '#delete', function() {
				$('original').html('');
				$('[name=attach]').val('n');
			});
		});

		function file_change(f) {
			if ($(f).val() != '') {
				//새로운 파일을 선택한 경우
				//원래 파일명은 보이지 않게
				$('original').html('');
			} else {
				//원래 파일명이 보이게
				var tag = '<a><img style="vertical-align: middle;" id="delete" '
				+ 'src="img/delete.png"/></a>&nbsp;&nbsp;';
				$('original').html(tag + '${vo.filename}');
			}
		}
	</script>
	<script type="text/javascript" src="js/need_check.js"></script>

</body>
</html>





