<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	InetAddress local = InetAddress.getLocalHost();
	String ip = local.getHostAddress();
%>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="./css/lightslider.css" />
<link rel="stylesheet" href="./css/home.css" />
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<html>
<head>
<title>Home</title>
<style type="text/css">
.bgimg-1 {
	background-image: url("img/main_scroll_img.jpg");
}

.control_button {
	background: url("img/slide/point_button.png");
}
</style>
</head>
<body>
	<!-- 메인 슬라이드 영역 / 이미지는 추후 변경 예정 -->
	<div class="animation_canvas">
		<div class="slider_panel">
			<c:forEach items="${mainSlideList }" var="mainSlideList">
				<img
					src="/seonju/resources${mainSlideList.mspath }"
					class="slider_image" />
			</c:forEach>
		</div>
		<div class="control_panel">
			<div class="control_button"></div>
			<div class="control_button"></div>
			<div class="control_button"></div>
		</div>
	</div>
	<!-- 비디오 영역 -->
	<div class="main_video_area">
		<div class="video_area">
			<video src="img/ssuk.mp4" type="video/mp4" controls="controls" class="video_css"></video>
			<div class="video_text_area">
				<p class="video_text_title">프리미엄 디저트</p>
				<p class="video_text_content">건강한 재료와 맛을 지키기 위해.</p>
				<br /> <br />
				<p class="video_text_content">
					쑥's 초코파이는 건강한 재료를 사용하여 만든<br />바른 디저트를 추구합니다. 건강하지만 맛있고,<br />맛있지만
					건강한 쑥's 초코파이만의 프리미엄 디저트.
				</p>
				<br /> <br />
				<p class="video_text_content">
					정성이 필요한 순간, 행복이 필요한 순간,<br />쑥's 초코파이와 함께하세요.
				</p>
			</div>
		</div>
		<%-- <c:forEach items="${videoList }" var="videoList">
				<video src="/changego/resources${videoList.videoPath }" type="video/mp4" controls="controls"
				width="400"></video>
			</c:forEach> --%>
	</div>
	<!-- 스크롤 이벤트 -->
	<div style="height: 400px;">
		<div class="bgimg-1">
			<div class="caption">
				<span class="border">건 강 한&nbsp;&nbsp;&nbsp;디 저 트</span>
			</div>
		</div>
	</div>
	<!-- 중간 컨텐츠 영역 -->
	<div class="mid_con">
		<div class="mid_con_title">
			<div class="mid_con_title_menu">메뉴</div>
		</div>
		<!-- 메뉴 슬라이드 -->
		<div class="demo">
			<div class="item">
				<ul id="content-slider" class="content-slider">
					<c:forEach items="${menuSlideList }" var="menuSlideList" begin="0"
						end="8">
						<li class="content-slider-con"><img class="menu_img_css"
							src="changego/resources${menuSlideList.menupath }"
							alt="메뉴 이미지" /> <span><a style="text-decoration: none;">${menuSlideList.menuContent }</a></span>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- 공지사항  -->
		<div class="mid_notice">
			<!-- <form method="post" action="list.ho"> -->
			<table
				style="border-spacing: 0; width: 390px; height: 160px; float: left; margin: 0; border: 1px solid #ff95a1;">
				<tr
					style="background-color: #ff95a1; border: 1px solid #ff95a1; height: 37px;">
					<th class="notice_th" style="font-size: 18px; font-weight: 400; padding-left: 10px;">공지사항</th>
					<td onclick="location='list.bo'"
						style="float: right; padding-right: 10px; border: none; font-size: 20px; color: #ffffff; font-weight: 500;"><a
						style="text-decoration: none;">+</a></td>
				</tr>
				<tr>
					<td colspan="2"
						style="border: 1px solid #ff95a1; padding: 0; padding-left: 10px;">
						<ul style="list-style: none; padding-left: 0;">
							<c:forEach items="${list }" var="vo" begin="0" end="2">
								<li class="notice_txt" style="width:270px;"><a>· ${vo.title }</a></li>
								<li class="notice_date" style="width: 80px;">${vo.writedate }</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
			</table>
			<br>
			<!-- </form> -->
		</div>
		<!-- 아이콘 버튼 -->
		<div class="mid_con_btn">
			<a href="list.pd"><img alt="배너 이미지" src="img/banner.png" /></a>
			<!-- <div class="mid_con_btn1">여기</div>
			<div class="mid_con_btn2">뭐</div>
			<div class="mid_con_btn3">넣을</div>
			<div class="mid_con_btn4">까요</div> -->
		</div>
		<!-- 인스타 -->
			<div class="instar_name_area">
				<p style="margin: 0;">쑥's 초코파이</p>
			</div>
		<div class="instar_area" id="instaPics">
			<!-- <img src="img/instar_ex.png" alt="인스타 예시 사진" /> -->
		</div>
	</div>
	<script type="text/javascript">
		jQuery(function($) {
			var tocken = "1587812767.5890fe4.60f7f354b69848d18ec792764b56aea6"; /* Access Tocken 입력 */
			var count = "30";
			$
					.ajax({
						type : "GET",
						dataType : "jsonp",
						cache : false,
						url : "https://api.instagram.com/v1/users/self/media/recent/?access_token="
								+ tocken + "&count=" + count,
						success : function(response) {
							if (response.data.length > 0) {
								for (var i = 0; i < response.data.length; i++) {
									var insta = '<div class="insta-box">';
									insta += '<div class="insta_profileImg"><img class="insta_pp" src="' 
													+ response.data[i].user.profile_picture + '"/></div>';
									insta += "<a target='_blank' href='" + response.data[i].link + "'>";
									insta += "<div class='image-layer'>";
									//insta += "<img src='" + response.data[i].images.thumbnail.url + "'>";  
									insta += '<img class="insta-img" src="' + response.data[i].images.thumbnail.url + '"/>';
									insta += "</div>";
									//console.log(response.data[i].caption.text);  
									if (response.data[i].caption !== null) {
										insta += "<div class='caption-layer'>";
										if (response.data[i].caption.text.length > 0) {
											insta += "<p class='insta-caption'>"
													+ response.data[i].caption.text
													+ "</p>"
										}
										insta += "<span class='insta-likes'><font class='heart'>♥&nbsp;</font>"
												+ response.data[i].likes.count
												+ " Likes</span>";
										insta += "</div>";
									}
									insta += "</a>";
									insta += "</div>";
									insta += "<div class='insta_line'></div>";
									$("#instaPics").append(insta);
								}
							}
							$/* (".insta-box").hover(function() {
								$(this).find(".caption-layer").css({
									"backbround" : "rgba(255,255,255,0.7)",
									"display" : "block"
								});
							}, function() {
								$(this).find(".caption-layer").css({
									"display" : "none"
								});
							});  */
						}
					});
		});
	</script>
	<!-- 슬라이드 영역 -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="./js/lightslider.js"></script>
	<!-- 동영상 플러그인 -->
	<script src="http://vjs.zencdn.net/c/video.js"></script>
	<script>
		$(document).ready(
				function() {
					var imgCnt = $(' .slider_panel').children().length; // 슬라이더 이미지의 개수를 가져오는 것
					var imgIdx = 1;
					var refreshInterval = null;
					var timer = null;

					// 슬라이더를 움직여주는 함수
					function moveSlider(index) {
						// 슬라이더를 이동
						var willMoveLeft = -(index * 1280);
						$(' .slider_panel').animate({
							left : willMoveLeft
						}, 'slow');

						// control_button에 active 클래스를 부여/제거
						$(' .control_button[data-index=' + index + ']')
								.addClass('active');
						$(' .control_button[data-index!=' + index + ']')
								.removeClass('active');

					}
					; //moveSlider()

					timer = function() {
						moveSlider(imgIdx);

						if (imgIdx < imgCnt - 1) {
							imgIdx++;
						} else {
							imgIdx = 0;
						} // if
					}; // timer = function(){} 

					// 초기 텍스트 위치 지정 및 data-index 할당
					$(' .slider_text').css('left', -300).each(function(index) {
						$(this).attr('data-index', index);
					});

					// 컨트롤 버튼의 클릭 핸들러 지정 및 data-index 할당
					$(' .control_button').each(function(index) {
						$(this).attr('data-index', index);
					}).click(function() {
						var index = $(this).attr('data-index');
						imgIdx = index;
						moveSlider(index);
					});

					// 초기 컨트롤 0번째를 active로
					$(' .control_button[data-index=' + 0 + ']').addClass(
							'active');
					$(' .slider_text[data-index=' + 0 + ']').show().animate({
						left : 0
					}, 'slow');
					refreshInterval = setInterval(timer, 3000);

					$(' .animation_canvas').on({
						mouseenter : function() {
							clearInterval(refreshInterval);
						},
						mouseleave : function() {
							refreshInterval = setInterval(timer, 3000);
						}
					});
					/* 메뉴 슬라이드 영역 */
					$("#content-slider").lightSlider({
						loop : true,
						keyPress : true
					});
					$('#image-gallery').lightSlider({
						gallery : true,
						item : 1,
						thumbItem : 9,
						slideMargin : 0,
						speed : 500,
						auto : true,
						loop : true,
						onSliderLoad : function() {
							$('#image-gallery').removeClass('cS-hidden');
						}
					});
				});
	</script>

</body>


</html>