<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <!DOCTYPE html>

    <html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- iamport.payment.js -->
        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
        <title>결제 요청</title>
        <style>
            body {
                overflow: auto;
            }
            
            #wrap_order {
                width: 60%;
                margin: 0 auto;
            }
            
            #wrap_info {
                min-height: 150px;
                padding: 5px 5px;
                border: 1px solid black;
            }
            
            #orderinfo {
                width: 500px;
                float: left;
            }
            
            #orderinfo_1 {
                width: 250px;
            }
            
            #orderinfo_post {
                overflow: hidden;
                width: 500px;
                display: inline-block;
                float: left;
            }
            
            #wrap_info2 {
                padding: 5px 5px;
                border: 1px solid black;
                min-height: 500px;
            }
            
            #ordername {
                float: left;
            }
            
            #orderinfo_name {}
            
            #orderinfo_post br {
                height: 20px;
            }
            
            #order_name {
                padding-top: 9px;
            }
            
            #post_code,
            #post_addr {
                overflow: hidden;
            }
            
            .phone {
                float: left;
            }
            
            .post_detail {
                float: left;
            }
            
            #addr_postcode {
                float: left;
            }
            
            .post_detail input {
                float: left;
            }
            
            #post_addr input {
                width: 400px;
            }
            
            #postsearch {
                margin-top: 6px;
            }
            
            .agree_personal {
                width: 370px;
                overflow: auto;
                overflow-x: hidden;
                height: 68px;
                margin: 0 auto;
                border: 1px solid #d8dce5;
                background: none;
            }
            
            .agree_personal {
                font-weight: bold;
                padding: 5px;
            }
            
            #wrap_btn {
                width: 400px;
                float: right;
                border: 1px solid #a3a4a6;
                padding: 20px;
                margin: 10px;
            }
            
            .agree_personal div {
                text-align: left;
            }
            
            #btn {
                margin-top: 20px;
            }
            
            h5 {
                font-size: 15px;
            }
            
            input[type=text] {
                border: 1px solid #a3a4a6;
                margin: 5px 5px;
            }
            .phone{
            width: 40px;
            }
            div{
            overflow: hidden;
            }
            .hipoon{
            float:left;
            line-height: 15px;
            margin: 0 5px;
            }
        </style>
    </head>

    <body>
        <div id="wrap">
	    	<input type="hidden" id="total_price" value="0"/>
	    	<script>
	    		var price;
				var total_price;
				function idSearch() {	
					total_price = document.getElementById("total_price");
				}
				idSearch();
				</script>
            <h3>주문 목록</h3>
            <div id="wrap_order">
                <form action="purchase.do" method="post">
                    <div id="wrap_info">                    
                        <input type="hidden" id="orderid" name="userid" value="${orderid }" readonly="readonly" />
                    <c:if test="${directbuy eq 'buy'}">
                        <input type="hidden" id="product" name="product_id" value="${product_id }" readonly="readonly" />
                        <input type="hidden" id="su" name="su" value="${su }" readonly="readonly" />
                        <input type="hidden" id="price" name="price" value="${price }" readonly="readonly" />
                    </c:if>
                        <div id="orderinfo">
                            <div id="orderinfo_1">
                        <c:if test="${directbuy eq 'buy' }">
                                <span>${product_name }</span>
                                <span>${su }</span>
                                <span>${price }</span>
                        </c:if>
                        <c:forEach items="${basket }" var="ba">
						<input type="hidden" name="product_id" value="${ba.product_id }">
						<input type="hidden" name="su" value="${ba.su }">
						<input type="hidden" id="${ba.product_id }" name="price" value="${ba.price }">
						<div>${ba.product_name }</div>
						<div>${ba.su }</div>
						<div>${ba.price }</div>
						<script>
						function priceSearch() {
						price = document.getElementById("${ba.product_id}");
						total_price.value = parseInt(total_price.value) + parseInt(price.value);
						}
						priceSearch();
						</script>
                        </c:forEach>
                            </div>
                        </div>
                    </div>
                    <h3>배송 정보</h3>
                    <!-- 우편폼 절대 건들지말것! -->
                    <div id="wrap_info2">
                        <div id="orderinfo_post">
                            <div id="orderinfo_name">
                                <div>
                                <span id="order_name" style="float:left; margin-right: 14px; margin-left:10px;">주문자명</span>
                                <input type="text" id="ordername" name="ordername" value="" />
                                </div>
                                <div>
                                <span id="orderphone" style="float:left; margin-right: 5px; margin-left:10px;">주문자번호</span>
                                <input type="number" class="phone" id="phone1" name="phone" maxlength="4" oninput="maxLengthCheck(this)">
                                <span class="hipoon">-</span>
                                <input type="number" class="phone" id="phone2" name="phone" maxlength="4" oninput="maxLengthCheck(this)">
                                <span class="hipoon">-</span>
                                <input type="number" class="phone" id="phone3" name="phone" maxlength="4" oninput="maxLengthCheck(this)">
                                </div>
                            </div>
                            <br>
                            <br>
                            <div id="post_code">
                                <div class="post_detail">
                                <div>
                                    <span style="float:left; margin-right: 14px; margin-left:10px;">주소</span>
                                </div>
                                    <input type="text" class="orderinfo" id="addr_postcode" name="address" size="6" placeholder="06090" onclick="execDaumPostcode()" />
                                    <input type="button" id="postsearch" class="orderinfo" onclick="execDaumPostcode()" value="주소찾기">
                                </div>
                            </div>
                            <div id="post_addr">
                                <div class="post_detail">
                                    <input type="text" class="orderinfo" id="addr" name="address" placeholder="서울 강남구 학동로68길 29" />
                                </div>
                                <div class="post_detail">
                                    <input type="text" class="orderinfo" id="addr_extra" name="address" size="30" placeholder="(삼성동, 삼성동힐스테이트1단지아파트) 101호" />
                                </div>
                            </div>




                        </div>
                        <div id="wrap_btn">
                            <h5><input type="checkbox" class="ch" value="동의" onclick="chk()"><span>개인정보 판매자 제공 및 수집/이용 동의</span></h5>
                            <div class="agree_personal">
                                <span style="text-align: center;">제공 받는자 쑥's 초코파이</span>
                                <br/><span style="text-align: center;">목적</span>
                                <div>
                                    <span>
                                    상품 및 경품(서비스) 배송(전송), 제품 설치, 반품, 환불, 고객상담 등 정보통신서비스제공계약 및 전자상거래(통신판매)계약의 이행을 위해 필요한 업무의 처리
                                	</span>
                                </div>
                                <span style="text-align: center;">항목</span>
                                <div>
                                    <span>
                                    ID, 성명, 전화번호, 휴대전화번호, 배송지 주소, 이메일주소(선택시), 통관고유부호(선택시) 보유 기간 구매 서비스 종료 후 1개월
                                	</span>
                                </div>
                            </div>
                            <h5><input type="checkbox" class="ch" value="동의"><span>주문 상품정보 동의</span></h5>
                            <div class="agree_personal">
                                <p>주문 상품의 상품명, 가격, 배송정보에 동의합니다.</p>
                            </div>
                            <div id="btn">
                                <input type="button" value="결제하기" onclick="requestPay()" />
                                <input type="button" value="취소하기" onclick="fnBack()" />
                            </div>
                        </div>
                    </div>
                    <div id="postwrap" style="display: none; border: 1px solid; width: 95%; height: 30px; margin: 0.5em auto; position: relative">
                        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1" onclick="foldDaumPostcode()" alt="접기 버튼">
                    </div>
                </form>

           </div>

        </div>
        <!-- 결제 및 취소부분 스크립트 -->
        <script>
            /* 결제 취소 */
            function fnBack() {
                $.ajax({
                    type: 'post',
                    url: 'payback.do',
                    success: function(result) {
                        alert(result);
                        if (result) {
                            history.go(-1);
                        }
                    }
                });

            }
            /* 결제요청 */
            function fnPurchase() {

            }
        </script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        <script>
            // 우편번호 찾기 찾기 화면을 넣을 element
            var element_wrap = document.getElementById('postwrap');

            function foldDaumPostcode() {
                // iframe을 넣은 element를 안보이게 한다.
                element_wrap.style.display = 'none';
            }

            function execDaumPostcode() {
                // 현재 scroll 위치를 저장해놓는다.
                var currentScroll = Math.max(document.body.scrollTop,
                    document.documentElement.scrollTop);

                new daum.Postcode({
                    oncomplete: function(data) {
                        // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if (data.userSelectedType === 'R') {
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if (data.bname !== '' &&
                                /[동|로|가]$/g.test(data.bname)) {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if (data.buildingName !== '' &&
                                data.apartment === 'Y') {
                                extraAddr += (extraAddr !== '' ? ', ' +
                                    data.buildingName :
                                    data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if (extraAddr !== '') {
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("addr_extra").value = extraAddr;

                        } else {
                            document.getElementById("addr_extra").value = '';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('addr_postcode').value = data.zonecode;

                        document.getElementById("addr").value = addr;
                        /* 안쓰입니다.
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("addr_detail")
                            .focus(); */

                        // iframe을 넣은 element를 안보이게 한다.
                        // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)

                        element_wrap.style.display = 'none';


                        // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                        document.body.scrollTop = currentScroll;
                    },
                    // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                    onresize: function(size) {
                        element_wrap.style.height = size.height + 'px';
                    },
                    width: '100%',
                    height: '100%'
                }).embed(element_wrap);

                // iframe을 넣은 element를 보이게 한다.
                element_wrap.style.display = 'block';

            }
            /* 			사이즈자동조정
                        function autoSize() {
                            // 텍스트 길이값 가져오기
                            var post_length = String(document.getElementById("addr_postcode").value).length;
                            var addr_length = String(document.getElementById("addr").value).length;
                            var extra_length = String(document.getElementById("addr_extra").value).length;
                            alert(post_length);
                            alert(addr_length);
                            alert(extra_length);
                            if (post_length >= 1 || addr_length >= 1 || extra_length >= 1) {

                                // 텍스트 길이만큼 넓이 조정
                                document.getElementById("addr_postcode").style.width = post_length + 'px';
                                document.getElementById("addr").style.width = addr_length + 'px';
                                document.getElementById("addr_extra").style.width = extra_length + 'px';
                            }
                        } */
        </script>

        <!-- 결제 -->
        <script type="text/javascript">
        function chk() {

		}
            function requestPay() {
                // <input type="hidden" id="orderid" name="orderid" value="${orderid }" readonly="readonly" />
                //     <input type="hidden" id="product" name="product" value="${product }" readonly="readonly" />
                //     <input type="hidden" id="su" name="su" value="${su }" readonly="readonly" />
                //     <input type="hidden" id="price" name="price" value="${price }" readonly="readonly" />
                var IMP = window.IMP; // 생략해도 괜찮습니다.
                IMP.init("imp91202945"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
                var isCheck = true;
                var addr = $('#addr_postcode').val() + " " + $('#addr').val() + " " + $('#addr_extra').val();
                var tel = $('#phone1').val() + "-" + $('#phone2').val() + "-" + $('#phone3').val();
                var price = $('#total_price').val();
                var name = $('#ordername').val();
                var post = $('#addr_postcode').val();

                $('input[type=text],input[type=number]').each(function() {
                    if ($(this).val().trim() == '') {
                    	$('input[type=checkbox]').each(function() {
                            if ($(this).is(":checked") == false) {
                        isCheck = false;
                            }
                        });
                    }else{
                    	isCheck = true;
                    }
                });
                
                if (isCheck == true) {
                    IMP.request_pay({ // param
                        pg: "html5_inicis", // 실제 계약 후에는 실제 상점아이디로 변경
                        pay_method: 'card', // 'card'만 지원됩니다.
                        merchant_uid: 'merchant_' + new Date().getTime(),
                        name: "쑥's 초코파이",
                        amount: price + parseInt(2000), // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다. (모바일에서는 가격이 표시되지 않음)
                        //customer_uid: 'b09LVzhuTGZVaEY1WmJoQnZzdXpRdz09', //customer_uid 파라메터가 있어야 빌링키 발급을 시도합니다.
                        buyer_email: " ",
                        buyer_name: name,
                        buyer_tel: tel,
                        buyer_addr: addr,
                        buyer_postcode: post
                    }, function(rsp) { // callback
                        if (rsp.success) {
                            //DB에 주문번호, 가격, 연락처, 주소 등 개인정보를 담는다.
                            $('form').submit();
                            alert('결제가 완료되었습니다. 메인으로 이동합니다.');
							location="index";
                        } else {
                            alert('결제에 실패하였습니다.');
                        }
                    });
                } else {
                    alert('빈칸이 존재합니다');
                }

            }
        </script>
       	<!-- 모바일번호 체크 -->
            <script type="text/javascript">
                function maxLengthCheck(object) {
                    if (object.value.length > object.maxLength) {
                        object.value = object.value.slice(0, object.maxLength);
                    }
                }
            </script>
    </body>

    </html>