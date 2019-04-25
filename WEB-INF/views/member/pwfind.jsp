<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호찾기!</title>

<body>

<script language="javascript">
function chk_val() {
	
	with(document.pwSearchFm) {
		if(!user_id.value) {
			alert("아이디를 입력하세요.")
			user_id.focus();
			return false
		}
		if(!user_email1.value) {
			alert("이메일을 입력하세요.")
			user_email1.focus();
			return false
		}
		if(!user_email2.value) {
			alert("이메일을 입력하세요.")
			user_email2.focus();
			return false
		}

		submit();
		return true;
	}
}

(function($) {
    $(function () {
        $(document).ready(function () {
        });//ready
 
        $(window).load(function () {
            popupAutoResize();//팝업리사이징
        });//load
    });//$
 
    function popupAutoResize() {
		var w = $(document).width();
		var h = $(document).height();
		window.resizeTo(w, h);
		 
		var mw = window.outerWidth - window.innerWidth;
		var mh = window.outerHeight - window.innerHeight;
		window.resizeBy(mw, mh);
		 
		if (msieversion() < 9) {
			mw = $(document).outerWidth() - $(window).width();
			mh = $(document).outerHeight() - $(window).height();
			window.resizeBy(mw, mh);
		}
	}
    function msieversion() {//익스버전체크
        var ua = window.navigator.userAgent
        var msie = ua.indexOf ( "MSIE " )
        if ( msie > 0 ) // If Internet Explorer, return version number
            return parseInt (ua.substring (msie+5, ua.indexOf (".", msie )))
        else // If another browser, return 0
            return 0
    }
})(jQuery);

//-->
</script>
</head>

<body>
<form style="float: left" method="post" name="pwSearchFm" action="pw_find" onSubmit="return chk_val();">
	<input type="hidden" name="strPageCode1" value="ZVFMR0hBZThnOG9xaDlGV1pibnJPZ3hMY2U=">

     <h3>비밀번호 찾기</h3>
            <p>아이디와 가입하실때 입력하신 이메일을 입력해주세요.</p>
             <h3>아이디</h3>
                    <label for="user_id">아이디 입력</label>
                    <input type="text" id="user_id" name="user_id" />
            <h3>이메일</h3>
                    <label for="user_email1">이메일 입력</label>
                    <input type="text" id="user_email1" name="user_email1" />
                    <span>@</span>
                    <label for="user_email2"></label>
                    <input type="text" id="user_email2" name="user_email2" />
        
        
    				<button type="submit" id=findPwBtn class="btn-fill">임시비밀번호 발급</button>
    				<button type="button" onclick="history.go(-1);" class="btn-fill">취소</button>
    
       </form>
    </body>
</html>
