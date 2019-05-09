<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ver" value="<%=new java.util.Date().getTime()%>" />
<!DOCTYPE html>
<html lang="en">
<style>
body {
	margin: 0;
	padding: 0;
	background: ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>소녀감성으로 만든 쑥's 초코파이</title>
<link rel="stylesheet" href="css/story_common.css?version=${ver }">
<link rel="stylesheet" href="css/story_main.css?version=${ver }">
<style type="text/css">
	body{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;	
	}
	
	#wrap {
    margin: 5px auto;
	}
</style>
</head>

<body>
	<div id="wrap" >
		<div class="detailLeft">
			<div class="detail_submenu4">
				<div class="detail_submenuBox">
					<p>쑥's Story</p>
					<p>소개</p>
					<div class="detail_submenuList">
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='story.main'"
								style="color: #ff95a1">쑥's 소개</a></li>
						</ul>
						<ul style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='awards.main'">쑥's 연혁</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div style="width: 1000px; height: 1200px; background-color: #fff; display: inline-block; margin: 0 auto;">
		<div  class='col-md-12'style='border:0px solid #dedede;padding-left:0;padding-right:0'>
          <div style='max-width:1000px;margin:0 auto;'>
               <p style='font-size:40px; color:#222; text-align:center;margin-top:50px; magin-bottom: 60px;' class='big_title'><img width="300px" height="auto" src="img/story/introduceLogo.png" alt="회사소개 로고" /></p>
               <p style='width:150px;border-top:2px solid #ddd;margin:30px auto;'></p>
               <p style='margin-top:70px'><img width="1000px;" height="auto" src="img/story/story_img1.png" alt="banner" class='head-img'></p>
               <p style='font-size:33px;color:#000;text-align:center;margin-top:70px' class='head_title'>우리 농산물 사용, 無방부제 <b>〈 쑥's 초코파이 〉</b></p>
               <div style='font-size:18px;color:#555555;text-align:center;margin-top:50px'>
					<p>쑥's 초코파이는 우리밀, 우유버터, 우유크림, 포프리계란 등 건강한 재료를 사용하여 만든 바른 디저트를 추구합니다.</p>
					<p>늘 고객을 우선시하며 신뢰를 바탕으로 최상의 서비스를 지향하여 고객 감동과 만족을 실현할 것입니다.</p>
					<p>생산적인 문제의식과 끊임없는 혁신 활동으로 제품과 서비스의 품질과 경쟁력을 높은 수준으로 끌어올리겠습니다. </p>
					<p>고객의 기호와 품격에 맞게 제품을 생각하여 전국 주요 도시 어디에서나 최상의 쑥's 초코파이 디저트를 맛보실 수 있도록 하겠습니다.</p>
               </div>
          </div>
          <div style='max-width:1000px;margin:0 auto;'>
          	<div style="display: inline-block; margin: 20px;"><img src="img/story/story_icon1.png" width="200px" height="auto" /></div>
           	<div style="display: inline-block; margin: 20px;"><img src="img/story/story_icon2.png" width="200px" height="auto" /></div>
           	<div style="display: inline-block; margin: 20px;"><img src="img/story/story_icon3.png" width="200px" height="auto" /></div>
           	<div style="display: inline-block; margin: 20px;"><img src="img/story/story_icon4.png" width="200px" height="auto" /></div>
          </div>
        </div>
		<div style='font-size:18px;color:#555555;text-align:center;'>
			<p>언제나 높은 품질의 쑥's 초코파이를 만나보실 수 있도록 노력하겠습니다.</p>
			<p>감사합니다. </p>
		</div>
		</div>
	</div>
					
		
		<!-- <img style="float: center; width: 700px; height: 300px;  border: 0px;" 
			id="front_store" alt="탑사진" src="img/story/storymain.png"/>

					<img style="width: 100px; height: 120px;" src="img/story/customericon.png" align="left"  alt="고객중심">
						고객을 먼저 생각하며 고객과의 신뢰와 서비스를 지향하는 마음으로 고객 감동과 만족을 실현시켜 나갈 것입니다.<br>
							-고객의 입장에서 생각하고 일한다.<br>
							-고객의 뜻을 모든 의사결정의 기준으로 삼는다.<br>
							-고객이 제기한 이슈에 대해 해결책을 찾기 위해 노력한다.<br>
							-고객 요구에 신속하게 대응할 수 있는 역량을 갖춘다.<br>
					
					<img style="width: 100px; height: 120px;" src="img/story/light.PNG" align="left"  alt="혁신">
						생산적인 문제의식과 끊임없는 혁신 활동으로 제품과 서비스의 경쟁력을 끌어올릴것입니다.<br>
							-관행에 매이지 않고 새로운방식을 추구한다.<br>
							-창의적인 아이디어를 수용하고 장려한다.<br>
							-고객의 요구에 앞서 내가 남보다 먼저 변화한다.<br>
					
					<img style="width: 100px; height: 120px;" src="img/story/star.PNG" align="left"  alt="최고의품질">
						고객의 기호와 품격에 맞게 디자인,생산하여 전국 주요 도시 어디에서나 최상의 품질을 맛보실 수 있습니다. <br>
							-최고의 품질을 위한 원스톱 배송.<br>
							-최고의재료와 기술력으로 고객의 기호에 맞는 제품개발.<br>
							-철저한 위생관리에 맞는 최적의 생산환경.<br>
							
					
				</div> -->
				
</body>

</html>