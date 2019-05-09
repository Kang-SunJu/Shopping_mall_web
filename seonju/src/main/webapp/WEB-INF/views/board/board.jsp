<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style type="text/css">

body {
	margin: 0;
	padding: 0;
	background: ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

#header_nav {
	width: 100%;
	overflow: hidden;
	background-color: white;
	color: black;
	text-align: center;
}

#header_nav ul {
	padding-left: 500px;
}

#header_nav ul li {
	list-style: none;
	float: left;
	width: 10%;
	margin: 0 50px 0 0;
	padding: left;
}

#menu1 {
	width: 378px;
	height: 285;
	margin: 20px 0 40px 0;
	float: left;
}

#contents {
	width: 1500px;
	margin: 0 auto;
	margin-top: 10px;
	overflow: hidden;
}

.detailLeft {
	width: 230px;
	float: left;
}

.detail_submenu4 {no-repeat;
	height: 435px;
	margin-left: 26px;
}

.detail_submenuBox {
	padding: 32px 25px;
	text-align: center;
	font-family: "NanumBarunGothicBold", 'Nanum Gothic';
	font-weight: 700;
}

.detail_submenuBox h2 {
	font-size: 24px;
	color: #703628;
	margin-bottom: 8px;
}

.detail_submenuBox h3 {
	font-size: 12px;
	color: #703628;
}

.detail_submenuList {
	margin-top: 13px;
	border-top: 7px solid #ff95a1;
	border-bottom: 7px solid #ff95a1;
	font-size: 14px;
}

.detail_submenuList ul {
	font-weight: normal;
}

.detail_submenuList li {
	padding: 10px 0px;
	border-bottom: 1px solid #cac9c9;
}

.detail_submenuList li:last-child {
	border-bottom: none;
}

.detail_submenuList a {
	color: #5e5e5e;
}

.detail_submenuList a:hover {
	color: #f78001;
}

.detailRight {
	width: 1200px;
	float: left;
	margin: 100px 0 0 20px;
}
</style>
</head>
<body>
	<div id="contents">
		<div class="detailLeft">
			<div class="detail_submenu4">
				<div class="detail_submenuBox">
					<h2>고객센터</h2>
					<h3>COMMUNITY</h3>
					<div class="detail_submenuList">
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='list.bo">공지사항</a></li>
							<li><a onclick="location='list.bo?subject=QnA'">QnA</a></li>
							<li><a>FAQ</a></li>
							<li><a>PRESS</a></li>
							<li><a>이벤트</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>


	</div>