<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="v" value="<%=new java.util.Date().getTime()%>" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style type="text/css">
body {
	margin: 0 auto;
	padding: 0;
	background: ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

table td {
	text-align: left;
}

.valid, .invalid {
	font-size: 9pt;
	font-weight: bold;
}

.valid {
	color: #ff95a1;
}

.invalid {
	color: red;
}

table th {
	text-align: left;
	height: 40px;
	margin-top: 10px;
	font-size: 18px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 500;
}

input[type=text], input[type=password] {
	width: 100%;
	height: 35px;
	margin: 5px 0;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="js/join_check.js?v=${v}"></script>
<script type="text/javascript">
	function validate(tag) {
		var result = $('[name=' + tag + ']').val();
		if (tag == 'userid') {
			result = join.id_status(result);
		} else if (tag == 'userpwd') {
			result = join.pwd_status(result);
		} else if (tag == 'userpwd_ck') {
			result = join.pwd_ck_status(result, $('[name=userpwd]').val());
		} else if (tag == 'email') {
			result = join.email_status(result);
		}

		$('#' + tag + '_status').text(result.desc);
		$('#' + tag + '_status').removeClass('invalid valid');
		$('#' + tag + '_status').addClass(
				result.code == 'valid' ? 'valid' : 'invalid');
		return result;
	}
	function usable() {
		//유효하지 않은 아이디는 중복확인 불필요
		var result = validate('userid');
		if (result.code != 'valid') {
			alert(result.desc);
			return;
		}

		$.ajax({
			type : 'post',
			data : {
				userid : $('[name=userid]').val()
			},
			url : 'id_check',
			success : function(data) {
				var result = join.id_usable(data);
				$('#id_check').val(result.code);
				$('#userid_status').text(result.desc);
				$('#userid_status').addClass(
						result.code == 'usable' ? 'valid' : 'invalid');
			},
			error : function(req, text) {
				alert(text + ": " + req.status);
			}
		});

	}
</script>
</head>
<body style="background-color: #ffdee2;">
	<div
		style="width: 600px; height: 1100px; background-color: #fff; margin: 30px auto; border-radius: 15px; display: inline-block;">
		<p
			style="font-size: 40px; font-weight: 500; margin: 10px 0 30px 0; padding-top: 20px;">회원가입</p>
		<form method="post" action="join">
			<div style="display: inline-block;">
				<table style="width: 500px;">
					<tr>
						<th style="width: 120px;">성명</th>
					</tr>
					<tr>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
						<th><font color="red"></font> 아이디</th>
					</tr>
					<tr>
						<td><input
							onkeyup="$('#id_check').val('n'); validate('userid')" type="text"
							name="userid" style="width: 385px;" /> <input id="btn_check"
							onclick="usable()" type="button" value="중복확인" class="btn-fill"
							style="height: 37px; font-size: 16px;" /><br>
							<div class="valid" id="userid_status">아이디를 입력하세요(영문소문자, 숫자만
								사용)</div></td>
					</tr>
					<tr>
						<th>비밀번호</th>
					</tr>
					<tr>
						<td><input onkeyup="validate('userpwd')" type="password"
							name="userpwd" /><br>
							<div class="valid" id="userpwd_status">비밀번호를
								입력하세요(영문대문자,소문자,숫자를 모두 포함)</div></td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
					</tr>
					<tr>
						<td><input onkeyup="validate('userpwd_ck')" type="password"
							name="userpwd_ck" /><br>
							<div class="valid" id="userpwd_ck_status">비밀번호를 다시 입력하세요</div></td>
					</tr>

					<tr>
						<th>이메일</th>
					</tr>
					<tr>
						<td><input onkeyup="validate('email')" style="width: 250px;"
							type="text" name="email" /><br>
							<div class="valid" id="email_status">이메일을 입력하세요</div></td>
					</tr>

					<!-- <tr><th>이메일</th> 스크롤박스
	<td><input type="text" name="str_email01" id="str_email01" style="width:100px"> @ <input type="text" name="str_email02" id="str_email02" style="width:100px;" disabled value="naver.com"> 
	<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> <option value="1">직접입력</option> <option value="naver.com" selected>naver.com</option> <option value="hanmail.net">hanmail.net</option> <option value="hotmail.com">hotmail.com</option> <option value="nate.com">nate.com</option> <option value="yahoo.co.kr">yahoo.co.kr</option> <option value="empas.com">empas.com</option> <option value="dreamwiz.com">dreamwiz.com</option> <option value="freechal.com">freechal.com</option> <option value="lycos.co.kr">lycos.co.kr</option> <option value="korea.com">korea.com</option> <option value="gmail.com">gmail.com</option> <option value="hanmir.com">hanmir.com</option> <option value="paran.com">paran.com</option> </select> <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> <script type="text/javascript"> //이메일 입력방식 선택 $('#selectEmail').change(function(){ $("#selectEmail option:selected").each(function () { if($(this).val()== '1'){ //직접입력일 경우 $("#str_email02").val(''); //값 초기화 $("#str_email02").attr("disabled",false); //활성화 }else{ //직접입력이 아닐경우 $("#str_email02").val($(this).text()); //선택값 입력 $("#str_email02").attr("disabled",true); //비활성화 } }); }); </script> 
</td></tr>
 -->

					<tr>
						<th>연락처</th>
					</tr>
					<tr>
						<td><input maxlength="3" style="width: 60px;" type="text"
							name="phone" /> - <input maxlength="4" style="width: 60px;"
							type="text" name="phone" /> - <input maxlength="4"
							style="width: 60px;" type="text" name="phone" /></td>
					</tr>
					<tr>
						<th>주소</th>
					</tr>
					<tr>
						<td><input onclick="postcode()" type="button" value="우편번호찾기" />
							<input style="width: 60px;" type="text" name="post" /><br>
							<input type="text" name="address" style="width: 98%" /> <input
							type="text" name="address" style="width: 98%" /></td>
					</tr>
				</table>
			</div>
			<br /> <br /> <br />
			<div style="padding-top: 30px;">
				<a class="btn-fill" onclick="go_submit()">회원가입</a> <a
					class="btn-empty" onclick="history.go(-1)">취소</a> <input
					type="hidden" id="id_check" value="n" />
			</div>
		</form>
	</div>

	<script type="text/javascript"
		src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		function go_submit() {
			if ($('[name=name]').val() == '') {
				alert('성명을 입력하세요');
				$('[name=name]').focus();
				return;
			}
			//아이디,비밀번호,비밀번호확인,이메일의 유효성을 확인
			if ($('#id_check').val() == 'n') {
				//중복확인 안 한 경우
				if (!item_check('userid'))
					return;
				else {
					alert(join.id.valid.desc);
					$('#btn_check').focus();
					return;
				}
			} else if ($('#id_check').val() == 'unusable') {
				//중복확인 한 경우(이미 사용중인 아이디): unusable
				alert(join.id.unusable.desc);
				$('[name=userid]').val('');
				$('[name=userid]').focus();
				return;
			}

			if (!item_check('userpwd'))
				return;
			if (!item_check('userpwd_ck'))
				return;
			if (!item_check('email'))
				return;

			$('form').submit();
		}

		function item_check(item) {
			var result = validate(item);
			if (result.code != 'valid') {
				alert(result.desc);
				$('[name=' + item + ']').focus();
				return false;
			} else
				return true;
		}

		function item_check(item) {
			var result = validate(item);
			if (result.code != 'valid') {
				alert(result.desc);
				$('[name=' + item + ']').focus();
				return false;
			} else
				return true;
		}

		function postcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var post, address;
					//지번주소선택: J
					if (data.userSelectedType == 'J') {
						post = data.postcode;
						address = data.jibunAddress;
					} else {
						//도로명주소선택: R
						post = data.zonecode;
						address = data.roadAddress;

						var extra = '';
						//법정동명
						if (data.bname != '')
							extra = data.bname;
						//건물명
						if (data.buildingName != '')
							extra += (extra == '' ? '' : ',')
									+ data.buildingName;
						if (extra != '')
							address += ' (' + extra + ')';
					}
					$('[name=post]').val(post);
					$('[name=address]:eq(0)').val(address);
					// 			$('[name=address]').eq(0).val( address ); 			
				}
			}).open();
		}
	</script>

</body>
</html>