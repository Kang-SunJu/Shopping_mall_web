<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

body {
	margin: 0;
	padding: 0;
	background: #ffffff;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

#comment_regist div {
	float: left;
	width: 50%;
}

td, th, tr{
	border: 1px solid gray;
}
</style>
</head>
<body>
	<h3>게시글 내용</h3>
	<table style="text-align: center; margin: 0 auto; width: 1000px;">

		<tr>
			<th style="width: 100px;">제목</th>
			<td class="center" colspan="5" bordercolor="red">${vo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.name }</td>
			<th>작성일자</th>
			<td>${vo.writedate }</td>
			<th>조회수</th>
			<td>${vo.readcnt }</td>
		</tr>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
		<tr>
			<th>내용</th>
			<td colspan="5" class="left">${fn: replace(vo.content, crlf, '<br>') }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="5" class="left">${vo.filename }<%@ taglib
					uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
				<c:if test="${ !empty vo.filepath }">
					<a class="btn-fill-small"
						onclick="location='download.qu?id=${vo.id}&subject=${subject }'">다운로드</a>
				</c:if>
			</td>
		</tr>
	</table>
	<br>
	<!-- 로그인한 사용자가 작성한 게시글에 대해서만 수정,삭제 가능  -->
	
	<c:if test="${login_info.userid eq vo.userid}">
		<a class="btn-fill"
			onclick="$('#detail').attr('action', 'modify.qu'); $('#detail').submit()">수정</a>
		<a  onclick="if( confirm('정말 삭제하시겠습니까?') ){ location='delete.qu?id=${vo.id}&subject=${subject }' }" class="btn-fill">삭제</a>
	</c:if>
	<a class="btn-fill" onclick="$('#detail').submit()">목록으로</a>

	<form method="post" action="list.qu" id="detail">
		<input type="hidden" name="id" value="${vo.id }" />
		<input type="hidden" name="subject" value="${subject }" /> <input
			type="hidden" name="curPage" value="${page.curPage }" /> <input
			type="hidden" name="search" value="${page.search }" /> <input
			type="hidden" name="keyword" value="${page.keyword }" />
	</form>

	<br>
	<div id="comment_regist"
		style="text-align: center; margin: 0 auto; width: 500px;">

		<div class="left">
			<strong>댓글작성</strong>
		</div>
		<div class="right">
			<a onclick="go_comment_regist()" class="btn-fill-small">댓글등록</a>
		</div>
		<textarea id="comment" style="width: 99%; height: 60px; resize: none;"></textarea>
	</div>
	<br>
	<div id="comment_list"
		style="text-align: left; width: 500px; margin: 0 auto;"></div>

	<script type="text/javascript">
function go_comment_regist(){
	if( ${ empty login_info } ){
		alert("댓글을 등록하려면 로그인하세요!");
		return;
	}
	if( $.trim($('#comment').val()) == '' ){
		alert("댓글을 입력하세요!");
		$('#comment').val(''); //공백문자입력된 경우 공백제거
		$('#comment').focus(); //댓글바로 입력하도록 focus
		return;
	}
	$.ajax({
		type: 'post',
		data: { content: $('#comment').val(), pid: ${login_info.userid} },
		url: 'cs/comment/insert',
		success: function( result ){
			if( result ){
				$('#comment').val('');
				alert('댓글이 등록되었습니다');
				go_comment_list();
			}else{
				alert('댓글저장 실패!');
			}
		},
		error: function(req, text){
			alert( text + ": " + req.status);
		}
	});
}

// url요청의 결과를 받아와 사용하는 형태 
// : RESTful 방식
function go_comment_list(){
	$.ajax({
// 		type: 'post',
		url: 'cs/comment/${login_info.userid}',
//  		url: 'list.no',
		success: function(result){
			$('#comment_list').html(result);
		},
		error: function(req, text){
			//alert( text + ": " + req.status);
		}
	});
}

$(function(){
	go_comment_list();
});
</script>








</body>
</html>