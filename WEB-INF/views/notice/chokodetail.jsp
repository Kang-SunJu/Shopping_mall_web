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

#contents {
	width: 1280px;
	margin: 5px auto;
	overflow: hidden;
}

.detailLeft {
	width: 220px;
	float: left;
}

.detail_submenu4 {
	background-repeat: no-repeat;
	height: 435px;
	margin-left: 26px;
}

.detail_submenuBox {
	padding: 32px 25px;
	text-align: center;
}

.detail_submenuBox p:nth-child(1) {
	font-size: 24px;
	color: #fff;
	display: inline-block;
	background-color: #986457;
	width: 150px;
	line-height: 90px;
	margin: 0;
	font-weight: 500;
}

.detail_submenuBox p:nth-child(2) {
	font-size: 20px;
	color: #703628;
	display: inline-block;
	background-color: #f3f3f3;
	width: 150px;
	line-height: 90px;
	margin: 0;
	font-weight: 500;
}

.detail_submenuList {
	border: 1px solid #f3f3f3;
	font-size: 18px;
	width: 148px;
}

.detail_submenuList ul {
	font-weight: normal;
	margin: 15% 5%;
}

.detail_submenuList ul:nth-child(2) {
	font-weight: normal;
	margin: 15% 0;
}

.detail_submenuList a {
	color: #333333;
}

.img_div {
	display: inline-block;
}
.chokodetail {

}

.chokodetail0 {
	width: 800px;
	height: 150px;
}
</style>
</head>
<body>

	<div id="contents">
		<div class="detailLeft">
			<div class="detail_submenu4">
				<div class="detail_submenuBox">
					<p>상품안내</p>
					<p>메뉴</p>
					<div class="detail_submenuList">
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='chokodetail.no'"
								style="color: #ff95a1;">초코파이</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='dakudetail.no'">다쿠아즈</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='mrdetail.no'">머랭쿠키</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="">파운드케이크</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location=''">초코칩쿠키</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="">set구성</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="content1" class="img_div">
			<ul style="padding: 0;">
				<li>
					<div style="display: inline-block;">
						<img alt="" src="img/배너.PNG" class="chokodetail0" style="display: inline-block;" /> 
					</div>
				</li>
			</ul>
		</div>
		<div id="content2" class="img_div">
			<ul style="padding: 0;">
				<li>
					<div style="display: inline-block;">
						<img style="margin: 0 auto; display: inline-block;" alt="" src="img/m1.JPG"
							class="chokodetail"/>
					</div>
				</li>
			</ul>
			<ul style="padding: 0;">
				<li>
					<div style="display: inline-block;">
						<img style="margin: 0 auto; display: inline-block;"  alt="" src="img/m2.JPG" class="chokodetail">
					</div>
				</li>
			</ul>
			<ul style="padding: 0;">
				<li>
					<div style="display: inline-block;">
						<img style="margin: 0 auto; display: inline-block;"  alt="" src="img/m3.JPG" class="chokodetail">
					</div>
				</li>
			</ul>
			<ul style="padding: 0;">
				<li>
					<div style="display: inline-block;">
						<img style="margin: 0 auto; display: inline-block;"  alt="" src="img/m4.JPG" class="chokodetail">
					</div>
				</li>
			</ul>
			<ul style="padding: 0;">
				<li>
					<div style="display: inline-block;">
						<img style="margin: 0 auto; display: inline-block;"  alt="" src="img/m5.JPG" class="chokodetail">
					</div>
				</li>
			</ul>
			<ul style="padding: 0;">
				<li>
					<div style="display: inline-block;">
						<img style="margin: 0 auto; display: inline-block;"  alt="" src="img/m6.JPG" class="chokodetail">
					</div>
				</li>
			</ul>
			<ul style="padding: 0;">
				<li>
					<div style="display: inline-block;">
						<img style="margin: 0 auto; display: inline-block;"  alt="" src="img/m7.JPG" class="chokodetail">
					</div>
				</li>
			</ul>


		</div>

	</div>




</body>
</html>
