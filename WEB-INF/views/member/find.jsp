<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.mail_fine { font-size: 10pt; font-weight: bold; color: red;
			text-align: center;
			cursor: pointer;
			} 

</style>

<script language="javascript">
<!--
function chk_val() {
	with(document.idSearchFm) {
		if(!user_email1.value) {
			alert("이메일을 입력하세요.")
			user_email1.focus();
			return;
		}
		if(!user_email2.value) {
			alert("이메일을 입력하세요.")
			user_email2.focus();
			return;
		}

		action = "Find_ID.php";
		submit();
//		alert();
//		return true;
	}
}

function ShowPannel(pannel) {
	if (pannel == "1") {
		jQuery('#LayerPANNEL1').css("display", "block");
		jQuery('#LayerPANNEL2').css("display", "none");
	}
	else {
		//jQuery('#LayerPANNEL1').css("display", "none");
		//jQuery('#LayerPANNEL2').css("display", "block");
		jQuery('#LayerPANNEL1').hide();
		jQuery('#LayerPANNEL2').show();
	}
}

function ShowEMailFind(){
	jQuery('#LayerPANNEL2').css({position:'fixed'}).css({
	});
	jQuery('.black_bg').show();
	//jQuery('body').scrollTop(0);
	ShowPannelLayer('LayerPANNEL2');
	jQuery(document).scroll(function(){
		jQuery('#LayerPANNEL2').css({position:'fixed'}).css({
		});
	});
}

function EMailFind() {
	var user_name  = $("#user_name").val();
	var user_phone = $("#user_phone").val();

	if (user_name == "") {
		alert("사용자명을 입력하세요.")
		$("#user_name").focus();
		return;
	}
	if (user_phone == "") {
		alert("휴대폰을 입력하세요.")
		$("#user_phone").focus();
		return;
	}

	$.ajax({
		type: 'post',
		dataType: 'json',
		url: 'Find_Email.php',
		data: {user_name:user_name, user_phone:user_phone},
		success: function (data) {
			//console.log(data);
			if (data.ret == "ok") {
				$("#Email_msg").html('<sapn class="mail_fine">' + data.strEmail + '</span>');
				ShowPannel('1');
			}
			else {
				//alert("입력하신 data의 메일주소가 없습니다.");
				$("#Email_msg").html('<sapn class="id_guide_txt mb20">입력하신 data의 메일주소가 없습니다.</span><a href="javascript:ShowPannel(\'2\');" class="mail_fine">이메일 찾기</a>');
				ShowPannel('1');
			}
		},
		error: function (request, status, error) {
			console.log('code: '+request.status+"\n"+'message: '+request.responseText+"\n"+'error: '+error);
			alert("요청하신 처리가 오류로 처리 불가입니다.");
			ShowPannel('1');
		}
	});
}

(function($) {
    $(function () {
        $(window).load(function () {
            popupAutoResize();//팝업리사이징
        });//load
    });//$

    function popupAutoResize() {
		var w = $(document).width();
		var h = $(document).height();
		window.resizeTo(450, 435);
	}
})(jQuery);
//-->

/* $(function () {
	$("#find_id_btn").click(function () {
		location.href="idfind";
	})
}) */

</script>


</head>
<body>

<body>

<!-- <a href="URL" onclick="window.open(this.href, '_blank', 
		'width=가로사이즈px,height=세로사이즈px,toolbars=no,scrollbars=no'); return false;">완전 간단하게 팝업 띄우기!!</a>
 -->



	<div style="float: left">
		<form method="post" name="idSearchFm" onSubmit="chk_val();">
		<input type="hidden" name="strPageCode1" value="ZUlMc0guZW5nZG9vaHpGeFpDbm5PNHhMY2U=">

		
		<div>
			
			<h3>ID,PW찾기</h3>
				<a href="idfind" class="btn-fill">아이디 찾기</a>
				<a href="pwfind" class="btn-fill">비밀번호 찾기</a>

		</div></form></div>


</body>
</html>