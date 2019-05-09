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
                
                .buy {
                    margin: 0 auto;
                    width: 1280px;
                }
                
                .buy_header {
                    width: 1280px;
                }
                
                .buy_header p {
                    display: inline-block;
                    float: left;
                    font-size: 26px;
                    font-weight: 500;
                    margin: 30px 0;
                }
                                
                .buy_middle {
                    clear: both;
                    width: 100%;
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
                #orderinfo{
                width: 400px;
                float: left;
                text-align: left;
                }
            </style>
<script>
let priceidx = 0;
</script>
        </head>

        <body>
            <div class="buy">
                <div class="buy_header">
                    <p>구매정보</p>
                </div>

                <table class="buy_middle" border="1px solid #eeeeee">
                    <tr>
                        <th style="width: 5%;">
                            <label>
	                <span><i></i></span>
	            </label>
                        </th>
                        <th style="width: 60%;">상품정보</th>
                        <th style="width: 13%;">상품개수</th>
                        <th style="width: 12%;">상품금액</th>
                    </tr>
                    
                    <c:forEach items="${list }" var="li" varStatus="status">
                        <tr>
                            <td>
                                <label>
                                <div>
		            <span><i>구매일</i></span>
		            <br>
		            <span>${li.buy_date }</span>
		            <br>
		            <span><i>주문번호</i></span>
		            <br>
		            <span>${li.orderno }</span>
                                </div>
		        </label>
                            </td>
                            <td>
                                <img alt="상품이미지" src="${li.product_img_path }" width="150px" height="150px" style="float: left;" />
                                <p style="text-align: left; font-weight: 600; font-size: 18px;">${li.product_name }</p>
                                <div style="height: 1px; width: 100%; background-color: #eeeeee;"></div>
                                <div id="orderinfo">
                                	<div>주문자명 : ${li.ordername }</div>
                                	<div>배송지 : ${li.addresses }</div>
                                	<div>연락처 : ${li.phones }</div>
                                </div>
                                <p style="text-align: left; font-size: 18px;"></p>
                            </td>
                            <td>
                                <div class="cnt_text">
                                <input type="text" class="su" id="item-${li.product_id }" style="height:23px;" size="1" value="${li.su }" readonly="readonly"></div>
                            </td>
                            <td>${li.price }원</td>
                        </tr>
                            <input type="hidden" id="price-${li.product_id }" value="${li.price }">
                        <script>
						function sumPrice() {
						let price = ${li.price};
						priceidx = parseInt(priceidx) + price;
						}
						sumPrice();
						</script>
                    </c:forEach>
                    
                </table>
            </div>
        </body>

        </html>