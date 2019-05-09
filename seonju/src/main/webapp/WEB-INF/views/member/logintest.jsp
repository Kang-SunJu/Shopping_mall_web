<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">
.hr-sect {
	display: flex;
	flex-basis: 10%;
	align-items: center;
	color: #222;
	font-size: 20px;
	margin: 8px 0px;
	font-family: 'Noto Sans KR', sans-serif;
}

.hr-sect::before, .hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}

body {
	margin: 0;
	padding: 0;
	background: ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	color: #222;
}

.text_title {
	width: 70px;
	font-size: 24px;
	font-weight: 500;
	font-family: 'Noto Sans KR', sans-serif;
}

.text_box {
	width: 300px;
	margin: 10px 10px;
}

.login-box {
	display: inline-block;
}

.login-btn {
	font-size: 30px;
	font-weight: 500;
	background-color: #ff95a1;
	color: #ffffff;
	padding: 3px 10px;
	text-align: center;
	border: 1px solid #ff95a1;
	border-radius: 3px;
	box-shadow: 0px 0px 4px #ff95a1;
	text-decoration: none;
	margin-left: 20px;
}

table td {
	padding: 0;
	border: none;
}
</style>

</head>

<div class="hr-sect">
	<p style="display: inline-block; font-size: 34px; font-weight: 700;">로그인</p>
</div>
<div style="display: inline-block; margin-bottom: 80px;">
	<c:if test="${ empty login_info }">
		<div class="login-box">
			<table style="border: none;">


				<tr>
					<td class="text_title">ID</td>
					<td><input type="text" placeholder="아이디를 입력해주세요" id="userid"
						class="text_box" style="height: 40px;" /></td>
					<td rowspan="2"><a class="login-btn"
						style="width: 100px; height: 150px;"
						onclick="go_login()">로그인</a></td>
				</tr>
				<tr>
					<td class="text_title">PW</td>
					<td><input style="height: 40px;"
						onkeyup="if( event.keyCode==13 ) go_login();" type="password"
						placeholder="비밀번호를 입력해주세요" id="userpwd" class="text_box" /></td>
				</tr>
			</table>
			<br />

		</div>
	</c:if>

	<c:if test="${ empty login_info }">
		<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
		<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
		<div id="naver_id_login" style="text-align: center"
			style="margin: 0 auto;">
			<p style="display: inline-block; margin: 5px;">
				<%-- <a onclick="" href="${url}"> <img width="222" height="49"
					src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
				</a> --%>
				<a onclick="naverlogin()"><img width="222" height="49"
					src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
				</a>
			</p>
			<p style="display: inline-block; margin: 5px;">
				<a onclick="kakaologin()"><img width="250" height="49" id="kakao-login-btn" src="https://developers.kakao.com/assets/img/about/logos/kakaologin/kr/kakao_account_login_btn_medium_wide.png" /></a>
			</p>
		</div>
		<script type='text/javascript'>
  //<![CDATA[
    function naverlogin() {
    	//var newWin = window.open('http://nid.naver.com/nidlogin.logout', '네이버 로그아웃', 'height=5, width=5')
		//newWin.close()
		document.getElementById('naver_id_login').innerHTML='<iframe src="http://nid.naver.com/nidlogin.logout" style="display:none"></iframe>';
		setTimeout(function () { location.href='${url}'; }, 250);

		
	}
	  
	  
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('fcdeae4e6b4245a6231f3f17685837e7');
    
    function kakaologin() {
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.loginForm({
     // container: '#kakao-login-btn',
      success: function(authObj) {
        //alert(JSON.stringify(authObj));
        Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
            	alert(res.properties.nickname + '님 환영합니다');
				location.href="/seonju/kakaologin?name="+res.properties.nickname;
				//location.href="/seonju/home";
            },
            fail: function(error) {
              alert(JSON.stringify(error));
            }
          });
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    }
  //]]>
</script>




	</c:if>
	<p></p>

	<p></p>

	<c:if test="${ empty login_info }">
		<div style="margin: 0 auto;">
			<a onclick="location='agree'" class="btn-fill">회원가입</a> <a
				href="find"
				onclick="window.open(this.href, '_blank', 
		'width=650px,height=550px,toolbars=no,scrollbars=no'); return false;"
				class="btn-fill">ID,PW찾기</a> <a class="btn-fill"
				onclick="location='index'">메인화면으로</a>

		</div>
	</c:if>

</div>
<hr width=100%>
<script type="text/javascript">
function go_logout(){
	$.ajax({
		type:'post',
		url: 'logout',
		success: function(){
			location.reload();
		},
		error:function(req, text){
			alert( text + ": " + req.status );
		}
	});
}
function go_login(){
	$.ajax({
		type:'post',
		data: {userid: $('#userid').val(), userpwd: $('#userpwd').val() },
		url: 'login',
		success: function(result){
			if( result ){	//로그인됨
				if(${!empty subject}){
					if(${!empty id}){
						$(location).attr('href', 'detail.bo?subject=${subject}&id=${id}');
					}else{
						$(location).attr('href', 'new.bo?subject=${subject}');
					}
				}else{
					$(location).attr('href', 'index');
				}
			}else{
				alert("아이디나 비밀번호가 일치하지 않습니다!!");
				$('#userid').val('');
				$('#userpwd').val('');
				$('#userid').focus();
			}
		},error:function(req, text){
			alert(text + ": " + req.status);			
		}
	});
}

</script>
</html>





