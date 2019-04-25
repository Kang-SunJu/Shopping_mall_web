<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%
	String uuid = "";
	uuid = (String) session.getAttribute("orderid");
%>
            <html>

            <head>
                <title>Home</title>
                <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
                <link rel="stylesheet" href="/resources/demos/style.css">
                <script src=" https://code.jquery.com/jquery-3.3.1.min.js"></script>
                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

                <script>
                    function encoder(menu) {
                        location = 'list.bo?kind=' + encodeURI(menu);;
                    }
                </script>
                <style type="text/css">
                    body {
                        margin: 0;
                        padding: 0;
                        background: ffffff;
                        font-family: 'Noto Sans KR', sans-serif;
                        font-weight: 400;
                        color: #222222;
                    }
                    
                    .bright {
                        text-align: center;
                        margin-left: 150px;
                    }
                    
                    #contents {
                        width: 1280px;
                        margin: 5px auto;
                        overflow: hidden;
                        min-height: 680px;
                    }
                    
                    .detailLeft {
                        width: 220px;
                        float: left;
                    }
                    
                    .detail_submenu4 {
                        background-repeat: no-repeat;
                        height: 435px;
                        margin-left: 26px;
                    }
                    
                    .detail_submenuBox {
                        padding: 32px 25px;
                        text-align: center;
                    }
                    
                    .detail_submenuBox p:nth-child(1) {
                        font-size: 24px;
                        color: #fff;
                        display: inline-block;
                        background-color: #986457;
                        width: 150px;
                        line-height: 90px;
                        margin: 0;
                        font-weight: 500;
                    }
                    
                    .detail_submenuBox p:nth-child(2) {
                        font-size: 20px;
                        color: #703628;
                        display: inline-block;
                        background-color: #f3f3f3;
                        width: 150px;
                        line-height: 90px;
                        margin: 0;
                        font-weight: 500;
                    }
                    
                    .detail_submenuList {
                        border: 1px solid #f3f3f3;
                        font-size: 18px;
                        width: 148px;
                    }
                    
                    .detail_submenuList ul {
                        font-weight: normal;
                        margin: 15% 5%;
                    }
                    
                    .detail_submenuList ul:nth-child(2) {
                        font-weight: normal;
                        margin: 15% 0;
                    }
                    
                    .detail_submenuList a {
                        color: #333333;
                    }
                    
                    .detailRight {
                        width: 1000px;
                        height: 350px;
                        float: right;
                        margin: 30px auto;
                    }
                    
                    .detailRight1 {
                        width: 500px;
                        height: 400px;
                        float: left;
                        text-align: left;
                    }
                    
                    #menu1 {
                        width: 400px;
                        height: 350px;
                        float: left;
                    }
                    
                    .box {
                        width: 350px;
                        height: 350px;
                    }
                    
                    .detailRight_titleP {
                        display: inline-block;
                        font-size: 22px;
                        color: #555;
                        margin: 0;
                    }
                    
                    .detailRight_conDiv {
                        width: 100%;
                        height: 1px;
                        background-color: #eee;
                        color: #222;
                        margin: 11px 0;
                    }
                    
                    .su {
                        width: 130px;
                        height: 40px;
                        text-align: center;
                        font-size: 18px;
                        color: #333;
                    }
                    
                    .pm_btn {
                        width: 50px;
                        height: 40px;
                        border: 1px solid #aaa;
                        background-color: #aaa;
                        font-size: 22px;
                        box-sizing: border-box;
                        color: #fff;
                    }
                    
                    .su2 {
                        width: 125px;
                        height: 40px;
                        text-align: center;
                        font-size: 18px;
                        color: #333;
                    }
                    
                    .online_detail_btn {
                        font-family: 'Noto Sans KR', sans-serif;
                        width: 245px;
                        height: 50px;
                        background-color: #ff95a1;
                        border: 0;
                        outline: 0;
                        color: #fff;
                        font-size: 20px;
                        font-weight: 500;
                    }
                    
                    .online_detail_btn:nth-child(2) {
                        margin-left: 6px;
                        background-color: #fff;
                        color: #ff95a1;
                        border: 1px solid #ff95a1;
                    }
                    
                    .thumb {
                        width: 300px;
                        height: 300px;
                    }
                    
                    .chokodetail {
                        width: 800px;
                        height: 1000px;
                    }
                    
                    ul {
                        list-style: none;
                    }
                    
                    a {
                        text-decoration: none !important;
                        color: #000000;
                    }
                    
                    #img,
                    #img2,
                    #img3 {
                        width: 600px;
                    }
                    
                    input.text {
                        margin-bottom: 12px;
                        width: 95%;
                        padding: .4em;
                    }
                    
                    fieldset {
                        padding: 0;
                        border: 0;
                        margin-top: 25px;
                    }
                    
                    h1 {
                        font-size: 1.2em;
                        margin: .6em 0;
                    }
                </style>
            </head>
            <script>
                function payment() {
                    var id = "<%=uuid%>";
                    if (id == "null") {
                        alert('로그인하신 후 이용하실 수 있습니다');
                        location = 'logintest';
                    } else {
                        $('#pay').submit();
                    }
                }
            </script>

            <body>
                <script type="text/javascript">
                    // var product_price;
                    // var amount;

                    // function init() {
                    //     product_price = document.form.product_price.value;
                    //     amount = document.form.amount.value;
                    //     document.form.sum.value = product_price;
                    //     change();
                    // }

                    // function add() {
                    //     hm = document.form.amount;
                    //     sum = document.form.sum;
                    //     hm.value++;

                    //     sum.value = parseInt(hm.value) * product_price;
                    // }

                    // function del() {
                    //     hm = document.form.amount;
                    //     sum = document.form.sum;
                    //     if (hm.value > 1) {
                    //         hm.value--;
                    //         sum.value = parseInt(hm.value) * product_price;
                    //     }
                    // }

                    // function change() {
                    //     hm = document.form.amount;
                    //     sum = document.form.sum;

                    //     if (hm.value < 0) {
                    //         hm.value = 0;
                    //     }
                    //     sum.value = parseInt(hm.value) * product_price;
                    // }

                    function basketList_Add() {

                    }

                    function encoder(menu) {
                        window.location.href = 'list.bo?kind=' + encodeURI(menu);;
                    }

                    
                </script>


                <div id="contents">
                    <div class="detailLeft">
                        <div class="detail_submenu4">
                            <div class="detail_submenuBox">
                                <p>온라인 주문</p>
                                <p>Online Shop</p>
                                <div class="detail_submenuList">
                                    <ul style="list-style: none; padding: 0px;">
                                        <li><a onclick="encoder('초코파이')">초코파이</a></li>
                                    </ul>
                                    <ul style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
                                    <ul style="list-style: none; padding: 0px;">
                                        <li><a onclick="encoder('다쿠아즈')">다쿠아즈</a></li>
                                    </ul>
                                    <ul style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
                                    <ul style="list-style: none; padding: 0px;">
                                        <li><a onclick="encoder('머랭쿠키')">머랭쿠키</a></li>
                                    </ul>
                                    <ul style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
                                    <ul style="list-style: none; padding: 0px;">
                                        <li><a onclick="encoder('파운드케이크')">파운드케이크</a></li>
                                    </ul>
                                    <ul style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
                                    <ul style="list-style: none; padding: 0px;">
                                        <li><a onclick="">초코칩쿠키</a></li>
                                    </ul>
                                    <ul style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
                                    <ul style="list-style: none; padding: 0px;">
                                        <li><a onclick="">set구성</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="detailRight">
                        <ul style="margin: 0;">
                            <li id="menu1">
                                <div class="box">
                                    <img src="/seonju/${list.get(0).product_img_path }" alt="" class="thumb" />
                                </div>
                            </li>
                        </ul>
                        <div class="detailRight1">
                            <form name="" id="nextpage" method="post">
                                <input type="hidden" name="product" value=${list.get(0).product_name }>
                                <input type="hidden" name="product_name" value=${list.get(0).product_name }>
                                <input type="hidden" id="amount" name="price" value="${list.get(0).product_price }">
                                <input type="hidden" id="product_id" name="product_id" value=${list.get(0).product_id }>
                                <p style="display: inline-block; font-size: 30px; font-weight: 400; margin: 0;">${list.get(0).product_name }</p>
                                <div style="width: 100%; height: 1px; background-color: #eee; color: #222; margin: 20px 0;"></div>
                                <div align="left">
                                    <p class="detailRight_titleP">상품명</p>
                                    <p style="display: inline-block; font-size: 22px; color: #333; margin: 0 0 0 20px;">${list.get(0).product_name }</p>
                                    <div class="detailRight_conDiv"></div>
                                    <p class="detailRight_titleP">수량</p>
                                    <p style="display: inline-block; font-size: 22px; color: #222; margin: 0 0 0 41px;">
                                        <input type="button" value=" + " onclick="add();" class="pm_btn" />
                                        <input type="number" class="su" id="su" value="1" name="su" size="3" maxlength="3" oninput="maxLengthCheck(this)" onkeyup="total_price_()" />
                                        <input type="button" value=" - " onclick="del();" class="pm_btn" />
                                    </p>
                                    <div class="detailRight_conDiv"></div>
                                    <p class="detailRight_titleP">금액</p>
                                    <p style="display: inline-block; font-size: 22px; color: #222; margin: 0 0 0 96px;">
                                        <input type="text" id="product_price" class="su2" style="height: 40px;" value="${list.get(0).product_price }" name="product_price" size="10" readonly>
                                    </p>
                                    <p style="display: inline-block; font-size: 22px; color: #222; margin: 0 0 0 10px;">
                                     <span>원</span>
                                    </p>
                                </div>
                                <div style="width: 100%; height: 1px; background-color: #eee; color: #222; margin: 20px 0;"></div>
                                <div align="left">
                                    <input type="button" id="basketadd" class="online_detail_btn" onclick="chkbtn(this.id)" value="장바구니" />
                                    <input type="button" id="payment" value=" 바로구매" onclick="chkbtn(this.id)" class="online_detail_btn" />
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- 로그인 여부 및 페이지자동이동 -->
                    <script>
                            var id = "<%=uuid%>";
                        function chkbtn(btn_id) {
                            var idval = btn_id;
                            alert(btn_id);
                            var form = document.getElementById("nextpage");
                            if (id == "null") {
                                alert('로그인하신 후 이용하실 수 있습니다');
                                location = 'logintest';
                            } else {
                                if (btn_id == "payment") {
                                    form.action = btn_id + ".do";
                                    form.submit();
                                } else {
                                    form.action = btn_id + ".do";
                                    form.submit();
                                }
                            }
                        }

                        function maxLengthCheck(object) {
                            if (object.value.length > object.maxLength) {
                                object.value = object.value.slice(0, object.maxLength);
                            }
                        }

                        // price의 초기값 더미
                        var pricedum = document.getElementById("amount").value;
                        // + 버튼 클릭 시 적용되는 항목
                        function add() {
                            var su = document.getElementById("su");
                            var total_price = document.getElementById("product_price");

                            su.value++;
                            total_price.value = parseInt(pricedum) * parseInt(su.value);
                        }
                        // - 버튼 클릭 시 적용되는 항목
                        function del() {
                            var su = document.getElementById("su");
                            var total_price = document.getElementById("product_price");
                            if (su.value <= 1) {
                                alert('해당 상품의 최소구매 가능 수량은 1개입니다.');
                                su.value = 1;
                            } else {
                                su.value--;
                                total_price.value = parseInt(pricedum) * parseInt(su.value);
                            }
                        }
                        // 수량을 강제로 변경 시 적용되는 항목
                        function total_price_() {
                            var su = document.getElementById("su");
                            var total_price = document.getElementById("product_price");
                            if (su.value <= 1) {
                                alert('해당 상품의 최소구매 가능 수량은 1개입니다.');
                                su.value = 1;
                            } else {
                                total_price.value = parseInt(pricedum) * parseInt(su.value);
                            }
                        }
                    </script>

                    <!-- 상품 상세정보 사진 -->
                    <div id="content1" style="width: 1000px; display: inline-block; float: right;">
                        <c:forEach items="${list }" var="vo" varStatus="i">
                            <c:if test="${i.index > 0 }">
                                <div>
                                    <img id="detail_img-${i.index }" src="/seonju/${vo.product_img_path }" class="chokodetail">
                                </div>
                            </c:if>
                        </c:forEach>

                        <c:if test="${login_info.admin eq 'Y' }">
                            <br />
                            <button class="update-img" onclick="detail(${vo.product_id })">수정</button>
                        </c:if>
                    </div>

                </div>



                <c:if test="${login_info.admin eq 'Y' }">

                    <script>
                        var deleteArr = new Array();
                        var updateArr = new Array();
                        $(function() {
                            var dialog;
                            var form = $("form#up_form")[0];

                            dialog = $("#update-img").dialog({
                                autoOpen: false,
                                height: 700,
                                width: 650,
                                modal: true,
                                buttons: {
                                    '수정': function() {
                                        form = $("form#up_form")[0];
                                        var formData = new FormData(form);
                                        $.ajax({
                                            cache: false,
                                            url: "delete_img.bo",
                                            processData: false,
                                            contentType: false,
                                            type: 'POST',
                                            data: formData,
                                            success: function(data) {
                                                if (data) {
                                                    if (deleteArr.length > 0) {
                                                        for (var i = 0; i < deleteArr.length; i++) {
                                                            $('#delete-' + deleteArr[i]).attr('type', 'image');
                                                            $('#delete-' + deleteArr[i]).css('display', 'none');
                                                            $('#detail_img-' + deleteArr[i]).css('display', 'none');
                                                        }
                                                        deleteArr.length = 0;
                                                    }
                                                    if (updateArr.length > 0) {
                                                        for (var i = 0; i < updateArr.length; i++) {
                                                            $('#detail_img-' + updateArr[i]).attr('src', $('#update_img-' + updateArr[i]).attr('src'));
                                                        }
                                                        deleteArr.length = 0;
                                                    }
                                                    if ($('#getfile').val() != "") {
                                                        window.location.reload();
                                                    }
                                                    $("input[name=update_id]").val('');
                                                    $("input[name=delete_id]").val('');
                                                    dialog.dialog("close");
                                                } else {
                                                    alert('실패');
                                                    dialog.dialog("close");
                                                }
                                            }, // success 
                                            error: function(data) {
                                                alert('전송실패');
                                                if (deleteArr.length > 0) {
                                                    for (var i = 0; i < deleteArr.length; i++) {
                                                        $('#delete-' + deleteArr[i]).attr({
                                                            'type': 'image',
                                                            'src': 'img/delete.png'
                                                        });
                                                        $('#update_img-' + deleteArr[i]).css('display', 'block');
                                                    }
                                                    deleteArr.length = 0;
                                                }
                                                if (updateArr.length > 0) {
                                                    for (var i = 0; i < updateArr.length; i++) {
                                                        $('#update_img-' + updateArr[i]).attr('src', '/seonju/' + $('#img_path-' + updateArr[i]).val());
                                                    }
                                                    updateArr.length = 0;
                                                }
                                                $("#preview").html('');
                                                $("input[name=update_id]").val('');
                                                $("input[name=delete_id]").val('');
                                                dialog.dialog("close");
                                            }
                                        });
                                    },
                                    '취소': function() {
                                        //취소시
                                        if (deleteArr.length > 0) {
                                            for (var i = 0; i < deleteArr.length; i++) {
                                                $('#delete-' + deleteArr[i]).attr({
                                                    'type': 'image',
                                                    'src': 'img/delete.png'
                                                });
                                                $('#update_img-' + deleteArr[i]).css('display', 'block');
                                            }
                                            deleteArr.length = 0;
                                        }
                                        if (updateArr.length > 0) {
                                            for (var i = 0; i < updateArr.length; i++) {
                                                $('#update_img-' + updateArr[i]).attr('src', '/seonju/' + $('#img_path-' + updateArr[i]).val());
                                            }
                                            updateArr.length = 0;
                                        }
                                        $("#preview").html('');
                                        $("input[name=update_id]").val('');
                                        $("input[name=delete_id]").val('');
                                        dialog.dialog("close");
                                    }
                                },
                                //다이얼로그 닫힐때 기존사진은 보여지고 미리보기 사진은 안보이게
                                close: function() {
                                    form.reset();
                                }
                            });
                            //버튼클릭시 다이얼로그 활성화
                            $(".update-img").button().on("click", function() {
                                dialog.dialog("open");
                            });
                        });

                        //파일 추가시
                        $(document).ready(function() {
                            $("#getfile").on("change", handleImgsFilesSelect);
                        });

                        function handleImgsFilesSelect(e) {
                            //파일 없을경우
                            if (e.target.files.length == 0) {
                                $("#preview").html('');
                                return;
                            }
                            var img_html = "";
                            //파일이 있으면
                            var files = e.target.files;
                            var filesArr = Array.prototype.slice.call(files);
                            filesArr.forEach(function(f) {
                                if (!f.type.match("image.*")) {
                                    alert("이미지 파일만 가능합니다.");
                                    return;
                                }
                                var reader = new FileReader();
                                //이미지 미리보기
                                reader.onload = function(e) {
                                    img_html += "<img style='width : 600px;' src=\"" + e.target.result + "\" />";
                                    $("#preview").html(img_html);
                                }
                                reader.readAsDataURL(f);
                            });

                        }

                        //사진삭제시
                        function delete_img(index, detail_id) {
                            $('#delete-' + index).val(detail_id);
                            $('#delete-' + index).attr('type', 'hidden');
                            $('#update_img-' + index).css('display', 'none');
                            deleteArr.push(index);
                        }

                        //사진 수정시
                        function file_update(f, index, detail_id) {
                            if ($(f).val() == '') { //취소한 형태
                                //원래파일이 보여지게 사진들 보여지게
                                $('#update_img-' + index).attr('src', '/seonju/' + $('#img_path-' + index).val());
                                $('#update-' + index).val('');
                            } else {
                                //원래 사진은 안보이고 변경된 사진으로 보이게
                                var reader = new FileReader();
                                reader.onload = function(e) {
                                    $('#update_img-' + index).attr('src', e.target.result);
                                }
                                reader.readAsDataURL(f.files[0]);
                                $('#update-' + index).val(detail_id);
                                updateArr.push(index);
                            }
                        }
                    </script>

                    <div id="update-img" title="사진 추가 수정">
                        <form id="up_form">
                            <fieldset>
                                <c:forEach items="${list }" var="vo" varStatus="i">
                                    <c:if test="${i.index > 0 }">
                                        <div style="width: 600px;">
                                            <input style="position: absolute; left: 600px;" id="delete-${i.index }" name="delete_id" type="image" src="img/delete.png" onclick="delete_img(${i.index },${vo.detail_id}); return false;" />
                                            <img style="width: 600px;" id="update_img-${i.index }" src="/seonju/${vo.product_img_path }" onclick="$('#file-${i.index}').click();" /> <input name="file" type="file" id="file-${i.index }" style="display: none;"
                                                onchange="file_update(this, ${i.index }, ${vo.detail_id} )" />
                                            <input name="product_img_path" id="img_path-${i.index }" value="${vo.product_img_path }" type="hidden" /> <input name="update_id" id="update-${i.index }" type="hidden" />
                                        </div>
                                    </c:if>
                                </c:forEach>
                                <input name="product_id" value="${list.get(0).product_id }" type="hidden" />
                                <div id="preview"></div>
                                <br /> <input name="product_id" value="${list.get(0).product_id }" type="hidden" /> <input type="file" id="getfile" name="nfile" accept="image/*" multiple><br />

                            </fieldset>
                        </form>
                    </div>
                </c:if>
            </body>

            </html>