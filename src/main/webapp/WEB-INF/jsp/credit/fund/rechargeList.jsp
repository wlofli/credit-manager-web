<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content="" />
<meta http-equiv="description" content="" />
<title>信贷经理-资金管理</title>
<link rel="icon" href="../images/moke.ico" />
<%@include file="../../commons/common.jsp" %>
<script type="text/javascript">
function changePage(url , topage){
	var totalpage = $("#help_totalPage").val();
	if(topage>totalpage){
		alert("所写页码大于总页码了, 当前总页码为"+totalpage);
		return;
	}
	var uri = url+topage;
	$("#searchForm").attr("action",uri);
	$("#searchForm").submit();
}

function search(){
	$("#searchForm").submit();
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
<span>资金管理</span>
</div>
<div class="grzx_nr">
<%@include file="fundHead.jsp" %>
<div class="news_nr"> 
<table class="tjhy_table" cellpadding="0" cellspacing="0">
<thead>
<tr>
<td colspan="1">时间</td>
<td colspan="1">订单号</td>
<td colspan="1">类型</td>
<td colspan="1">充值金额</td>
<td colspan="1">状态</td>
<td colspan="1">备注</td>
<td colspan="1">流水号</td> 
<td colspan="1">账户余额</td> 
</tr>
</thead>
<tbody>
<c:forEach items="${page.data }" var="list">
<tr>
<td colspan="1">${list.rechargeTime }</td>
<td colspan="1">${list.orderId }</td>
<td colspan="1">${list.rechargeType }</td>
<td colspan="1">${list.rechargeAmountShow }</td>
<td colspan="1">${list.status }</td>
<td colspan="1">${list.remark } </td>
<td colspan="1">${list.sericalNumber }</td>
<td colspan="1">${list.currentAmountShow }</td> 
</tr>
</c:forEach>
</tbody>
</table>
</div>
<p:page url="${ctx }/credit/user/recharge/list" pageData="${page}"></p:page>
<input type="hidden" value="${page.totalPage }" id="help_totalPage">
</div>
</div></div>
<div class="clear"></div>
</div>
</body>
</html>