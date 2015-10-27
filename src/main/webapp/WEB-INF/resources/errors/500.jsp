<%@ page language="java" isErrorPage="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>500页面</title>
<style>
*{
	margin:0;
	padding:0;
	border:0;}
body{
	width:100%;
	height:100%;
	background:#303030;}
.500{
	width:100%;
	height:auto;
	min-height:100%;}
.img_500{
	position:absolute;
	top:50%;
	left:50%;
	margin-top:-250px;
	margin-left:-250px;}

</style>
</head>

<body>
<div class="404">
<a href="#">
<img src="${ctx }/images/500.png" class="img_500" />
</a>
</div>
</body>
</html>
