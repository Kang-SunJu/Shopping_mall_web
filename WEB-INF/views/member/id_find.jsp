<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='logintest';
		})
	})
</script>
<title>아이디 찾기</title>
</head>
<body>


			<div style="float: left">
				<h3>아이디 찾기 검색결과</h3>

			<div>
				<h5> 
					${ vo.userid }
				</h5>
				<p>
					<button type="button" id=loginBtn class="btn-fill">로그인하러가기</button>
					<button type="button" onclick="history.go(-1);" class="btn-fill">전단계로</button>
				</p>
			</div>
			</div>
</body>

</html>
