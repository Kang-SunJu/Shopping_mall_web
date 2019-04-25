<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
    
<c:forEach items="${list }" var="vo" varStatus="status">
${status.index==0 ? '<hr>' : '' } 
<%-- <div>${vo.name } [ <fmt:formatDate value="${vo.writedate}" pattern="yyyy-MM-dd hh:mm:ss"/> ] --%>
<div>${vo.name } [ ${vo.writedate} ]
<!-- 로그인한 사용자가 작성한 글에 대해서만 수정,삭제 가능 -->
<c:if test="${vo.userid eq login_info.userid }">
	<span style="float: right;">
		<a onclick="go_modify_save( ${vo.id} )" class="btn-fill-small" id="btn-modify-save-${vo.id }">수정</a>
		<a onclick="go_delete_cancel( ${vo.id} )" class="btn-fill-small" id="btn-delete-cancel-${vo.id }">삭제</a>
	</span>
</c:if>
</div>

<div id="original-${vo.id }">
${fn: replace( fn:replace(vo.content, lf, '<br>'), crlf, '<br>') }
</div>
<div id="modify-${vo.id }" style="display: none;"></div>
<hr>
</c:forEach>    
<script>
function go_delete_cancel( id ){
	//삭제버튼, 취소버튼
	//원래글이 보이고, 변경입력글은 안보이게
	if( $('#btn-delete-cancel-' + id).text() == "취소"  ){
		display_mode( id, 'd' );
	}else{
		if( confirm("정말 삭제?") ){
			$.ajax({
				url: 'cs/comment/delete/'+ id,
				success: function(){
					go_comment_list();
				},
				error: function(req, text){
					alert(text + ": " + req.status);
				}
			});
		}
	}
}
function go_modify_save(id){
	//버튼의 글자가 수정이면 수정모드로 
	//            저장이면 저장처리로
	if( $('#btn-modify-save-' + id).text() == '수정' ){
		
		var tag = "<textarea id='modify-comment-" + id 
						+ "' style='margin-top:5px; width:99%; height:40px;'>" 
				+ $('#original-' + id).html().replace(/<br>/g, '\n')
				+ "</textarea>";
		$('#modify-' + id ).html( tag );
		display_mode( id, 'm' ); //수정클릭한 글에 대해 변경모드 적용
		
	}else{
		
		var comment = new Object();
		comment.id = id;
		comment.content = $('#modify-comment-' +id).val();
		$.ajax({
			type: 'post',
			data: JSON.stringify( comment ),
			contentType: 'application/json; charset=utf-8',
			url: 'cs/comment/update',
			success: function( result ){
				alert("댓글 변경 " + result );
				go_comment_list();
			},
			error: function(req, text){
				alert(text + ": " + req.status);
			}
		});
	}
}

function display_mode(id, mode){
	//수정모드시는 저장/취소, 아니면 수정/삭제 
	$('#btn-modify-save-' + id).text( mode == 'm' ? '저장' : '수정' );
	$('#btn-delete-cancel-' + id).text( mode == 'm' ? '취소' : '삭제' );
	//수정모드시는 원글은 안보이게, 변경입력글은 보이게
	$('#original-' + id).css('display', mode == 'm' ? 'none' : 'block');
	$('#modify-' + id).css('display', mode == 'm' ? 'block' : 'none');
}
</script>    
    
    
    
    
    