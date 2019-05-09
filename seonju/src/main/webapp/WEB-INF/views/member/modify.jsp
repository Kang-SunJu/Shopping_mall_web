<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0 auto;
	padding: 0;
	background: #ffdee2;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

table td {
	text-align: left;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
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
	font-weight: 600;
	color: #222;
}


table td {
	text-align: left;
}


input[type=text], input[type=password] {
	width: 461px;
	height: 35px;
	margin: 5px 0;
	color: #666;
}
</style>
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
<body>
	<div style="width: 700px; height: 850px; background-color: #fff; margin: 30px auto; border-radius: 15px; display: inline-block;">
		<p
			style="font-size: 40px; font-weight: 500; margin: 10px 0 30px 0; padding-top: 20px;">[${vo.name }]회원정보수정</p>
		<div style="display: inline-block;">
			<form method="post" action="update">
				<div style="display: inline-block;">
				<input type="hidden" name="userid" value="${vo.userid}" />
				<div style="width: 98%; height: 1px; background-color: #eee; display: inline-block; margin:10px 0 30px 0;"></div>
				<table style="width: 600px;">
					<tr>
						<th style="width: 120px;">성명</th>
						<td><input type="text" name="name" value="${vo.name }" /></td>
					</tr>
					<tr>
						<th><font color="red"></font> 아이디</th>
						<td>${vo.userid }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input onkeyup="validate('userpwd')" type="password"
							name="userpwd" /><br>
							<div class="valid" id="userpwd_status">비밀번호를
								입력하세요(영문대문자,소문자,숫자를 모두 포함)</div></td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
						<td><input onkeyup="validate('userpwd_ck')" type="password"
							name="userpwd_ck" /><br>
							<div class="valid" id="userpwd_ck_status">비밀번호를 다시 입력하세요</div></td>
					</tr>

					<tr>
						<th>이메일</th>
						<td><input onkeyup="validate('email')" style="width: 250px;"
							type="text" name="email" value="${vo.email }" /><br></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input readonly type="text" name="birth"
							value="${vo.birth }" /> <img id="delete"
							style="display: none; vertical-align: middle; position: relative; right: 25px;"
							src="img/delete.png" /></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input maxlength="3" style="width: 60px;" type="text"
							name="phone" value="${vo.phone[0] }" /> - <input maxlength="4"
							style="width: 60px;" type="text" name="phone"
							value="${vo.phone[1] }" /> - <input maxlength="4"
							style="width: 60px;" type="text" name="phone"
							value="${vo.phone[2] }" /></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input onclick="postcode()" type="button" value="우편번호찾기" />
							<input style="width: 60px;" type="text" name="post"
							value="${vo.post}" /><br> <input type="text" name="address"
							style="width: 98%" value="${vo.address[0] }" /> <input
							type="text" name="address"
							value="${vo.address[1] }" /></td>
					</tr>
				</table>
					<br/><br/><br/> <a class="btn-fill" onclick="$('form').submit()">완료</a> <a
					class="btn-empty" onclick="location='mypage?userid=${vo.userid}'">취소</a>
				<input type="hidden" id="id_check" value="n" />
				</div>
			</form>
		</div>
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

		$(function() {
			//생년월일을 선택한 경우만 X버튼 보이게
			$('[name=birth]').change(function() {
				$('#delete').css('display', 'inline-block');
			});

			//X버튼 클릭시 생년월일을 지운다. X버튼 안보이게
			$('#delete').click(function() {
				$('[name=birth]').val('');
				$('#delete').css('display', 'none');
			});

			$('[name=birth]').datepicker(
					{
						dateFormat : 'yy-mm-dd',
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						changeMonth : true,
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						changeYear : true,
						beforeShowDay : after
					});
		});

		function after(date) {
			if (date > new Date())
				return [ false ];
			else
				return [ true ];
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
</head>
<body>

</body>
</html>