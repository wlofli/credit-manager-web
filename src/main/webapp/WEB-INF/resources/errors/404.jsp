<%@ page language="java" isErrorPage="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>404页面</title>
<style>
*{
	margin:0;
	padding:0;
	border:0;}
body{
	width:100%;
	height:100%;}
.404{
	width:100%;
	height:auto;
	min-height:100%;}
.img_404{
	position:absolute;
	top:50%;
	left:50%;
	margin-top:-500px;
	margin-left:-500px;}

</style>
</head>

<body>
<div class="404">
<a href="#">
<img src="${ctx }/images/404.png" class="img_404" />
</a>
</div>
</body>
</html>
