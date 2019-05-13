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
	color: #222;
}

#contents {
	width: 1280px;
	margin: 5px auto;
	overflow: hidden;
	min-height: 500px;
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
}

#list-top {
	display: inline-block;
	padding-left: 12px;
}

#list-top input {
	width: 350px;
	vertical-align: top;
}

.select_css {
	width: 150px;
	height: 40px;
	padding: 5px 10px;
	font-size: 16px;
}

.search_css {
	width: 500px;
	padding: 5px 10px;
	font-size: 16px;
}

.search_btn {
	margin-left: 5px;
	padding: 7px 20px;
	text-align: center;
	cursor: pointer;
	border: 1px solid #ff95a1;
	border-radius: 3px;
	box-shadow: 0 0 1px 1px #eee;
	background-color: #ff95a1;
	color: #fff;
}

.table_area {
	width: 1000px;
	float: right;
}

.table_css {
	width: 980px;
	margin-top: 10px;
	margin-left: 10px;
}

.table_css tr {
	border-bottom: 1px solid #ddd;
	line-height: 40px;
}
</style>
</head>
<body>
	<div id="contents">
		<div class="detailLeft">
			<div class="detail_submenu4">
				<div class="detail_submenuBox">
					<p>고객센터</p>
					<p>커뮤니티</p>
					<div class="detail_submenuList">
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='list.bo'">공지사항</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='list.bo?subject=QnA'">Q&A</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='list.bo?subject=FAQ'">FAQ</a></li>
						</ul>
						<ul
							style="list-style: none; padding: 0px; width: 150px; height: 1px; background-color: #f1f1f1;"></ul>
						<ul style="list-style: none; padding: 0px;">
							<li><a onclick="location='list.bo?subject=Event'">이벤트</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div style="display: inline-block; width: 1000px; height: auto; float: right; margin: 32px 14px 20px 0; text-align: right;">
		<c:choose>
			<c:when test="${subject eq 'cs' }">
					<img src="img/notice/notice_img1.png" alt="공지사항 이미지" width="975px;" height="auto">
			</c:when>
			<c:when test="${subject eq 'QnA' }">
					<img src="img/notice/notice_img2.png" alt="Q&A 이미지" width="975px;" height="auto">
			</c:when>
			<c:when test="${subject eq 'FAQ' }">
					<img src="img/notice/notice_img3.png" alt="FAQ 이미지" width="975px;" height="auto">
			</c:when>
			<c:when test="${subject eq 'Event' }">
					<img src="img/notice/notice_img4.png" alt="이벤트 이미지" width="975px;" height="auto">
			</c:when>
		</c:choose>
	</div>
		<div class="detailRight">
			<div style="height: 50px; margin-bottom: 10px; text-align: left;">
				<div style="display: inline-block; width: 1000px; position: relative;">
					<form method="post" action="list.bo" id="list">
						<input type="hidden" name="subject" value="${subject}" /> <input
							type="hidden" name="curPage" />
						<p id="list-top">
							<select name="search" class="select_css">
								<option ${page.search eq 'all' ? 'selected' : '' } value="all">전체</option>
								<option ${page.search eq 'title' ? 'selected' : '' }
									value="title">제목</option>
								<option ${page.search eq 'content' ? 'selected' : '' }
									value="content">내용</option>
								<option ${page.search eq 'writer' ? 'selected' : '' }
									value="writer">작성자</option>
							</select> <input class="search_css" type="text" name="keyword"
								value="${page.keyword }"
								style="height: 26px; " /> <a
								class="search_btn" onclick="$('#list').submit()">검색</a>
							<c:choose>
								<c:when test="${subject eq 'QnA' }">
									<c:if test="${!empty login_info}">
										<a onclick="location='new.bo?subject=${subject}'"
											class="search_btn" style="position: absolute; top: 15px; right: 14px;">글쓰기</a>
									</c:if>
									<c:if test="${empty login_info}">
										<a onclick="go_login('${subject}')" class="search_btn"
											style="position: absolute; top: 15px; right: 14px;">글쓰기</a>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${login_info.admin eq 'Y' }">
										<a onclick="location='new.bo?subject=${subject}'"
											class="search_btn" style="position: absolute; top: 15px; right: 14px;">글쓰기</a>
									</c:if>
								</c:otherwise>
							</c:choose>
						</p>
						<input type="hidden" name="id" />
					</form>

					<form method="post" id="detail_list">
						<input type="hidden" name="id" id="id" /> <input type="hidden"
							name="subject" value="${subject}" />
					</form>
				</div>
			</div>
			<div class="table_area">
			<table class="table_css">
				<tr style="background: #eee; font-size: 20px; font-weight: 500;">
					<td style="width: 65px;">번호</td>
					<td>제목</td>
					<td style="width: 100px;">작성자</td>
					<td style="width: 100px;">파일첨부</td>
				</tr>
				<c:forEach items="${page.list }" var="vo">
					<tr>
						<td>${vo.no }</td>
						<td class="left"><a onclick="go_detail(${vo.id})">${vo.title }</a></td>
						<td>${vo.name }</td>
						<td>${ !empty vo.filepath ? "<img src='img/attachfile.png'/>" : "" }</td>
					</tr>
				</c:forEach>
			</table>
			</div>
			<br>
		</div>
	</div>
	<script type="text/javascript">
		function go_detail(id){
			//alert(id);
			$('#detail_list').attr('action', 'detail.bo'); 
			$('#detail_list input#id').val(id);
			$('#detail_list').submit();
		}
		function go_login(subject) {
			alert('로그인 해주세요!');
			location ='logintest.me?subject='+subject;
		}
</script>
	<jsp:include page="/WEB-INF/views/include/page.jsp" />
</body>
</html>



