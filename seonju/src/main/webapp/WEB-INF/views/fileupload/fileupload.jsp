<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.map_btn {
	margin: 5px;
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
	<h3 style="display: inline-block;">[ 임시 파일 업로드 페이지 ]</h3>
	<div style="display: inline-block;" onclick="location='index'">
		<a>홈으로</a>
	</div>
	<br />
	<form id="mainSlideUpload" action="mainslideinsert.fi" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<th style="width: 140px;">메인 슬라이드</th>
				<td style="text-align: left;"><input type="file" name="file"
					id="mainSlideFileCheck" /></td>
				<td style="width: 100px;"><a class="btn-fill"
					onclick="mainSlideCheck()">첨부하기</a></td>
				<!-- document.getElementById('mainSlideUpload').submit(); -->
				<!-- aaa(f) -->
				<td style="width: 100px;"><a class="btn-fill"
					onclick="winOpen()">목록보기</a></td>
			</tr>
		</table>
	</form>
	<br />
	<form id="menuSlideUpload" action="menuslideinsert.fi" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<th style="width: 140px;">메뉴 슬라이드</th>
				<td style="text-align: left;"><input type="text"
					name="menuContent" /></td>
				<td style="text-align: left;"><input type="file" name="file"
					id="menuSlideFileCheck" /></td>
				<td style="width: 100px;"><a class="btn-fill"
					onclick="document.getElementById('menuSlideUpload').submit();">첨부하기</a></td>
				<!-- document.getElementById('menuSlideUpload').submit();   menuSlideCheck()-->
				<td style="width: 100px;"><a class="btn-fill"
					onclick="winOpen()">목록보기</a></td>
			</tr>
		</table>
	</form>
	<br />
	<form id="mainVideoUpload" action="mainVideoinsert.fi" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<th style="width: 140px;">동영상</th>
				<td style="text-align: left;"><input type="file" name="file"
					id="mainVideoFileCheck" /></td>
				<td style="width: 100px;"><a class="btn-fill"
					onclick="mainVideoCheck()">첨부하기</a></td>
				<!-- document.getElementById('mainVideoUpload').submit(); -->
				<td style="width: 100px;"><a class="btn-fill"
					onclick="winOpen()">목록보기</a></td>
			</tr>
		</table>
	</form>
	<br />
	<form id="mapUpload" action="mapList.fi" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<th style="width: 140px;" colspan="3">매장 안내 이미지</th>
				<!-- <td style="text-align: left;"><input type="file" name="file" id="mapFileCheck"/></td> -->
				<!-- <td style="width: 100px;"><a class="btn-fill" onclick="mainVideoCheck()">첨부하기</a></td>document.getElementById('mainVideoUpload').submit(); -->
				<td style="width: 100px;"><a class="btn-fill"
					onclick="winOpen()">목록보기</a></td>
			</tr>
		</table>
	</form>

</body>

<script type="text/javascript">
	function winOpen() {

		/* var mainSlideFileCheck = document.getElementById('mainSlideFileCheck'); */

		$('#mainSlideUpload').click(
				function() {
					window.open("mainSlideList.fi", "new",
							"width=600,height=500,top=100,left=100");
				});
		$('#menuSlideUpload').click(
				function() {
					window.open("menuSlideList.fi", "new",
							"width=600,height=500,top=100,left=100");
				});
		$('#mainVideoUpload').click(
				function() {
					window.open("videoList.fi", "new",
							"width=600,height=500,top=100,left=100");
				});
		$('#mapUpload').click(
				function() {
					window.open("mapList.fi", "new",
							"width=800,height=700,top=100,left=100");
				});
	}

	function mainSlideCheck() {
		if ($('#mainSlideFileCheck').val() == "") {
			alert('첨부 파일이 없습니다. 파일을 선택해주세요.');
			return false;
		} else {
			document.getElementById('mainSlideUpload').submit();
		}
	}

	function menuSlideCheck() {
		if ($('#menuSlideFileCheck').val() == "") {
			alert('첨부 파일이 없습니다. 파일을 선택해주세요.');
			return false;
		} else {
			document.getElementById('menuSlideUpload').submit();
		}
	}

	function mainVideoCheck() {
		if ($('#mainVideoFileCheck').val() == "") {
			alert('첨부 파일이 없습니다. 파일을 선택해주세요.');
			return false;
		} else {
			document.getElementById('mainVideoUpload').submit();
		}
	}
</script>
</html>