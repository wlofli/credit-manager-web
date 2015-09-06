<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"  %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理_成功案例</title>
<%@ include file="../../commons/common.jsp"%>
</head>
<body>
	<div class="main">
		<jsp:include page="../../commons/left.jsp"></jsp:include>
		<div class="right">
			<jsp:include page="../../commons/head.jsp"></jsp:include>
			<div class="grzl">
				<div class="grzx_bt">
					<span>成功案例</span><a href="${ctx}/credit/case/add" class="add_anli">新增成功案例</a>
				</div>
				<div class="grzx_nr">
					<div class="news_cx">
						<sf:form action="${ctx}/credit/case/search" commandName="searchInfo" method="post" id="searchForm">
							<span>产品名称：</span>
							<sf:input path="productName" cssClass="cgal_t1"/>
							<span>放款金额</span>
							<sf:input path="amountStart" cssClass="cgal_t2"/>
							<span>-</span>
							<sf:input path="amountEnd" cssClass="cgal_t2"/>
							<span>万元</span>
							<span>放款日期</span>
							<sf:input path="dateStart" cssClass="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
							<span>至</span>
							<sf:input path="dateEnd" cssClass="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
							<sf:hidden path="index" id="id_index"/>
							<sf:hidden path="managerId"/>
							<input type="button" class="search_btn" value="查询" onclick="search()"/>
						</sf:form>
					</div>
					<div class="news_nr">
						<table class="tjhy_table" cellpadding="0" cellspacing="0">
							<thead>
								<tr>
									<td colspan="1"></td>
									<td colspan="2">序号</td>
									<td colspan="2">产品名称</td>
									<td colspan="2">申请单位/人</td>
									<td colspan="2">贷款类型</td>
									<td colspan="2">放款金额/万元</td>
									<td colspan="3">放款日期</td>
									<td colspan="2">贷款期限/月</td>
									<td colspan="2">放款天数</td>
									<td colspan="2">所属地区</td>
									<td colspan="3">操作</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${successCases}" var="case" varStatus="vs">
								<tr>
									<td colspan="1">
										<input type="checkbox" class="cgal_c1" name="checkIndex" id="cb_${vs.index}"/>
									</td>
									<td colspan="2">${vs.index+1+(mpage.currentPage-1)*10}</td>
									<td colspan="2">${case.productName}</td>
									<td colspan="2">${case.applicantCompany}</td>
									<td colspan="2">${case.loanType}</td>
									<td colspan="2">${case.loanAmount}</td>
									<td colspan="3">${case.loanDate}</td>
									<td colspan="2">${case.loanPeriod}</td>
									<td colspan="2">${case.loanDays}</td>
									<td colspan="2">${case.loanProvince}${case.loanCity}</td>
									<td colspan="3">
										<a href="javascript:void(0);" class="edit_btn" onclick="edit('${case.id}')">编辑</a>
										<a href="javascript:void(0);" class="del_btn" onclick="del('${case.id}')">删除</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="page">
						<a href="javascript:void(0);" class="fl_left" onclick="selectAll()">全选</a>
						<a href="javascript:void(0);" class="fl_left" onclick="selectNone()">取消选择</a>
						<a href="javascript:void(0);" class="fl_left" onclick="del('-99')">删除</a>
						<p:page url="${ctx }/credit/case/page" pageData="${mpage}"></p:page>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</body>
<script type="text/javascript">
function search(){
	$("#id_index").val(0);
	$("#searchForm").submit();
}
function changePage(url,currentPage){
	if (currentPage != "") {
		$("#id_index").val(currentPage-1);
		$("#searchForm").submit();
	}
}
function selectAll(){
	$("[name = checkIndex]:checkbox").prop("checked", true);
}
function selectNone(){
	$("[name = checkIndex]:checkbox").prop("checked", false);
}
function del(id){
	var delCode = "";
	if (id="-99") {
		for (var i = 0; i < 10; i++) {
			if ($("#cb_"+i).is(':checked')) {
				delCode = delCode + $("#hid_code_"+i).val() + "~";
			}
		}
	}else{
		delCode = id;
	}
	
	$.ajax({
		url:"${ctx}/credit/case/delete?caseIds="+delCode,
		type:"post",
		success:function(data){
			alert("删除成功");
			$("#searchForm").submit();
		}
	});
}
function edit(id){
	document.location.href="${ctx}/credit/case/edit?caseId="+id;
}
</script>
</html>