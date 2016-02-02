<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理首页</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="icon" href="${ctx}/images/moke.ico" />
<link href="${ctx}/css/base.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/js/star.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("div.left li").each(function(){
		$(this).removeClass("hit");
	});
	$("a.zy").parent().addClass("hit");
	$("a.zy").parent().children().find("li").eq(0).addClass("hit");
	
});
</script>
</head>
<body>
<div class="main">
	<jsp:include page="../commons/left.jsp"></jsp:include>
	<div class="right">
		<jsp:include page="../commons/head.jsp"></jsp:include>
		<jsp:include page="../commons/center.jsp"></jsp:include>
	</div>
	<div class="clear"></div>
</div>
</body>
</html>