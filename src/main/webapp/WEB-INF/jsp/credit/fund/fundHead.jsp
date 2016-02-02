<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<script type="text/javascript">
$(function(){
	
// 	$("div.left li").each(function(){
// 		$(this).removeClass("hit");
// 	});
	$("a.zh").parent().addClass("hit");
	$("a.zh").parent().children().find("li").eq(3).addClass("hit");
	
});
</script>

<div class="news_cx">
	<span>账户余额：<strong>
	<c:choose>
		<c:when test="${empty outline.cashRemain }">0</c:when>
		<c:otherwise>${outline.cashRemain }</c:otherwise>
	</c:choose>
	</strong>元
	</span><a href="#" class="cz_btn">立即充值</a>
	<span class="ljjf">累计充值：<strong>
		<c:choose>
			<c:when test="${empty outline.rechargeTotal}">0</c:when>
			<c:otherwise>${outline.rechargeTotal }</c:otherwise>
		</c:choose>
	</strong>元</span>
	<span class="ljjf">累计消费：<strong>
	<c:choose>
			<c:when test="${empty outline.consumptionTotal}">0</c:when>
			<c:otherwise>${outline.consumptionTotal }</c:otherwise>
	</c:choose>
	</strong>元</span>
	<span class="ljjf">奖励金额：<strong>
	<c:choose>
			<c:when test="${empty outline.rewardTotal}">0</c:when>
			<c:otherwise>${outline.rewardTotal }</c:otherwise>
	</c:choose>
	</strong>元</span>
	<span class="ljjf">代金券余额：<strong>
	<c:choose>
			<c:when test="${empty outline.rewardRemain}">0</c:when>
			<c:otherwise>${outline.rewardRemain }</c:otherwise>
	</c:choose>
	</strong>元</span>
</div>
<div class="grzx_nr1">
<ul>
<li><a href="${ctx }/credit/user/detail/list" <c:if test="${fundtype == '1' }">class="hit"</c:if>>账户详情</a></li>
<li><a href="${ctx }/credit/user/consumption/list" <c:if test="${fundtype == '2' }">class="hit"</c:if>>消费记录</a></li>
<li><a href="${ctx }/credit/user/recharge/list" <c:if test="${fundtype == '3' }">class="hit"</c:if>>充值记录</a></li>
<li><a href="${ctx }/credit/user/reward/list" <c:if test="${fundtype == '4' }">class="hit"</c:if>>奖励记录</a></li>
<li><a href="${ctx }/credit/user/withdraw/list" <c:if test="${fundtype == '5' }">class="hit"</c:if>>提现记录</a></li>
</ul>
</div>

<c:choose>
<c:when test="${fundtype == '1' }">
	<sf:form action="${ctx }/credit/user/detail/list" method="post" id="searchForm">
	<div class="news_cx">
	<span>开始时间：</span><input name="startTime" value="<fmt:formatDate value="${search.startTime }" pattern="yyyy-MM-dd"/>"  type="text" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
	<span>结束时间：</span><input name="endTime" value="<fmt:formatDate value="${search.endTime }" pattern="yyyy-MM-dd"/>" type="text" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />
	<input type="button"  class="search_btn" value="查询" onclick="javascript:search()"/></div>
	</sf:form>
</c:when>
<c:when test="${fundtype == '2' }">
<sf:form action="${ctx }/credit/user/consumption/list" method="post" id="searchForm">
	<div class="news_cx">
	<span>开始时间：</span><input name="startTime" value="<fmt:formatDate value="${search.startTime }" pattern="yyyy-MM-dd"/>"  type="text" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
	<span>结束时间：</span><input name="endTime" value="<fmt:formatDate value="${search.endTime }" pattern="yyyy-MM-dd"/>" type="text" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />
	<input type="button"  class="search_btn" value="查询" onclick="search()"/></div>
	</sf:form>
</c:when>
<c:when test="${fundtype == '3' }">
<sf:form action="${ctx }/credit/user/recharge/list" method="post" id="searchForm">
	<div class="news_cx">
	<span>开始时间：</span><input name="startTime" value="<fmt:formatDate value="${search.startTime }" pattern="yyyy-MM-dd"/>"  type="text" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
	<span>结束时间：</span><input name="endTime" value="<fmt:formatDate value="${search.endTime }" pattern="yyyy-MM-dd"/>" type="text" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />
	<input type="button"  class="search_btn" value="查询" onclick="search()"/></div>
	</sf:form>
</c:when>
<c:when test="${fundtype == '4' }">
<sf:form action="${ctx }/credit/user/reward/list" method="post" id="searchForm">
	<div class="news_cx">
	<span>开始时间：</span><input name="startTime" value="<fmt:formatDate value="${search.startTime }" pattern="yyyy-MM-dd"/>"  type="text" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
	<span>结束时间：</span><input name="endTime" value="<fmt:formatDate value="${search.endTime }" pattern="yyyy-MM-dd"/>" type="text" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />
	<input type="button"  class="search_btn" value="查询" onclick="javascript:search()"/></div>
	</sf:form>
</c:when>
<c:when test="${fundtype == '5' }">
<sf:form action="${ctx }/credit/user/withdraw/list" method="post" id="searchForm">
	<div class="news_cx">
	<span>开始时间：</span><input name="startTime" value="<fmt:formatDate value="${search.startTime }" pattern="yyyy-MM-dd"/>"  type="text" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
	<span>结束时间：</span><input name="endTime" value="<fmt:formatDate value="${search.endTime }" pattern="yyyy-MM-dd"/>" type="text" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />
	<input type="button"  class="search_btn" value="查询" onclick="search()"/></div>
	</sf:form>
</c:when>
</c:choose>