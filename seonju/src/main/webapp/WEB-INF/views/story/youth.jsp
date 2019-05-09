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
<title>소녀감성으로 만든 쑥'S 초코파이</title>
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
					<h2>쑥'S Story</h2>
					<h3>청년상인</h3>
					<div class="detail_submenuList">
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='story.main'">쑥's 소개</a></li>
							<li><a onclick="location='awards.main'" >쑥's 소식</a></li>
							<li><a onclick="location='back.main'">배경</a></li>
							<li><a onclick="location='youth.main'"style="color: #f78001;">청년상인</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="content" class="">
			<div id="content_main">
				<h3>청년상인</h3>
				<hr style="display: inherit;">
				<p>쑥'S의 청년상인</p>
			</div>
			<br>
			<hr id="front_under" style="margin: 0 auto;">
			<div id="" style="">추가설명칸입니다</div>
		</div>
	</div>
</body>

</html>