<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    color: #222222;
                }
                
                ul {
                    list-style: none;
                }
                
                .cart {
                    margin: 0 auto;
                    width: 1280px;
                }
                
                .cart_header {
                    width: 1280px;
                }
                
                .cart_header p {
                    display: inline-block;
                    float: left;
                    font-size: 26px;
                    font-weight: 500;
                    margin: 30px 0;
                }
                
                .step_location {
                    float: right;
                }
                
                .step_location p {
                    font-size: 22px;
                    font-weight: 400;
                    display: inline-block;
                    margin: 35px 0 35px 15px;
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
                .su{
                padding-left: 0px;
                text-align: center;
                }
                .price{
				    border: 0px;
    				padding: 0px;
    				margin: 0px;
    				width: 90px;
    				text-align: right;
                }
            </style>
<script>
let priceidx = 0;
</script>
        </head>

        <body>
            <div class="cart">
            <form action="payment.bs" id="pay" method="post">
                <div class="cart_header">
                    <p>카트(0)</p>
                    <div class="step_location">
                        <p class="step_location_1">01 카트</p>
                        <p>></p>
                        <p class="step_location_2">02 주문/결제</p>
                        <p>></p>
                        <p class="step_location_3">03 결제완료</p>
                    </div>
                </div>

                <table class="cart_middle">
                    <tr>
                        <th style="width: 5%;">
                            <label>
	                <input type="checkbox" id="check_all" class="_check_all" >
	                <span><i></i></span>
	            </label>
                        </th>
                        <th style="width: 60%;">상품정보</th>
                        <th style="width: 13%;">상품개수</th>
                        <th style="width: 12%;">상품금액</th>
                    </tr>
                    
                    <c:forEach items="${basket }" var="ba" varStatus="status">
                        <tr>
                            <td>
                                <label>
		            <input type="checkbox" id="check_${status.index }" class="_check_all">
		            <span><i></i></span>
		        </label>
                            </td>
                            <td>
                                <img alt="상품이미지" src="img/basket/basket_eximg.jpg" width="150px" height="150px" style="float: left;" />
                                <p style="text-align: left; font-weight: 600; font-size: 18px;">${ba.product_name }</p>
                                <div style="height: 1px; width: 100%; background-color: #eeeeee;"></div>
                                <p style="text-align: left; font-size: 18px;"></p>
                            </td>
                            <td>
                                <input type="button" class="cnt_btn" id="${ba.product_id}" value="+" onclick="updown(this)"/>
                                <div class="cnt_text"><input type="text" class="su" id="item-${ba.product_id }" style="height:23px;" size="1" value="${ba.su }" readonly="readonly"></div>
                                <input type="button" class="cnt_btn" id="${ba.product_id}" value="-" onclick="updown(this)"/>
                                <div><input type="button" id="${status.index }" onclick="set(this.id)" value="상품정보수정" />
                                    <input type="button" id="${ba.product_id }" onclick="del(this.id)" value="삭제" /></div>
                            </td>
                            <td>${ba.price }원</td>
                        </tr>
                            <input type="hidden" id="price-${ba.product_id }" value="${ba.price }">
                        <script>
						function sumPrice() {
						let price = ${ba.price};
						priceidx = parseInt(priceidx) + price;
						}
						sumPrice();
						</script>
                    </c:forEach>
                    
                    <tr>
                        <td colspan="4">
                            <div style="display: inline-block; float: left;">
                                <label>
			            <input type="checkbox" class="_check_all">
			            <span><i></i></span>
			        </label>
                            </div>
                            <p class="guide_txt" style="float: right;">카트에 담긴 상품은 최대 15일까지 보관되며 종료되거나 매진될 경우 자동으로 삭제됩니다.</p>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <h3 style="float: left;">총 주문금액</h3>
                            
                        </th>
                        <td colspan="2">
                            <div>
                                <p style="display: inline-block; float: left;">총상품금액</p>
                                <p style="display: inline-block; float: right;">
                                <input type="text" class="price" id="total_price" value="0" readonly="readonly">원</p>
                            </div>
                            <div style="clear: both;">
                                <p style="display: inline-block; float: left;">배송비</p>
                                <p style="display: inline-block; float: right;">
                                <input type="text" class="price" id="post_price" value="2500" readonly="readonly">원</p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2" style="text-align: left;">결제 예상금액</th>
                        <td colspan="2" style="text-align: right;"><input type="text" class="price" id="total_amount" value="0" style="border: 0px;">원</td>
                    </tr>
                </table>
            </form>
                <div class="btn_area">
                    <button type="button" class="bt_submit" onclick="set()">쇼핑 계속하기</button>
                    <button type="button" class="bt_submit" onclick="$('#pay').submit()">구매하기</button>
                </div>
            </div>
            <script>
				var p = document.getElementById("total_price");
            function total_price() {
				p.value = priceidx;
			}
            total_price();
            </script>
            <script>
            let item;
            let li;
            let cnt;
            
            function del(id) {
				location = "Basketdel?orderid=${orderid}&product_id=" + id;
			}
                function set() {
                    $.ajax({
                        url: li,
                        success: function(data) {
                        	if(data.update){
                        		
                    	alert("수량 및 정보가 수정되었습니다." );
                        	}else{
                    	alert("수량 및 정보가 수정 안됨.");
                        		
                        	}
                        	cnt.value = data.su;
                        	},
                        error: function(req, text) {
                            alert("에러가 발생하였습니다.");
                        }
                    });
                }
                
				
                function updown(data) {
                	
                    /* 			let ididx = new Array();
                    			chk_all = document.getElementById("check_all");
                    			chk = document.getElementById(id); */
                    			alert(data.value);
                    item = "item-" + data.id;
                    var stat = data.value;
                    cnt = document.getElementById(item);
                    
                    if(data.value == "+"){
                    cnt.value = parseInt(cnt.value) + 1;
                    li = "basketset.do/" + data.id + "/${orderid}/" + cnt.value;
                    }else{
                    cnt.value = parseInt(cnt.value) - 1;
                    li = "basketset.do/" + data.id + "/${orderid}/" + cnt.value;
                    }
                }
            </script>
            <script>
            let total_amount = document.getElementById("total_amount");
            let post_p = document.getElementById("post_price");
            function total_p() {
				total_amount.value = parseInt(p.value) + parseInt(post_p.value);
			}
            total_p();
            </script>
        </body>

        </html>