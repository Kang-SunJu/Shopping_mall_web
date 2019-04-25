<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오류</title>
<link rel="icon" type="image/x-icon" href="img/hanul.ico">
<style type="text/css">
#error {
	width: 600px; margin: 0 auto;
	position: absolute;
	left: 50%;   top: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
<div id="error">
	<div class="left">
		<a onclick="location='index'"><img src="img/hanul.logo.png"/></a>
	</div><hr>
	<div class="left">
		<tiles:insertAttribute name="main"/>
	</div>
</div>
</body>
</html>