<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="keywords" content="" />
<meta http-equiv="description" content="" />
<title>信贷经理-帮助中心-积分说明</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="icon" href="${ctx }/images/moke.ico" />
<link href="${ctx }/css/base.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx }/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("div.left li").each(function(){
		$(this).removeClass("hit");
	});
	$("a.bz").parent().addClass("hit");
	$("a.bz").parent().children().find("li").addClass("hit");
});
</script> 
</head>
<body>
	<div class="main">
		<jsp:include page="../../commons/left.jsp"></jsp:include>
		<div class="right">
			<jsp:include page="../../commons/head.jsp"></jsp:include>
			<div class="grzl">
				<div class="grzx_bt">
					<a href="javascript:void(0)" onclick="history.back()" class="back_bz">帮助中心</a> <span>- 积分说明</span>
				</div>
				<div class="grzx_nr">
					<div class="fwpj">
						<p class="bt">${help.title }</p>
						${help.content }
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</body>
</html>