<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	InetAddress local = InetAddress.getLocalHost();
	String ip = local.getHostAddress();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 리스트</title>
<style type="text/css">
body {
	width: 100%;
}

table {
	margin: 0 auto;
	width: 80%;
	border-collapse: collapse;
}

table td, table th {
	padding: 5px 10px;
	border: 1px solid black;
}
</style>
</head>
<body>
	<h3 style="display: inline-block;">[ 파일 리스트 ]</h3>
	<div>
		<table>
			<c:if test="${index eq 1 }">
				<c:forEach items="${mainSlideList }" var="mainSlideList">
					<tr>
						<td colspan="4"><img style="width: 500px;"
							src="http://<%=ip %>/seonju/resources${mainSlideList.mspath }" /></td>
					</tr>
					<tr>
						<td style="text-align: left;">${mainSlideList.msname }</td>
						<td style="text-align: left;"><input type="file" name="file"></td>
						<td width="60px;"><a style="text-decoration: none;"
							onclick="if(confirm('정말 삭제하시겠습니까?')){location='mainslidedelete.fi?msId=${mainSlideList.msId}'}">삭제</a></td>
						<td width="60px;"><a style="text-decoration: none;" onclick="location='mainSlideUpdate.fi?msId=${mainSlideList.msId}'">변경</a></td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${index eq 2 }">
				<c:forEach items="${menuSlideList }" var="menuSlideList">
					<tr>
						<td colspan="3"><img style="width: 150px;"
							src="http://<%=ip %>/seonju/resources${menuSlideList.menupath }" /></td>
						<td>${menuSlideList.menuContent }</td>
						<td width="60px;"><a style="text-decoration: none;"
							onclick="if(confirm('정말 삭제하시겠습니까?')){location='menuDelete.fi?menuId=${menuSlideList.menuId}'}">삭제</a></td>
						<td width="60px;"><a style="text-decoration: none;" onclick="">변경</a></td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${index eq 3 }">
				<c:forEach items="${videoList }" var="videoList">
					<tr>
						<td colspan="2"><video
								src="http://<%=ip %>/seonju/resources${videoList.videoPath }"
								type="video/mp4" controls="controls"></video></td>
					</tr>
					<tr>
						<td><a style="text-decoration: none;"
							onclick="if(confirm('정말 삭제하시겠습니까?')){location='mainvideodelete.fi?videoNum=${videoList.videoNum}'}">삭제</a></td>
						<td width="60px;"><a style="text-decoration: none;" onclick="">변경</a></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${index eq 4 }">
				<tr>
					<td colspan="3" align="right">
						<div class="store_name" style="display: inline-block;">
							<a id="store_firstbtn" class="store_name_css default_css">본점</a>
						</div>
						<div style="display: inline-block;">l</div>
						<div class="store_name" style="display: inline-block;">
							<a id="store_secondbtn" class="store_name_css">2호점</a>
						</div>
						<div style="display: inline-block;">l</div>
						<div class="store_name" style="display: inline-block;">
							<a id="store_thirdbtn" class="store_name_css">2호점</a>
						</div>
					</td>
				</tr>
				<c:forEach items="${mapList }" var="mapList" varStatus="status">
					<c:if test="${status.index eq 0 }">
						<tr>
							<td colspan="3"><img alt="가게 사진1"
								src="${mapList.storeImg1 }" id="store_pic1" /></td>
						</tr>
						<tr>
							<td colspan="3"><input type="file" name="file" /> <input
								type="button" value="변경하기"
								onclick="location='mapFirstImgUpdate.fi?storeNum=${mapList.storeNum}'}" />
							</td>
						</tr>
						<tr>
							<td><img alt="가게 사진2" src="${mapList.storeImg2 }"
								id="store_pic2" /></td>
							<td><img alt="가게 사진3" src="${mapList.storeImg3 }"
								id="store_pic3" /></td>
							<td><img alt="가게 사진4" src="${mapList.storeImg4 }"
								id="store_pic4" /></td>
						</tr>
						<tr>
							<td><input type="file" name="file" /> <br /> <input
								type="button" value="변경하기" /></td>
							<td><input type="file" name="file" /> <br /> <input
								type="button" value="변경하기" /></td>
							<td><input type="file" name="file" /> <br /> <input
								type="button" value="변경하기" /></td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
<script type="text/javascript">
	/* 첫 번째 버튼 클릭 시 */
	$('#store_firstbtn').click(function() {
		$('#store_firstbtn').removeClass('store_name_css');
		$('#store_firstbtn').addClass('store_name_click');
		$('#store_secondbtn').removeClass('store_name_click');
		$('#store_secondbtn').addClass('store_name_css');
		$('#store_thirdbtn').removeClass('store_name_click');
		$('#store_thirdbtn').addClass('store_name_css');

		$('#store_pic1').attr("src", "${mapList[0].storeImg1}");
		$('#store_pic2').attr("src", "${mapList[0].storeImg2}");
		$('#store_pic3').attr("src", "${mapList[0].storeImg3}");
		$('#store_pic4').attr("src", "${mapList[0].storeImg4}");
		$('#store_content_text').text("${mapList[0].storeCon }");
	});

	/* 두 번째 버튼 클릭 시 */
	$('#store_secondbtn').click(function() {
		$('#store_secondbtn').removeClass('store_name_css');
		$('#store_secondbtn').addClass('store_name_click');
		$('#store_firstbtn').removeClass('store_name_click default_css');
		$('#store_firstbtn').addClass('store_name_css');
		$('#store_thirdbtn').removeClass('store_name_click');
		$('#store_thirdbtn').addClass('store_name_css');

		$('#store_pic1').attr("src", "${mapList[1].storeImg1}");
		$('#store_pic2').attr("src", "${mapList[1].storeImg2}");
		$('#store_pic3').attr("src", "${mapList[1].storeImg3}");
		$('#store_pic4').attr("src", "${mapList[1].storeImg4}");
		$('#store_content_text').text("${mapList[1].storeCon }");
	});

	/* 세 번째 버튼 클릭 시 */
	$('#store_thirdbtn').click(function() {
		$('#store_thirdbtn').removeClass('store_name_css');
		$('#store_thirdbtn').addClass('store_name_click');
		$('#store_firstbtn').removeClass('store_name_click default_css');
		$('#store_firstbtn').addClass('store_name_css');
		$('#store_secondbtn').removeClass('store_name_click');
		$('#store_secondbtn').addClass('store_name_css');

		$('#store_pic1').attr("src", "${mapList[2].storeImg1}");
		$('#store_pic2').attr("src", "${mapList[2].storeImg2}");
		$('#store_pic3').attr("src", "${mapList[2].storeImg3}");
		$('#store_pic4').attr("src", "${mapList[2].storeImg4}");
		$('#store_content_text').text("${mapList[2].storeCon }");
	});
</script>
</html>