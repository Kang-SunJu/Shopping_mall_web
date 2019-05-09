<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객목록</title>
<style type="text/css">
body {
	margin: 0 auto;
	padding: 0;
	background: ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

.title_p {
	font-size: 30px;
	font-weight: 600;
}

table {
	width: 700px;
	border-spacing: 0;
	border-collapse: collapse;
}

table th {
	font-size: 20px;
	font-weight: 500;
	padding: 5px;
}

table td {
	font-size: 18px;
	font-weight: 400;
	padding: 5px;
}

</style>
</head>
<body>
	<div style="margin-bottom: 20px;">
		<p class="title_p">〈 고객목록 〉</p>
		<div style="display: inline-block;">
			<table border="1px solid #e8e8e8;" >
				<tr style="background-color: #eee;">
					<th width="100px">번호</th>
					<th width="200px">성명</th>
					<th>이메일</th>
				</tr>
				<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.no }</td>
						<td><a onclick="location='mypage?userid=${vo.userid}'">${vo.name }</a></td>
						<td>${vo.email}</td>
					</tr>
				</c:forEach>

			</table>
		</div>
		<br />
		<br />
		<br /> <a class="btn-empty" onclick="location='member'">신규고객</a> <a
			class="btn-empty" onclick="location='index'">홈으로</a>
	</div>
</body>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>