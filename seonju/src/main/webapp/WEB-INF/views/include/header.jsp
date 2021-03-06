<%@page import="member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
	String uuid = "";
	uuid = (String) session.getAttribute("orderid");
%> 
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function encoder(menu) {
		location = 'list.pd?kind=' + encodeURI(menu);
		;
	}
</script>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">
<style>
body {
	margin: 0;
	padding: 0;
	background: ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	width: 100%;
}

ul li {
	list-style: none;
}

#header {
	width: 1280px;
	height: 170px;
	margin: 0 auto;
	padding: 0;
	max-width: 1280px;
	min-width: 800px;
	position: relative;
	background-color: #ffffff;
	top: 0;
	color: #222222;
}

a:hover {
	text-decoration: none;
}

.top_nav {
	float: right;
	list-style: none;
	font-size: 12px;
	position: absolute;
	right: 5px;
	top: 0;
}

.top_nav li {
	float: left;
	display: inline-block;
	margin-left: 5px;
	color: #777777;
}

#header .main_menu {
	width: auto;
	position: absolute;
	bottom: 0px;
	right: 0;
	text-align: right;
	z-index: 2;
}

.main_menu li {
	display: inline;
	color: #222222;
	font-size: 20px;
	font-weight: 500;
	float: right;
	text-align: right;
}

.main_menu li a {
	float: left;
}

.category {
	color: #8b4f28;
	font-weight: 500;
}

.icon {
	float: left;
	width: 200px;
	height: 133px;
	margin: 15px 0px 5px 10px;
}

#menu1 {
	height: 80px;
}

#menu1 ul {
	width: 500px;
	margin: 0 auto;
	position: relative;
	float: right;
}

#menu1 #main1>li {
	float: left;
	width: 90px;
	height: 50px;
	line-height: 38px;
	text-align: right;
	margin-left: 50px;
}

#menu1 #main1>li a {
	display: block;
	float: right;
	width: 100px;
	text-align: center;
}

#menu1:hover .menu2 {
	display: block;
}

 .menu2 {
	position: absolute;
	top: 171px;
	right: 0px;
	width: 700px;
	display: none;
	z-index: 2;
	background: #fff;
	border-radius: 0 0 20px 20px;
	border-top: 1px solid #ff95a1;
	box-shadow: 0 1px 1px 1px #e7e7e7;
}

#menu1 .sub {
	float: left;
	width: 15%;
	text-align: center;
	padding: 0;
	margin-left: 35px;
}

.sub li{
	margin: 5px 0 5px 0;
}

.sub li a {
	font-size: 18px;
	font-weight: 400;
}

#menu1 .sub li a:hover {
	color: #ff7a89;
}
</style>

<div style="box-shadow: 0 0 2px 2px #e7e7e7;">
	<div id="header">
		<a onclick="location='index'" class="icon"><img
			src="img/ss_homepage_icon.png" alt="쑥's 초코파이 로고" /></a>
		<ul class="top_nav" style="float: right;">
			<c:if test="${ !empty login_info }">
				<li>[ ${login_info.name } ] <a style="color: red;"
					onclick="location='mypage?userid=${login_info.userid}'">님 반가워요!</a></li>
				<c:if test="${login_info.admin eq 'Y' }"><li><a onclick="location='fileupload'" style="color: #dddddd;">파일</a></li></c:if>
				<!-- 파일 첨부 위해 임시로 만들어놓은 영역, 추후 변경 예정 -->
			</c:if>

			<c:if test="${ !empty login_info }">
				<%-- ${login_info.email } --%>

				<li><a class="btn-fill" onclick="go_logout()">로그아웃</a></li>
				<li><a onclick="location='mypage?userid=${login_info.userid}'"
					class="btn-fill">마이페이지</a></li>
			</c:if>

			<c:if test="${ empty login_info }">
				<li><a id="login1" onclick="location='logintest'"
					class="btn-fill">로그인</a></li>
				<li><a onclick="location='agree'" class="btn-fill">회원가입</a></li>
			</c:if>

			<li><a id="basketList.bs" onclick="Move(this.id)" class="btn-fill">장바구니</a></li>
			<li><a id="buylist.do" onclick="Move(this.id)" class="btn-fill">주문조회</a></li>
            
		</ul>
		<div id="menu1">
			<ul id="main1" class="main_menu">	
				<c:if test="${ login_info.admin eq 'Y' }">
					<li><a class="${category eq 'mb' ? 'category' : '' }"
						onclick="location='list.mb'">고객관리</a></li>
				</c:if>		
				<li><a class="${category eq 'st' ? 'category' : '' }"
					onclick="location='story.main'">쑥's Story</a>
					</li>
				<li><a class="${category eq 'no' ? 'category' : '' }"
					onclick="location='chokodetail.no'">상품안내</a>
					</li>
				<li><a class="${category eq 'bo' ? 'category' : '' }"
					onclick="location='list.pd'">온라인주문</a>
					</li>
				<li><a class="${category eq 'mp' ? 'category' : '' }"
					onclick="location='list.mp'">매장안내</a>
					</li>
				<li><a class="${category eq 'qu' ? 'category' : '' }"
					onclick="location='list.bo'">고객센터</a>
					</li>
			</ul>
			<div class="menu2">
						<ul class="sub">
							<li><a onclick="location='story.main'">쑥's 소개</a></li>
							<li><a onclick="location='awards.main'">쑥's 연혁</a></li>
						</ul>
						<ul class="sub">
							<li><a onclick="location='chokodetail.no'">초코파이</a></li>
							<li><a onclick="location='dakudetail.no'">다쿠아즈</a></li>
							<li><a onclick="location='mrdetail.no'">머랭쿠키</a></li>
							<li><a onclick="alert('준비중입니다.');">파운드케이크</a></li>
							<li><a onclick="alert('준비중입니다.');">초코칩쿠키</a></li>
							<li><a onclick="alert('준비중입니다.');">SET 구성</a></li>
						</ul>
						<ul class="sub">
							<li><a onclick="encoder('초코파이')">초코파이</a></li>
							<li><a onclick="encoder('다쿠아즈')">다쿠아즈</a></li>
							<li><a onclick="encoder('머랭쿠키')">머랭쿠키</a></li>
							<li><a onclick="encoder('파운드케이크')">파운드케이크</a></li>
							<li><a onclick="alert('준비중입니다.');">초코칩쿠키</a></li>
							<li><a onclick="alert('준비중입니다.');">SET 구성</a></li>
						</ul>
						<ul class="sub">
							<li><a onclick="location='list.mp'">본&nbsp;&nbsp;점</a></li>
							<li><a onclick="location='list.mp?no=1'">2호점</a></li>
							<li><a onclick="alert('준비중입니다.');">3호점</a></li>
						</ul>
						<ul class="sub">
							<li><a onclick="location='list.bo'">공지사항</a></li>
							<li><a onclick="location='list.bo?subject=QnA'">Q&A</a></li>
							<li><a onclick="location='list.bo?subject=FAQ'">FAQ</a></li>
							<li><a onclick="location='list.bo?subject=Event'">이벤트</a></li>
						</ul>
					</div>
		</div>
	</div>
</div>

<%--  <!-- 로그인된 경우 --> 메인화면에 로그인입력이있는거
<c:if test="${ !empty login_info }">
	<p style="float: right;">
	${login_info.userid } [ ${login_info.name } ]
	<a class="btn-fill" onclick="go_logout()">로그아웃</a>
	</p>
</c:if>
 --%>
			<script>
                function Move(mid) {
                    var id = "<%=uuid%>";
                    var move = mid;
                    if (id == "null") {
                        alert('로그인하신 후 이용하실 수 있습니다');
                        location = 'logintest';
                    } else {
                    	if(move == "basket.bs"){
                        	location = move;                    	
                    	}else {
                    		location = move;
                    	}
                    }
                }
            </script>
<script type="text/javascript">
	function go_logout() {
		$.ajax({
			type : 'post',
			url : 'logout',
			success : function() {
				location.reload();
			},
			error : function(req, text) {
				alert(text + ": " + req.status);
			}
		});
	}
	function go_login() {
		$.ajax({
			type : 'post',
			data : {
				userid : $('#userid').val(),
				userpwd : $('#userpwd').val()
			},
			url : 'login',
			success : function(result) {
				if (result) { //로그인됨
					location.reload();
				} else {
					alert("아이디나 비밀번호가 일치하지 않습니다!!");
					$('#userid').val('');
					$('#userpwd').val('');
					$('#userid').focus();
				}
			},
			error : function(req, text) {
				alert(text + ": " + req.status);
			}
		});
	}

	/* 메뉴 마우스 호버
	$(document).on('mouseover', '.main_menu li', function(){
		$('#header').css("height","370px");
		$('.row_menu').slideDown(1);
	});
	
	$(document).on('mouseout', '.main_menu li', function () {
	        $('.row_menu').slideUp(1);
	        $('#header').css("height","170px");
	}); */
</script>





