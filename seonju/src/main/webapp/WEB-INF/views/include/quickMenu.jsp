<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
<style>
#quickMenu {
	position: fixed;
	width: 80px;
	height: 320px;
	right: 20px;
	top: 250px;
	background-color: #ffffff;
	box-shadow: 0 0 1px 1px #e6e6e6;
	color: #222222;
	border-radius: 5px;
	z-index: 1;
}

.quickImg {
	display: inline-block; 
	margin: 0 auto;
	cursor: pointer;
}
</style>   
<!-- 퀵메뉴 영역 -->
<div id="quickMenu">
	<div style="display: inline-block; margin: 7px auto 0 auto;"><img alt="퀵메뉴0" src="img/quick/quick_img0.png"></div>
	<div style="width: 80px; height: 1px; background-color: #eeeeee; display: inline-block; margin: 7px auto 2px auto;"></div>
	<div onclick="location='list.mp'" class="quickImg"><img alt="퀵메뉴1" src="img/quick/quick_img1.png"></div>
	<div onclick="window.open('https://www.instagram.com/sukschoco/?hl=ko')" class="quickImg"><img alt="퀵메뉴2" src="img/quick/quick_img2.png"></div>
	<div id="move_top_btn" class="quickImg"><img alt="퀵메뉴3" src="img/quick/quick_img3.png"></div>
</div>
<!-- 퀵 메뉴 이동 -->
<script>
// 위로가기 버튼 클릭 이벤트
$(function() {
    $("#move_top_btn").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 300);
        return false;
    });
});

/* 배너 이동 스크립트 */
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var quickPosition = parseInt($("#quickMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + quickPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#quickMenu").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();

});
</script>