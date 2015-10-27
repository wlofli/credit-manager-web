<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户过期</title>
<script type="text/javascript">
var time = 5;
function timer(){
	if (time == 0) {
		document.location.href="${ctx}/login/credit/page";
	} else {
	time = time - 1;
	document.getElementById("time").innerHTML = time;
	setTimeout(function(){timer()},1000);
	}
	
}
</script>
<style>
.ts{ height:100px; width:100%; margin:0 auto; position:absolute; top:50%; left:0; margin-top:-50px; }
h1{ text-align:center;font-size:18px; color:#666; font-family:"微软雅黑"; height:30px; line-height:30px;}
h2 a{ color:#69F; font-size:14px; display:block; width:100%; height:30px; line-height:30px; font-family:"微软雅黑"; text-align:center;}
h2 a:hover{ color:#a00; text-decoration:none;}

</style>
</head>
<body onload="timer()">
<div class="ts">
<h1>未登陆或者用户过期，<span id="time"></span>秒后返回登陆界面>>>></h1>
<h2><a href="${ctx }/login/credit/page">立即返回</a></h2>
</div>
</body>
</html>