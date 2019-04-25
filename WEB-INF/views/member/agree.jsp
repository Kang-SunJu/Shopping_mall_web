<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<jsp:include page="../include/quickMenu.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">
<style>
.top_text {
	text-align: center;
	color: #df1d2a;
	font-weight: 400;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
}

.agree_title {
	color: #222;
	font-weight: 500;
	font-size: 24px;
	font-family: 'Noto Sans KR', sans-serif;
}

.agree_con {
	text-align: left;
	overflow: scroll;
	width: 800px;
	height: 400px;
	border: 1px solid #777777;
	padding: 10px;
	margin: 0px auto;
	color: #444444;
}

.agree_btn {
	width: 200px;
	height: 50px;
	text-align: center;
	cursor: pointer;
	border: 1px solid #ff95a1;
	border-radius: 5px;
	box-shadow: 0 0 1px 1px #eee;
	text-decoration: none;
	background-color: #ff95a1;
	color: #ffffff;
	font-weight: 400;
	font-size: 20px;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

<div style="margin: 0 auto;">
	<section id="at-register">

		<form name="fregister" id="fregister" action="member"
			onsubmit="return fregister_submit(this);" method="POST"
			autocomplete="off" data-ajax="false">
			<input type="hidden" name="frame" value="">


			<p class="top_text">※ 회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수
				있습니다.</p>
			<p class="agree_title">〈 회원가입약관 〉</p>
			<a href="#" id="agreec"></a>

			<textarea class="agree_con" readonly="readonly">
 제1조 정의
이 규칙은 본 사이트의 회원가입에 대한 조건 및 절차와 기타 필요한 사항을 규정함을 목적으로 합니다.

 제 2 조 (규칙의 효력 및 변경)
① 이 규칙의 내용은 회원가입시 동의와 공지에 의해서 효력을 발생합니다.
② 본 사이트 운영위가 필요하다고 인정되는 경우 이 규칙의 내용을 개정(변경, 삭제 또는 추가) 할 수 있으며, 개정된 규칙은 상기 제①항과 같은 방법으로 효력을 발생합니다.

 제 3 조 (규칙외 준칙)
이 규칙에 명시되지 않은 사항은 전기통신기본법, 전기 통신사업법 및 기타 관련법령의 규정에 의합니다.

 제 4 조 (회원의 범위)
① 회원가입을 한자에 한해 회원됨을 원칙으로 합니다.
② 비회원은 특정 영역의 게시판을 사용하실 수 없습니다.
③ 회원이라 함은 회원과 비회원을 통칭합니다.
④ 기타 언급되지 않은 사항은 일반 통상적 회원가입 기준을 따릅니다.

 제 5 조 (회원의 의무)
① 회원은 이 규칙에서 규정하는 사항과 공지된 사항을 준수하여야 합니다.
② 정식회원은 아래 각 호의 행위를 하여서는 안됩니다.
   1. 정당한 이유없이 타인의 명예를 손상시키거나 권리를 침해하는 행위
  2. 공공질서 또는 미풍양속을 해하는 행위
  3. 본 사이트의 명예를 손상시키거나 운영을 방해하는 행위
  4. 국가안전을 위협하거나 범죄와 결부된다고 인정되는 행위
  5. 본 규칙에 위반하여 회원활동을 하는 행위
  6. 기타 현행법에 위배되는 행위

 제 6 조 (회원가입 제한)
다음 각호에 해당되는 경우 사전 경고없이 해당 회원에 대해 삭제, 이동, 이용자 접근 제한, 이용 정지 등의 조치를 취할 수 있습니다.
① 제 5 조에 의한 회원의 의무를 위반하였을 경우
② 게시판에 불법 성인물 및 음란물을 게시하거나 링크하는 경우
③ 게시판에 저작권 및 저작인접권을 침해하는 내용을 게시하거나 링크하는 경우
④ 회원가입시 거짓정보를 기입한 경우.
⑤회원의 동의없이 상업적 광고성 글을 게제하는 경우.

 제 7 조 (게시판 글의 저작권)
① 게시판에 게시한 글의 저작권에 대한 일체의 권리는 해당 글의 게시자에게 있습니다.
② 게시판의 글과 관련한 모든 법적인 문제에 대한 책임은 해당 글의 게시자에게 있습니다.

 제 8 조 (내용의 변경 및 추가)
본 운영위가 필요하다고 판단하는 경우 본 홈페이지의 내용을 추가, 변경 또는 삭제할 수 있으며 그 내용을 홈페이지내에 게시하거나 별도로 공지합니다.

 제 9 조 (관리운영자의 의무)
회원가입과 관련하여 알게 된 회원의 신상정보를 본인의 승낙없이 타인에게 누설, 배포하거나 상업적 목적으로 사용할 수 없습니다.
단, 관계법령에 근거하여 관계 기관의 요구가 있는 경우, 운영위의 토의에 의해서 이에 응할 수 있습니다.

 제 10 조 (본 사이트의 관리)
① 게시판에 글을 게시, 변경, 삭제의 책임은 해당 글의 게시자에게 있습니다.
② 게시판 글의 손망실에 대비한 원본 및 사본 유지(백업)의 책임은 해당 글의 게시자에게 있습니다.
③ 특정 회원 및 비회원의 게시한 글이 본 사이트의 운영에 타격을 준다고 판단할 경우, 해당 글의 게시자에게 시정을 권고하거나 해당 글의 게시자에 대한 접근을 차단할 수 있습니다. 이 경우, 접근차단 즉시 해당 글의 게시자에게 접근차단 사실을 통보하여야 합니다.

 제 11 조 (손해배상 및 면책)
① 회원은 본 사이트에서 허용하지 않은 행위 또는 활동으로 인한 모든 결과 및 손실에 대한 책임은 해당 회원에게 있으며, 본 사이트는 책임을 지지 않습니다.
② 회원 또는 본 사이트 운영위는 천재지변, 불가항력적인 사유으로 인하여 본 규칙에서 정하는 바를 위반하게 될 경우, 해당 책임을 지지 않습니다.
③ 본 홈페이지 운영의 중단으로 인하여 회원에게 발생할 수 있는 제반 손해에 대하여 배상할 책임을 지지 않습니다.
④ 회원의 귀책사유로 인한 본 사이트 운영장애에 대하여 책임을 지지 않으며 이로 인해 본사가 입는 손해는 해당 회원이 배상하여야 합니다.
⑤ 당사는 회원에게 제공, 게시 또는 전송한 자료의 신뢰도, 정확성 등의 사항에 관하여 책임을 지지 않습니다.
 </textarea>
			<br />
			<p style="width: 822px; display: inline-block; text-align: right;">
				&nbsp; &nbsp; <label><input type="checkbox" name="agree"
					value="1" id="agree11">회원가입약관의 내용에 동의합니다.</label>
			</p>
			<br />

			<p class="agree_title">〈 개인정보처리방침안내 〉</p>
			<a href="#" id="agreec2"></a>
			<textarea class="agree_con" readonly="readonly">

본 방침은 "쑥스초코파이 본점"(전자상거래 사업자)이(가) 
운영하는 쑥스초코파이와 본점 사이버 몰(이하 “쇼핑몰” 이라 한다)

● 개인정보의 수집 및 이용목적
 쇼핑몰은 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다.

ㆍ서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
- 콘텐츠 제공, 물품배송 또는 청구서 등 방송, 금융거래 본인 인증 및 금융 서비스, 구매 및 요금 결재, 요금추심

ㆍ회원 관리
- 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인,
가입 및 가입횟수 제한, 만 19세 미만 아동 및 청소년의 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인,
분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달.

ㆍ마케팅 및 광고에 활용
- 신규 서비스(제품) 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계,
구매비율에 따른 기획, 이벤트 등 광고성 정보 전달

단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.

● 수집하는 개인정보 항목

 쇼핑몰은 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

ㆍ회원제 서비스 이용에 따른 본인 확인 절차 또는 주문 및 배송시에 아래와같은 정보들이 수집될 수 있습니다.
- 이름, 아이디, 비밀번호, 이메일, 주소, 연락처, 핸드폰 번호
ㆍ또한 서비스 이용과정이나 사업 처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
- 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록

● 개인정보의 보유 및 이용기간

 회원의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성된 후에는 해당 정보를 지체없이 파기합니다.
단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.

- 계약 또는 청약철회 등에 관한 기록 : 5년
- 대금결제 및 재화 등의 공급에 관한 기록 : 5년
- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년

ㆍ 회원의 동의를 받아 보유하고 있는 거래정보 등을 회원께서 열람을 요구하는 경우 쇼핑몰은 지체없이 그 열람·확인 할 수 있도록 조치합니다. </textarea>
			<br/>
			<div style="margin: 0 auto;">
				<p style="width: 822px; display: inline-block; text-align: right;">
					&nbsp; &nbsp; <label><input type="checkbox" name="agree2"
						value="1" id="agree21"> 개인정보수집이용안내의 내용에 동의합니다.</label>
				</p>
				<br />
				<br />
				<br />
				<div>
					<button type="submit" class="agree_btn">다음으로</button>
					&nbsp;
					<button type="button" onclick="history.go(-1);" class="agree_btn">취소</button>
				</div>
			</div>


			<p></p>

		</form>
		<script>
			function fregister_submit(f) {
				if (!f.agree.checked) {
					alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
					document.getElementById('agreec').focus();
					//f.agree.focus();
					return false;
				}

				if (!f.agree2.checked) {
					alert("개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
					document.getElementById('agreec2').focus();
					//f.agree2.focus();
					return false;
				}

				return true;
			}
		</script>
	</section>

</div>

