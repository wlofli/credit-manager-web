<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"  %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理-帮助中心</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="icon" href="${ctx}/images/moke.ico" />
<link href="${ctx}/css/base.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/js/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="${ctx}/js/My97DatePicker.4.8/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$("div.left li").each(function(){
		$(this).removeClass("hit");
	});
	$("a.bz").parent().addClass("hit");
	$("a.bz").parent().children().find("li").eq(0).addClass("hit");
});
function changePage(url , topage){
	var totalpage = $("#help_totalPage").val();
	if(topage<0){
		alert("所写页码需大于0");
		return;
	}
	if(topage>totalpage){
		alert("所写页码大于总页码了, 当前总页码为"+totalpage);
		return;
	}
	var uri = url+topage;
	document.location.href=uri;
}
</script> 
</head>
<body>
	
	<div class="main">
		<jsp:include page="../../commons/left.jsp"></jsp:include>
		<div class="right">
			<jsp:include page="../../commons/head.jsp"></jsp:include>
			<div class="grzl">
				<div class="grzx_bt">
					<span>帮助中心</span>
				</div>
				<div class="grzx_nr">
					<Div class="bzzx">
						<div class="news_list">
							<ul>
								<c:forEach items="${pagedata.data }" var="help">
									<li class="bz"><i></i><a href="javascript:void(0)" onclick="document.location.href='${ctx}/credit/help/edit${help.id }'">${help.title }</a></li>
								</c:forEach>
							</ul>
						</div>
					</Div>
					<p:page url="${ctx }/credit/help/find" pageData="${pagedata }"></p:page>
					<input type="hidden" value="${pagedata.totalPage }" id="help_totalPage">
				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
</body>

</html>