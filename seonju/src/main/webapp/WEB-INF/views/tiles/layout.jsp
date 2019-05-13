<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="vs" value="<%=new java.util.Date().getTime() %>"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="appTitle" /> 쑥's 초코파이</title>
<link rel="stylesheet" type="text/css" href="css/common.css?version=${vs }">
<link rel="icon" type="image/x-icon" href="img/ss_webpage_icon.png">		
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<tiles:insertAttribute name="header"/>
<tiles:insertAttribute name="quickMenu" />
<tiles:insertAttribute name="main"/><br/>
<tiles:insertAttribute name="footer"/>
</body>
</html>





