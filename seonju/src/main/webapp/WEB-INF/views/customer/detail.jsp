<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<h3>[ ${vo.name } ] 고객상세정보</h3>
<table border="1" style="width: 60%">
<tr><th style="width: 100px;">성별</th>
	<td>${vo.gender }</td></tr>
<tr><th>이메일</th>
	<td>${vo.email }</td></tr>
<tr><th>연락처</th>
	<td>${vo.phones }</td></tr>
</table><br>
<a class="btn-fill" 
	onclick="location='modify.cs?id=${vo.id}'">정보수정</a>
<a class="btn-fill"
	onclick="if( confirm('삭제??')  ){ location='delete.cs?id=${vo.id}' }">고객삭제</a>	
<a class="btn-fill" onclick="location='new.cs'">신규고객</a>
<a class="btn-empty" onclick="location='list.cs'">고객목록</a>

</body>
</html>







