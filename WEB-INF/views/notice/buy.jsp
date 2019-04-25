<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

table td {
	text-align: left;
}

.cart {
	margin: 0 auto;
	width: 1280px;
}

.cart_middle {
	clear: both;
	width: 100%;
}

.cnt_btn {
	height: 30px;
	width: 30px;
	background-color: #eeeeee;
	display: inline-block;
	margin: 0;
	padding: 0;
}

.cnt_text {
	height: 30px;
	width: 50px;
	background-color: #ffffff;
	display: inline-block;
	border: 1px solid #eeeeee;
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
	<div class="cart">
		<h1 align="left">주문/결제</h1>
		<hr>
		<h2 align="left">주문상품확인</h2>
		<table class="cart_middle">

			<tr>
				<!-- <th style="width: 5%;">
	            <label>
	                <input type="checkbox" class="_check_all" >
	                <span><i></i></span>
	            </label>
            </th> -->
				<th style="width: 60%;">상품정보</th>
				<th style="width: 13%;">상품개수</th>
				<th style="width: 12%;">상품금액</th>
			</tr>
			<tr>
				<!-- <td>
				<label>
		            <input type="checkbox" class="_check_all">
		            <span><i></i></span>
		        </label>
			</td> -->
				<td><img alt="상품이미지" src="img/basket/basket_eximg.jpg"
					width="150px" height="150px" style="float: left;" />
					<p style="text-align: left; font-weight: 600; font-size: 18px;">상품
						이름</p>
					<div style="height: 1px; width: 100%; background-color: #eeeeee;"></div>
					<p style="text-align: left; font-size: 18px;">상품 설명</p></td>
				<td>
					<!-- <div class="cnt_btn">-</div>
				<div class="cnt_text">0</div>
				<div class="cnt_btn">+</div> -->
				</td>
				<td>-원</td>
			</tr>
			<!--  <tr>
        	<td colspan="4">
        		<div style="display: inline-block; float: left;">
	        		<label>
			            <input type="checkbox" class="_check_all">
			            <span><i></i></span>
			        </label>
			        <button type="button">찜한 상품에 저장</button>
	       			<button type="button">삭제</button>
       			</div>
        		<p class="guide_txt" style="float: right;">카트에 담긴 상품은 최대 15일까지 보관되며 종료되거나 매진될 경우 자동으로 삭제됩니다.</p>
        	</td>
        </tr> -->
			<tr>
				<th colspan="2">
					<h3 style="float: left;">총 주문금액</h3>
				</th>
				<td colspan="2">
					<div>
						<p style="display: inline-block; float: left;">총상품금액</p>
						<p style="display: inline-block; float: right;">-원</p>
					</div>
					<div style="clear: both;">
						<p style="display: inline-block; float: left;">배송비</p>
						<p style="display: inline-block; float: right;">-원</p>
					</div>
				</td>
			</tr>
			<tr>
				<th colspan="2" style="text-align: left;">결제 예상금액</th>
				<td colspan="2" style="text-align: right;">-원</td>
			</tr>
		</table>
		<div>
			<h2 align="left">받는사람정보</h2>
			<table class="cart_middle" border="1">
				<tr>
					<th style="width: 120px;">이름</th>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input maxlength="3" style="width: 60px;" type="text"
						name="phone" /> - <input maxlength="4" style="width: 60px;"
						type="text" name="phone" /> - <input maxlength="4"
						style="width: 60px;" type="text" name="phone" /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input onclick="postcode()" type="button" value="우편번호찾기" />
						<input style="width: 60px;" type="text" name="post" /><br> <input
						type="text" name="address" style="width: 98%" /> <input
						type="text" name="address" style="width: 98%" /></td>
				</tr>
			</table>
		</div>
		<h2>결제정보</h2>
	</div>
	<script type="text/javascript"
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
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
					//	 			$('[name=address]').eq(0).val( address ); 			
				}
			}).open();
		}
	</script>
</body>
</html>