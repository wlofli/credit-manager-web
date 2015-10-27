<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content="" />
<meta http-equiv="description" content="" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<title>信贷经理-订单跟踪记录</title>
<link rel="icon" href="../images/moke.ico" />
<%@ include file="../../commons/common.jsp"%>

<script type="text/javascript">

function changeSel(option){
	if(option == 10){
		$("#fkcg").show();
		
	}else{
		$("#creditTime").attr("value","");
		$("#creditReal").attr("value","");
		$("#fkcg").hide();
	}
	
	
}
function  validTime(){
	var creditTime = new Date($("#creditTime").val());
	var nowTime =  new Date();
	return nowTime<creditTime;
}


function addtrack(){
	if($("#status").val() == '10'){
		if($("#creditTime").val() == '' ){
			alert("放款时间不能为空")
			return;
		}
		if($("#creditReal").val() == ''){
			alert("放款金额不能为空");
			return;
		}
		if(validTime()){
			alert("放款时间不能为今天以后");
			return;
		}
	}
	$.ajax({
		   url:"${ctx}/order/cusomer/addtrack",
		   type:"post",
		   data:$("#form").serialize(),
		   async:true,
		   success:function(data){
			   if(data == "success"){
					  alert("保存成功"); 
					  location.replace(location.href);
				   }else{
					  alert("保存失败");
				   }
		   }
		});
	
}

function addinfo(n,p){
	$("#info").attr("value",n);
	$("#price").attr("value",p);
	$.ajax({
		   url:"${ctx}/order/cusomer/addtrack",
		   type:"post",
		   data:$("#infoForm").serialize(),
		   async:true,
		   success:function(data){
			    if(data == "success"){
				  alert("下载成功"); 
				  location.replace(location.href);
			   }else{
				  alert("下载失败");
			   }
		   }
	});
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
<span>订单跟踪记录</span>
</div>
<div class="grzx_nr"> 
<div class="khwd_xq_nr">
<div class="khwd_xq_nr_bt">
<span>产品名称：<strong>${order.productInfo }</strong></span>
<span>所属机构：<strong>${order.organization }</strong></span>


<span class="dd_zt">订单状态：<strong>
<c:forEach items="${statuslist }" var="list">
	<c:if test="${list.key == order.status }">${list.value }</c:if>
</c:forEach>
</strong></span>
</div>
<div class="khwd_xq_nr_cont">
<div class="dd_xq_xx">
<p>
<span>贷款金额(万)：${order.credit }</span>
<span>贷款期限(月)：${order.limitDate }</span>
<span>贷款人姓名：${order.applicantName }</span>
<span>贷款人电话：${order.applicantPhone }</span>
</p>
<p>
<span>借款单位：${order.companyName }</span>
<span>申贷时间：<fmt:formatDate value="${order.applicantTime }" pattern="yyyy-MM-dd"/></span>
</p>
<c:choose>
<c:when test="${order.status == 10 || order.status == 11 }">
<p>
<span>订单状态：
<c:forEach items="${statuslist }" var="list">
	<c:if test="${list.key == order.status }">${list.value }</c:if>
</c:forEach></span>
<span>放款金额(万元)：${order.creditReal }</span>
<span>放款时间：<fmt:formatDate value="${order.receiveTime }" pattern="yyyy-MM-dd"/></span>
</p> 
<p>

<span>补充说明：</span> 
</c:when>
<c:otherwise>
<sf:form action="${ctx }/order/addtrack" commandName="order" method="post" id="form">
<input type="hidden" name="orderId" value="${order.id }" />
<input type="hidden" name="orderType" value="${order.type }" />
<p class="hform">
<span>订单状态：</span>
<sf:select path="status" id="status" cssClass="ddzt_s1" onchange="changeSel(this.options[this.options.selectedIndex].value)">
	<sf:options items="${statuslist }" itemLabel="value" itemValue="key" />
</sf:select>
</p> 
<p class="hform" id="fkcg" style="display:none;">
<span>放款时间：</span>
<input type="text" id="creditTime" name="creditTime" class="ddzt_d1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />
<span>放款金额：</span>
<input type="text" id="creditReal" name="creditReal" class="ddzt_j1" /><span class="ddzt_dw">万元</span>
</p>
<p class="hform">
<span>补充说明：</span>
<textarea name="remark" class="ddzt_t1" onfocus="if(this.value==defaultValue) {this.value='';this.type='password'}" onblur="if(!value) {value=defaultValue; this.type='text';}" >此处最多可输入100个文字</textarea>
</p> 
<p class="hform">
<input type="button" class="ddzt_b1" onclick="javascript:addtrack()" value="保 存" />
</p>
</sf:form>
</c:otherwise>
</c:choose>

<form action="${ctx }/order/cusomer/addtrack" method="post" id="infoForm">
<input type="hidden"  name="status" value="${order.status }" />
<input type="hidden" name="orderId" value="${order.id }" />
<input type="hidden" name="orderType" value="${order.type }" />
<input type="hidden" id="price" name="price" value="" />
<input type="hidden" id="info" name="info" value="" />
</form>
<ul class="xzxx">
<li><span class="bt">基本信息</span><a href="javascript:void(0)" onclick="addinfo('base',10)" class="xz_btn">确认下载</a><span class="zs">下载需扣费10元</span><a href="#" class="xxsm">信息内容说明</a></li>
<li><span class="bt">经营信息</span><a href="javascript:void(0)" onclick="addinfo('business',20)" class="xz_btn">确认下载</a><span class="zs">下载需扣费30元</span><a href="#" class="xxsm">信息内容说明</a></li>
<li><span class="bt">房产信息</span><a href="javascript:void(0)" onclick="addinfo('house',30)" class="xz_btn">确认下载</a><span class="zs">下载需扣费50元</span><a href="#" class="xxsm">信息内容说明</a></li>
</ul>

</div>
</div>
</div> 
<div class="news_nr"> 
<table class="tjhy_table" cellpadding="0" cellspacing="0">
<thead>
<tr class="table_bt">
<td colspan="4">订单跟踪明细</td>
</tr>
<tr>
<td colspan="1">跟踪日期</td>
<td colspan="1">订单状态</td>
<td colspan="1">下载企业信息情况</td>
<td colspan="1">状态描述</td>
</tr>
</thead>
<tbody>
<c:forEach items="${tracklist }" var="list">
<tr>
<td colspan="1"><fmt:formatDate value="${list.createdTime }" pattern="yyyy-MM-dd"/></td>
<td colspan="1">${list.status }</td>
<td colspan="1">
	<c:if test="${list.info != null and list.info != ''}">已下载${list.info }</c:if>
	<c:if test="${list.price != null && list.price != '' }">(${list.price }元)</c:if>
</td>
<td colspan="1">${list.remark } </td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>

</div>
</div>
<div class="clear"></div>
</div>
</body>
</html>
