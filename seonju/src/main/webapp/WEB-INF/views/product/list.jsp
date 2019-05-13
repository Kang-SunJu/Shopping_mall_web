<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src=" https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	function encoder(menu) {
		location ='list.pd?kind='+encodeURI(menu);;
	}
	</script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
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
	float: right;
	margin: 15px auto;
}

.product {
	margin: 5px
}

#create-user {
	border: none;
	background: transparent;
}

#menu {
	width: 320px;
	height: 340px;
	margin: 0 auto;
	float: left;
}

.box {
	width: 250px;
	height: 340px;
	margin: 0 auto;
}

.thumb {
	width: 250px;
	height: 250px;
}

ul {
	list-style: none;
}

a {
	text-decoration: none !important;
	color: #000000;
}

#img, #img2, #img3 {
	width: 600px;
}

label, input {
	display: block;
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

.sample_image  img {
	border-radius: 100%;
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
.sample_image:hover img {
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
}
</style>
</head>
<body>

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
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="encoder('다쿠아즈')">다쿠아즈</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="encoder('머랭쿠키')">머랭쿠키</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="encoder('파운드케이크')">파운드케이크</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="">초코칩쿠키</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="">set구성</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- DB에 메뉴 종류에 따라서 메뉴들 다 나옴 -->
		<div class="detailRight">
			<ul>
				<c:forEach items="${list }" var="vo" varStatus="i">
					<delete id="${vo.product_id }">
					<li id="menu">
						<div class="box, sample_image">
							<img id="${vo.product_id }_img_path"
								src="/seonju/${vo.product_img_path }"
								onclick="location='menuPage.pd?product_id=${vo.product_id}'"
								class="thumb" />
							<p class="product" id="${vo.product_id }_name"
								onclick="location='menuPage.pd?product_id=${vo.product_id}'">${vo.product_name }</p>
							가격 :
							<text class="product" id="${vo.product_id }_price">${vo.product_price}</text>
							원<br>
							<c:if test="${login_info.admin eq 'Y' }">
								<button class="create-user2" onclick="detail(${vo.product_id })">수정</button>
								<input id="${vo.product_id }_detail_id" value="${vo.detail_id }"
									type="hidden" />
								<input id="${vo.product_id }_img_name"
									value="${vo.product_img_name }" type="hidden" />
							</c:if>
						</div>
					</li>
					</delete>
				</c:forEach>
				<c:if test="${login_info.admin eq 'Y' }">
					<li id="menu">
						<div class="box, sample_image" >
							<img src="img/plus.png" id="create-user" class="thumb" />
						</div>
					</li>
				</c:if>
			</ul>
		</div>
	</div>



	<c:if test="${login_info.admin eq 'Y' }">
		<!-- 메뉴 추가하기 -->
		<script>
  $( function() {
    var dialog;
    var form = $("form")[0];
 
    /* 메뉴추가용 다이얼로그 생성 */
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 700,
      width: 650,
      modal: true,
      /* 추가 버튼 클릭시 데이터값 서버로 전송 */
      buttons: {
        "추가": function() {
        	form = $("form")[0];
            var formData = new FormData(form);

            $.ajax({
                cache : false,
                url : "add_menu.pd", 
                processData: false,
                contentType: false,
                type : 'POST', 
                data : formData, 
                success : function(data) {
                	if(data){
                		 window.location.reload();
                	}else{
                		alert('추가실패');
                    	dialog.dialog( "close" );
                	}
                }, // success 
                error : function(data) {
                	alert('추가실패');
                	dialog.dialog( "close" );
                }
            }); 
		},
        '취소': function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
    	  form.reset();
          $('#img').css('display' , 'none');
      }
    });
 
  //버튼 클릭시 다이얼로그 활성화
    $( "#create-user" ).button().on( "click", function() {
        dialog.dialog( "open" );
      });
  } );
  
  function file_change(f){
		if( $(f).val() == '' ){	//취소한 형태
			//원래파일이 보여지게
			 $('#img').css('display' , 'none');
		}else{
			//원래파일은 안 보이게
			$('original').html('');
		}
		
		//원래파일은 안 보이게 사진 안보이게
		  if (f.files && f.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
                  $('#img').attr('src', e.target.result);
                  	  $('#img').css({
                		  'display' : 'block',
                		  'margin' : '5px' });
              }
            reader.readAsDataURL(f.files[0]);
          }
	     }
  
  
	$(document).on('click', '#delete', function(){
			$('original').html('');
	});
  </script>

		<!-- 메뉴 추가 다이얼로그 -->
		<div id="dialog-form" title="메뉴추가">
			<form>
				<fieldset>
					<img id="img" style="display: none;" /> <input name="file"
						type="file" onchange="file_change(this)" /><br /> <label
						for="product_name">상품이름</label> <input type="text"
						name="product_name" id="product_name"
						class="text ui-widget-content ui-corner-all"> <label
						for="product_price">상품가격</label> <input type="text"
						name="product_price" id="product_price"
						class="text ui-widget-content ui-corner-all"> <input
						name="product_menu" value="${list.get(0).product_menu }"
						type="hidden" />
				</fieldset>
			</form>
		</div>

		<script>
  var product_id;
  var img_name;
  var product_img_path;
  $( function() {
  var dialog;
  var form = $("form#up_form")[0];

  dialog = $( "#dialog-form2" ).dialog({
    autoOpen: false,
    height: 700,
    width: 650,
    modal: true,
    buttons: {
    	//수정화면에서 수정버튼 클릭시 서버로 수정처리
      "수정":function (){
    	    form = $("form#up_form")[0];        
    	    var formData = new FormData(form);
    	    var change_img_name = $('#img_name').val().split('\\').slice(-1)[0];
    	    $.ajax({
    	        cache : false,
    	        url : "update_menu.pd", // 요기에
    	        processData: false,
    	        contentType: false,
    	        type : 'POST', 
    	        data : formData, 
    	        success : function(data) {
    	        	 $("#"+product_id+"_img_path").attr('src',product_img_path);
    	        	 $('#'+product_id+'_name').text($('#product_name2').val());
    	        	 $('#'+product_id+'_price').text($('#product_price2').val());
    	        	 $('#'+product_id+'_img_name').val(change_img_name);
    	        	 dialog.dialog( "close" );
    	        }, // success 
    	        error : function(data) {
    	        	  alert("실패");
    	        	  dialog.dialog( "close" );
    	        }
    	    }); // $.ajax */    }
  //수정화면에서 삭제 버튼 클릭시 서버로 삭제처리 실행
		},"삭제": function () {
			$.ajax({
		        url:"delete_menu.pd",
		        type:'GET',
		        data: {product_id: product_id},
		        success:function(data){
		        	if(data){
		           		$('#'+product_id).text('');
		        	}else{
		        		  alert("실패");
		        	}
		            dialog.dialog( "close" );
		        },
		        error:function(errorThrown){
		            alert("실패");
		            dialog.dialog( "close" );
		        }
		    });
		},
      '취소': function() {
        dialog.dialog( "close" );
      }
    },
    //다이얼로그 닫힐때 기존사진은 보여지고 미리보기 사진은 안보이게
    close: function() {
  	  form.reset();
        $('#img3').css('display' , 'none');
        $('#img2').css('display' , 'block');
    }
  });
  //버튼클릭시 다이얼로그 활성화
  $( ".create-user2" ).button().on( "click", function () {
      dialog.dialog( "open" );
    });
} );
  //수정화면 클릭시 다이얼로그에 수정할 내용들 집어넣는다
  function detail(id) {
	  	product_id = id;
		var img_path = $('#'+product_id+'_img_path').attr('src');
		var product_name = $('#'+product_id+'_name').text();
		var product_price = $('#'+product_id+'_price').text();
		img_name = $('#'+product_id+'_img_name').val();
		var detail_id = $('#'+product_id+'_detail_id').val()
		$('#product_name2').val(product_name);
		$('#product_price2').val(product_price);
		$('#product_id2').val(product_id);
		$('#detail_id2').val(detail_id);
		if(img_path == '/seonju/' ){
			$('#img2').attr('src','');
			$('original').html('');
		}else{
			var tag = '<a><img id="delete" style="vertical-align: middle; width: 15px" src="img/delete.png"/></a><text id="product_img_name2"></text>';
			$('original').html(tag);
			$('#product_img_name2').text(img_name);
			$('#img2').attr('src',img_path);
		}
	} 
  
  //파일첨부시
  function file_change2(f){
	if( $(f).val() == '' ){	//취소한 형태
		//원래파일이 보여지게 사진들 보여지게
		var tag = '<a><img id="delete" style="vertical-align: middle; width: 15px" src="img/delete.png"/></a><text id="product_img_name2"></text>';
		$('original').html(tag);
		 $('#img3').css('display' , 'none');
		 $('#img2').css('display' , 'block');
		 $('#product_img_name2').text(img_name);
	}else{
		//원래파일은 안 보이게 사진 안보이게
		$('original').html('');
		$('#img2').css('display' , 'none');
	}
	
	//파일 첨부시 미리보기 이미지
	  if (f.files && f.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
                  $('#img3').attr('src', e.target.result);
                  product_img_path = e.target.result;
                	  $('#img3').css({
                		  'display' : 'block',
                		  'margin' : '5px' });
              }
            reader.readAsDataURL(f.files[0]);
          }
      }
  
  //사진삭제시
$(document).on('click', '#delete', function(){
		product_img_path ="/seonju/";
		$('original').html('');
		$('#img2').css('display' , 'none');
		$('[name=delete]').val('y');
});
  </script>

		<!-- 메뉴 수정 다이얼로그 -->
		<div id="dialog-form2" title="메뉴수정">
			<form id="up_form">
				<fieldset>
					<img id="img3" style="display: none;" /> <img id="img2" /><br />
					<original></original>
					<input id="img_name" name="file" type="file"
						onchange="file_change2(this)"
						accept="image/gif, image/jpeg, image/png" /><br /> <label
						for="product_name">상품이름</label> <input type="text"
						name="product_name" id="product_name2"
						class="text ui-widget-content ui-corner-all"> <label
						for="product_price">상품가격</label> <input type="number"
						name="product_price" id="product_price2"
						class="text ui-widget-content ui-corner-all"> <input
						name="product_id" id="product_id2" type="hidden" /> <input
						name="detail_id" id="detail_id2" type="hidden" /> <input
						name="delete" type="hidden" />
				</fieldset>
			</form>
		</div>
	</c:if>
</body>
</html>
