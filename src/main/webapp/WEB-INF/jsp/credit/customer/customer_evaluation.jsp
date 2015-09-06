<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理_客户管理_客户评价</title>
<%@ include file="../../commons/common.jsp"%>
</head>
<body>
	<div class="main">
		<jsp:include page="../../commons/left.jsp"></jsp:include>
		<div class="right">
			<jsp:include page="../../commons/head.jsp"></jsp:include>
			<div class="grzl">
				<div class="grzx_bt">
					<span>客户评价</span><span class="khgl_zs">请关注用户对您的评价，今后会纳入您的服务评价</span>
				</div>
				<div class="news_nr">
					<table class="tjhy_table" cellpadding="0" cellspacing="0">
						<thead>
							<sf:form action="${ctx}/customer/search" commandName="ceSearch" method="post" id="searchForm">
							<tr>
								<td colspan="1">订单编号</td>
								<td colspan="1">申请产品</td>
								<td colspan="1">申请人</td>
								<td colspan="1">评价时间</td>
								<td colspan="1">
									<sf:select path="starLevel" cssClass="khpj_s1" onchange="search()">
										<sf:option value="0">评价等级</sf:option>
										<sf:options items="${stars}" itemValue="key" itemLabel="value" />
									</sf:select>
									<sf:hidden path="page" id="id_page"/>
								</td>
							</tr>
							</sf:form>
						</thead>
						<tbody>
							<c:forEach items="${evaluations}" var="evaluation" varStatus="vs">
							<tr>
								<td colspan="1">${evaluation.orderId}</td>
								<td colspan="1">${evaluation.productName}</td>
								<td colspan="1">${evaluation.applicant}</td>
								<td colspan="1">${evaluation.evaluationTime}</td>
								<td colspan="1">
									<img src="${ctx}/images/${evaluation.starLevel}" />
									<span class="khpj_xj">${evaluation.starName}</span>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="page">
					<p:page url="${ctx }/credit/case/page" pageData="${pageData}"></p:page>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</body>
<script type="text/javascript">
function search(){
	$("#id_page").val(1);
	$("#searchForm").submit();
}

function changePage(url,currentPage){
	if (currentPage != "") {
		$("#id_page").val(currentPage);
		$("#searchForm").submit();
	}
}
</script>
</html>