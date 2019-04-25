<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ver" value="<%=new java.util.Date().getTime()%>" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>소녀감성으로 만든 쑥's 초코파이</title>
<link rel="stylesheet" href="css/story_common.css?version=${ver }">
<link rel="stylesheet" href="css/story_common_2.css?version=${ver }">
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
	<div id="wrap">
		<div class="detailLeft">
			<div class="detail_submenu4">
				<div class="detail_submenuBox">
					<p>쑥's Story</p>
					<p>연혁</p>
					<div class="detail_submenuList">
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='story.main'">쑥's 소개</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='awards.main'"
								style="color: #ff95a1">쑥's 연혁</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="content">
			<div style='max-width: 1000px; margin: 0 auto;'>
				<p
					style='font-size: 40px; color: #000; text-align: center; margin-top: 50px; magin-bottom: 60px;'
					class='big_title'>
					<img width="300px" height="auto" src="img/story/introduceLogo.png"
						alt="회사소개 로고" />
				</p>
				<p
					style='width: 150px; border-top: 2px solid #ddd; margin: 30px auto;'></p>
				<p style='margin-top: 70px'>
					<img width="1000px;" height="auto" src="img/story/story_img2.png"
						alt="banner" class='head-img'>
				</p>
				<p>
					<img src="img/story/history.png" alt="연혁" width="900px;"
						height="auto;" style="margin: 10px 0 20px 0;" />
				</p>
			</div>
			<!-- <div id="content_main">
				<h3>쑥's 소식</h3>
				<hr style="display: inherit;">
				<div style="float: center; overflow: scroll; text-align: left; width: 500px; height: 500px; padding: 10px; border: 0px solid; padding: 10px; margin: 0px auto;">
					<h3>쑥's 초코파이</h3>
					<p>2016년 03월 25일</p>
					<p>쑥스초코파이(광주) 본점 오픈</p>
					<p>2016년 09월 24일</p>
					<p>청년상인 경연대회 [우수상] 수상</p>
					<p>2016년 11월 15일</p>
					<p>맛깔나는 전통시장푸드쇼 [우수상] 수상</p>
					<p>2018년 07월 06일</p>
					<p>쑥스초코파이(여수) 1호점 오픈</p>
					<p>2018년 11월 08일</p>
					<p>맛깔나는 전통시장푸드쇼 [장려상] 수상</p>
					<p>2018년 11월 08일</p>
					<p>광주전남 지방중소기업청 전통시장 청년상인 [우수사례선정] 선정</p>
				</div>
			</div> -->
		</div>
	</div>
</body>
</html>