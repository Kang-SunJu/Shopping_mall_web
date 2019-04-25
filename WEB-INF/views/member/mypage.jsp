<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<style type="text/css">
body {
	margin: 0 auto;
	padding: 0;
	background: ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

.title_div {
	display: inline-block;
	margin: 40px auto 0 auto;
	width: 800px;
	height: 200px;
	background-repeat: no-repeat;
	background-image: url('img/member_title_img.png');
	line-height: 130px;
	border-radius: 15px 15px 0 0;
}

.title_div p {
	color: #fff;
	font-size: 34px;
}

table {
	border: 1px solid #ddd;
	border-radius: 0 0 15px 15px;
	margin-left: 4px;
	margin-bottom: 50px;
	padding: 15px;
}

table th {
	padding: 0;
	font-size: 20px;
	font-weight: 500;
	color: #222;
}

table td {
	text-align: left;
	font-size: 18px;
	font-weight: 400;
	color: #333;
}

.valid, .invalid {
	font-size: 9pt;
	font-weight: bold;
}

.valid {
	color: #ff95a1;
}

.invalid {
	color: red;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<div style="width: 1280px; margin: 0 auto;">
		<div class="title_div">
			<p style="display: inline-block;">[${vo.name }]마이페이지</p>
		</div>
		<form method="post">
			<div style="display: inline-block;">
				<table style="width: 800px; height: 500px;">
					<tr>
						<th style="width: 120px;">성명</th>
						<td>${vo.name }</td>
					</tr>
					<tr>
						<th style="width: 120px;">
							<div
								style="width: 100px; height: 1px; background-color: #eee; margin: 0 auto;"></div>
						</th>
						<td style="margin: 0 auto; text-align: center;">
							<div
								style="width: 600px; height: 1px; background-color: #eee; text-align: left;"></div>
						</td>
					</tr>
					<tr>
						<th><font color="red"></font> 아이디</th>
						<td>${vo.userid }</td>
					</tr>
					<tr>
						<th style="width: 120px;">
							<div
								style="width: 100px; height: 1px; background-color: #eee; margin: 0 auto;"></div>
						</th>
						<td style="margin: 0 auto; text-align: center;">
							<div
								style="width: 600px; height: 1px; background-color: #eee; text-align: left;"></div>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${vo.email }</td>
					</tr>
					<tr>
						<th style="width: 120px;">
							<div
								style="width: 100px; height: 1px; background-color: #eee; margin: 0 auto;"></div>
						</th>
						<td style="margin: 0 auto; text-align: center;">
							<div
								style="width: 600px; height: 1px; background-color: #eee; text-align: left;"></div>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${vo.birth }</td>
					</tr>
					<tr>
						<th style="width: 120px;">
							<div
								style="width: 100px; height: 1px; background-color: #eee; margin: 0 auto;"></div>
						</th>
						<td style="margin: 0 auto; text-align: center;">
							<div
								style="width: 600px; height: 1px; background-color: #eee; text-align: left;"></div>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${vo.phones }</td>
					</tr>
					<tr>
						<th style="width: 120px;">
							<div
								style="width: 100px; height: 1px; background-color: #eee; margin: 0 auto;"></div>
						</th>
						<td style="margin: 0 auto; text-align: center;">
							<div
								style="width: 600px; height: 1px; background-color: #eee; text-align: left;"></div>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${vo.post}<br />${vo.addresses }</td>
					</tr>
				</table>
			</div>
			<br> <a class="btn-fill"
				onclick="location='modify?userid=${vo.userid}'">수정</a> <a
				class="btn-fill"
				onclick="if( confirm('정말 삭제하시겠습니까?')  ){ location='delete.mb?userid=${vo.userid}' }">회원탈퇴</a>
			<a class="btn-empty" onclick="location='home'">홈으로</a> <input
				type="hidden" id="id_check" value="n" />
			<c:if test="${login_info.admin eq 'Y' }">
				<a class="btn-empty" onclick="location='list.mb'">고객목록</a>
			</c:if>
		</form>
	</div>

</body>
<br />
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>