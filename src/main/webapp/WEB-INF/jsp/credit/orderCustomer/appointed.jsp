<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content="" />
<meta http-equiv="description" content="" />
<title>信贷经理-客户管理-推送客户</title>
<link rel="icon" href="../images/moke.ico" />
<%@include file="../../commons/common.jsp" %>
<script type="text/javascript">

</script>
<script>
$(document).ready(function(){
$(".gly").click(function(){
    $(".zkcd").slideToggle("slow");
  });
});

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

function fastsearch(n){
	$("#status").val(n);
	window.location.href='${ctx }/order/appointlist?status=' + n;
}


function sub(){
	$("#status").attr("value","");
// 	alert("ok")
	$("#searchForm").submit();
}
</script> 
</head>

<body>
<div class="main">
<jsp:include page="../../commons/left.jsp"></jsp:include>
<div class="right">
<div class="r1">
<div class="r1_l">
<a href="#" class="xl" title="新浪分享"></a>
<a href="#" class="wx" title="微信分享"></a>
<a href="#" class="qq" title="qq分享"></a>
<div class="clear"></div>
</div>
<div class="r1_r">
<a href="cptg.html" class="cp" title="新产品"><span>3</span></a>
<a href="news.html" class="xx" title="新消息"><span>12</span></a>
<a href="#" class="gly" title="">刘小小</a>
<div class="zkcd"><a href="xgmm.html">修改密码</a><a href="login.html">退出</a></div>
<div class="clear"></div>
</div>
</div>
<div class="grzl">
<div class="grzx_bt">
<span>推送客户</span><span class="khgl_zs">正确反馈订单信息，可以增加您的平台积分</span><a href="javascript:show2()">查看详情> </a>
</div>
<div class="grzx_nr1">
<ul>
<li><a href="khgl.html" class="hit">全部订单</a></li>
<li><a href="khgl1.html">自动推送</a></li>
<li><a href="khgl2.html">指定推送</a></li>
</ul>
</div>
<div class="khgl_top">
<div class="khgl_top1">
<span class="ss_bt">快速筛选：</span>
<ul class="sxtj1">
<c:forEach items="${orderStatusList }" var="list">
<li><a href="javascript:fastsearch('${list.key }')">${list.value }<strong>${list.num }</strong></a></li>
</c:forEach>

</ul>
</div>
<div class="khgl_top2">
<span class="ss_bt">高级筛选：</span>
<div class="gjsx">
<sf:form action="${ctx }/order/appointlist" method="post" commandName="searchCustomer" id="searchForm">
<sf:hidden path="status"/>
<span>申请日期：</span>

<sf:input path="startTime" cssClass="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
<span class="datefgx">-</span>
<sf:input path="endTime" cssClass="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>

<span class="xzcp_bt">选择产品：</span>
	<sf:select path="product" cssClass="xzcp_s1">
		<sf:option value="">请选择</sf:option>
		<sf:options items="${productList }" itemLabel="value" itemValue="key"/>
	</sf:select>
<span class="xzcp_bt">订单编号：</span>
<sf:input path="code" cssClass="ddbh"/>
<br /><span class="xzcp_bt1">客户电话：</span>
<sf:input path="applicantPhone" cssClass="ddbh"/>
<span class="xzcp_bt">客户姓名：</span>
<sf:input path="applicantName" cssClass="ddbh"/>
<input type="button" class="cx_btn" value="查 询" onclick="sub()"/>
</sf:form>
</div>

</div>
</div>
<div class="news_nr">
<p>未能查找到您想要的结果，请确认您的搜索条件正确，或<a href="#">点此查看全部订单></a></p>
</div>
<div class="news_nr"> 
<table class="tjhy_table" cellpadding="0" cellspacing="0">
<thead>
<tr>
<td colspan="1">订单编号</td>
<td colspan="1">申请人</td>
<td colspan="2">产品名称</td>
<td colspan="2">申请人电话</td>
<td colspan="1">贷款额度<br />/万元</td>
<td colspan="1">贷款期限<br />/月</td>
<td colspan="2">贷款单位</td>
<td colspan="2">申请时间</td>
<td colspan="2">订单状态</td>
<td colspan="2">操作</td>
</tr>
</thead>
<tbody>
<c:forEach items="${page.data }" var="list">
<tr>
<td colspan="1">${list.code }</td>
<td colspan="1">${list.applicantName }</td>
<td colspan="2">${list.productName }</td>
<td colspan="2">${list.applicantPhone }</td>
<td colspan="1">${list.credit }</td>
<td colspan="1">${list.limitDate }</td>
<td colspan="2">${list.companyName }</td>
<td colspan="2"><fmt:formatDate value="${list.applicantTime }" pattern="yyyy-MM-dd h:m"/></td>
<td colspan="2">${list.status }</td>
<td colspan="2"><a href="javascript:show()" >获取</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<p:page url="${ctx }/order/appointlist" pageData="${page}"></p:page>
<input type="hidden" value="${page.totalPage }" id="help_totalPage">
</div></div>
<div class="clear"></div>
</div>

<div id="login2" style="margin-top:-80px; margin-left:-80px;">
       <div class="login1"> 
         <div class="bt"><h1>积分说明</h1><a href="javascript:hide2()"><img src="../images/close.png" /></a><div class="clear"></div></div>
      
       <div class="cj_nr">
       <p>内容待填充，采用图文结合方式说明推广方法</p>
       
       
       
       </div>
        </div>
  </div>
 <div id="over"></div>

</body>
</html>

<script type="text/javascript">
 var login2=document.getElementById("login2");
 var over=document.getElementById("over");
	 function show2()
     {
        login2.style.display = "block";
        over.style.display = "block";
     }
     function hide2()
   {
        login2.style.display = "none";
        over.style.display = "none";
    }
</script>
