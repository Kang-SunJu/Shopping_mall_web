<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>고객목록</h3>
<table border="1">
<tr><th width="60px">번호</th>
	<th width="150px">성명</th><th>이메일</th></tr>
<c:forEach items="${list }" var="vo">
<tr><td>${vo.no }</td>
	<td><a onclick="location='detail.cs?id=${vo.id}'">${vo.name }</a></td><td>${vo.email}</td></tr>
</c:forEach>

</table><br>
<input type="button" value="신규고객" 
				onclick="location='new.cs'"/>

</body>
</html>