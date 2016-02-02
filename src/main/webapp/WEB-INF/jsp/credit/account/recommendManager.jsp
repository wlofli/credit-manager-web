<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content="" />
<meta http-equiv="description" content="" />
<title>信贷经理-推荐会员列表</title>
<link rel="icon" href="../images/moke.ico" />
<%@ include file="../../commons/common.jsp"  %>
<script type="text/javascript">
$(function(){
	$("div.left li").each(function(){
		$(this).removeClass("hit");
	});
	$("a.zh").parent().addClass("hit");
	$("a.zh").parent().children().find("li").eq(2).addClass("hit");
	
});

</script>
<script>
function search(){
	$("#searchForm").submit();
}


function changePage(url , topage){
	var totalpage = $("#help_totalPage").val();
	if(topage>totalpage){
		alert("所写页码大于总页码了, 当前总页码为"+totalpage);
		return;
	}
	var uri = url+topage;
	$("#searchForm").attr("action",uri);
	$("#searchForm").submit();
// 	document.location.href=uri;
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
<span>推荐会员</span>
</div>
<div class="grzx_nr">
<div class="grzx_nr1">
<ul>
<li><a href="${ctx }/credit/user/recommend/member">推荐普通会员</a></li>
<li><a href="${ctx }/credit/user/recommend/manager" class="hit">推荐信贷经理</a></li>
</ul>
</div>
<div class="news_cx">
<span>注册时间：</span>
<sf:form action="${ctx }/credit/user/recommend/manager" method="post" id="searchForm" commandName="search">
<sf:input path="regigsterStartTime" cssClass="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
<span>--</span>
<sf:input path="registerEndTime" cssClass="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
<input type="button"  class="search_btn" onclick="search()" value="查询"/>
</sf:form>
</div>
<div class="news_nr"> 
<table class="tjhy_table" cellpadding="0" cellspacing="0">
<thead>
<tr>
<td colspan="1">序号</td>
<td colspan="2">推荐会员名</td>
<td colspan="3">推荐会员手机号</td>
<td colspan="2">推荐会员类型</td>
<td colspan="3">注册时间</td>
<!-- <td colspan="1">收益积分</td>  -->
<!-- <td colspan="2">收益金额/元</td> -->
</tr>
</thead>
<tbody>
<c:forEach items="${page.data }" var="list" varStatus="vs">
<tr>
<td colspan="1">${vs.count }</td>
<td colspan="2">${list.name }</td>
<td colspan="3">${list.telPhone }</td>
<td colspan="2">信贷经理</td>
<td colspan="3">${list.registerTime }</td>
<!-- <td colspan="1">10</td> -->
<!-- <td colspan="2">50</td> -->
</tr>
</c:forEach>

</tbody>
</table>
</div>
<p:page url="${ctx }/credit/user/recommend/manager" pageData="${page}"></p:page>
<input type="hidden" value="${page.totalPage }" id="help_totalPage">
</div>

</div>
</div>
<div class="clear"></div>
</div>
</body>
</html>
