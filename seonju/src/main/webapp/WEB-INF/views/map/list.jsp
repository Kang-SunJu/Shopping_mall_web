<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}
.guidance {
	width: 1280px;
	margin: 0 auto;
	position: relative;
}

.guidance_header {
	float: left;
	font-size: 22px;
	font-weight: 400;
	margin-top: 40px;
	margin-bottom: 30px;
	display: inline-block;
	width: 300px;
	text-align: left;
	color: #8b4f28;
}

.guidance_content {
	width: 1140px;
	height: 690px;
	display: inline-block;
	border: 1px solid #ffccd2;
	color: #222222;
}

.guidance_con_explanation {
	width: 450px;
	height: 100%;
	background-color: #ffffff;
	display: inline-block;
	float: left;
	position: relative;
}

.guidance_con_map {
	width: 690px;
	height: 100%;
	display: inline-block;
}

.store_name {
	float: left;
	display: inline-block;
}

.store_name_css {
	background-color: #ffccd2;
	color: #222222;
	font-size: 18px;
	font-weight: 500;
	width: 150px;
	line-height: 50px;
}

.store_name a:nth-child(1) {
	padding: 11px 55px;
}

.store_name a:nth-child(2) {
	padding: 11px 54px;
}

.store_name a:nth-child(3) {
	padding: 11px 53px;
}

.default_css {
	background-color: #ffffff;
}

.store_name_click {
	background-color: #ffffff;
	color: #222222;
	font-size: 18px;
	font-weight: 500;
	width: 150px;
	line-height: 50px;
}

.store_img {
	clear: both;
	width: 420px;
	height: 250px;
	background-color: #ffffff;
	position: absolute;
	top: 60px;
	left: 15px;
}

.store_img_mini1, .store_img_mini2, .store_img_mini3 {
	width: 135px;
	height: 100px;
	background-color: #eee;
	display: inline-block;
	position: absolute;
	top: 324px;
}

.store_img_mini1 {
	left: 15px;
}

.store_img_mini2 {
	left: 159px;
}

.store_img_mini3 {
	right: 13px;
}

.store_text {
	width: 420px;
	height: 240px;
	position: absolute;
	top: 436px;
	left: 15px;
}
</style>
</head>
<body>
	<div class="guidance">
		<div class="guidance_header">
			<div
				style="width: 4px; height: 18px; background-color: #8b4f28; display: inline-block; margin-left: 10px;"></div>
			<font>매장안내</font>
		</div>
		<div class="guidance_content">
			<div class="guidance_con_explanation">
				<div class="store_name">
					<a id="store_firstbtn" class="store_name_css default_css"
						onclick="reply_click()">본점</a>
				</div>
				<div class="store_name">
					<a id="store_secondbtn" class="store_name_css"
						onclick="reply_click()">2호점</a>
				</div>
				<div class="store_name">
					<a id="store_thirdbtn" class="store_name_css"
						onclick="reply_click()">3호점</a>
				</div>
				<c:forEach items="${mapList }" var="mapList" varStatus="status">
					<c:if test="${status.index eq no }">
						<div class="store_img">
							<img alt="가게 사진1" src="${mapList.storeImg1 }" id="store_pic1" />
						</div>
						<div class="store_img_mini1">
							<img alt="가게 사진2" src="${mapList.storeImg2 }" id="store_pic2" />
						</div>
						<div class="store_img_mini2">
							<img alt="가게 사진3" src="${mapList.storeImg3 }" id="store_pic3" />
						</div>
						<div class="store_img_mini3">
							<img alt="가게 사진4" src="${mapList.storeImg4 }" id="store_pic4" />
						</div>
						<div class="store_text" id="store_content_text"><%-- ${mapList.storeCon } --%><img alt="맵 컨텐츠" src="img/map/map_con1.png" id="store_con" /></div>
					</c:if>
				</c:forEach>
			</div>
			<div class="guidance_con_map" id="map"></div>
		</div>
	</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fcdeae4e6b4245a6231f3f17685837e7&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
		var juso;

		/* 지도 API */
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		if('${no}'==0){
			var juso = '광주 광산구 송정로8번길 27 1층';
		}else if('${no}'==1){
			var juso = '전라남도 여수시 중앙로 43';
		}

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						juso,
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === daum.maps.services.Status.OK) {

								var coords = new daum.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new daum.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new daum.maps.InfoWindow(
										{
											content : '<div style="width:220px;text-align:center;padding:6px 0;">쑥\'s 초코파이<br/>' + juso + '</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});

		/* 항목 클릭시 색, 내용 변경 */

		/* 첫 번째 버튼 클릭 시 */
		$('#store_firstbtn').click(function() {
			$('#store_firstbtn').removeClass('store_name_css');
			$('#store_firstbtn').addClass('store_name_click');
			$('#store_secondbtn').removeClass('store_name_click');
			$('#store_secondbtn').addClass('store_name_css');
			$('#store_thirdbtn').removeClass('store_name_click');
			$('#store_thirdbtn').addClass('store_name_css');

			$('#store_pic1').attr("src", "${mapList[0].storeImg1}");
			$('#store_pic2').attr("src", "${mapList[0].storeImg2}");
			$('#store_pic3').attr("src", "${mapList[0].storeImg3}");
			$('#store_pic4').attr("src", "${mapList[0].storeImg4}");
			$('#store_con').attr("src", "img/map/map_con1.png");
			/* $('#store_content_text').text("${mapList[0].storeCon }"); */
		});

		/* 두 번째 버튼 클릭 시 */
		$('#store_secondbtn').click(function() {
			$('#store_secondbtn').removeClass('store_name_css');
			$('#store_secondbtn').addClass('store_name_click');
			$('#store_firstbtn').removeClass('store_name_click default_css');
			$('#store_firstbtn').addClass('store_name_css');
			$('#store_thirdbtn').removeClass('store_name_click');
			$('#store_thirdbtn').addClass('store_name_css');

			$('#store_pic1').attr("src","${mapList[1].storeImg1}");
			$('#store_pic2').attr("src","${mapList[1].storeImg2}");
			$('#store_pic3').attr("src","${mapList[1].storeImg3}");
			$('#store_pic4').attr("src","${mapList[1].storeImg4}");
			$('#store_con').attr("src", "img/map/map_con2.png");
			/* $('#store_content_text').text("${mapList[1].storeCon }"); */
		});

		/* 세 번째 버튼 클릭 시 */
		$('#store_thirdbtn').click(function() {
			$('#store_thirdbtn').removeClass('store_name_css');
			$('#store_thirdbtn').addClass('store_name_click');
			$('#store_firstbtn').removeClass('store_name_click default_css');
			$('#store_firstbtn').addClass('store_name_css');
			$('#store_secondbtn').removeClass('store_name_click');
			$('#store_secondbtn').addClass('store_name_css');

			$('#store_pic1').attr("src","${mapList[2].storeImg1}");
			$('#store_pic2').attr("src","${mapList[2].storeImg2}");
			$('#store_pic3').attr("src","${mapList[2].storeImg3}");
			$('#store_pic4').attr("src","${mapList[2].storeImg4}");
			$('#store_con').attr("src", "img/map/map_con3.png");
			/* $('#store_content_text').text("${mapList[2].storeCon }"); */
		});

		function reply_click() {
			//alert(event.srcElement.id);
			if ((event.srcElement.id) == ('store_firstbtn')) {
				juso = '광주 광산구 송정로8번길 27 1층';
			} else if ((event.srcElement.id) == ('store_secondbtn')) {
				juso = '전라남도 여수시 중앙로 43';
			} else if ((event.srcElement.id) == ('store_thirdbtn')) {
				juso = '광주 광산구 송정로8번길 27 1층';
			}
			// alert(juso);
			//return juso;

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							juso,
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === daum.maps.services.Status.OK) {

									var coords = new daum.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new daum.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new daum.maps.InfoWindow(
											{
												content : '<div style="width:220px;text-align:center;padding:6px 0;">쑥\'s 초코파이<br/>' + juso + '</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});

		}
</script>
</body>
</html>