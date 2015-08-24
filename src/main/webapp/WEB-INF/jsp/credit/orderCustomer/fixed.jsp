<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="keywords" content="" />
<meta http-equiv="description" content="" />
<title>信贷经理-获取客户-立即领取客户</title>
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
	document.location.href=uri;
}

</script> 
<script type="text/javascript">
function show1(price,fixedId){
$("#price").html(price);
$("#buy").attr("href","javascript:buyfixed('"+ fixedId + "')");
$("#xgcj").show();
$("#over").show();
}
function hide1(){
$("#xgcj").hide();
$("#over").hide();
}
function show(){
	$("#login").show();
	$("#over").show();
}
function hide(){
	$("#login").hide();
	$("#over").hide();
}
function buyfixed(fixId){
// alert("in");
	$.ajax({
		   url:"${ctx}/order/buyfixed",
		   method:"post",
		   data:{"fixId":fixId},
		   sync:true,
		   success:function(data){
			   var jsonData = eval('('+data+')');
			   if(jsonData.result == 'success'){
				   alert("领取成功");
				   window.location.href = '${ctx}/order/fixlist';
			   }else if(jsonData.result == '余额不足'){
					show();   
			   }else{
				   alert(jsonData.message);
			   }
		   }
		});
	hide1();
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
<span>立即领取</span>
</div>
<div class="grzx_nr">
<div class="news_cx">
<sf:form action="${ctx }/order/fixlist" method="post" commandName="searchCustomer" id="searchForm">
<span>抵押物：</span>
<sf:select path="collateral" cssClass="dklx_s1">
<sf:options items="${collateralList}"  itemValue="key" itemLabel="value" ></sf:options>
</sf:select>
<span>信用记录：</span>
<sf:select path="twoYearCredit" cssClass="dklx_s1">
<sf:options items="${creditList }" itemLabel="value" itemValue="key"/>
</sf:select>

<input type="button"  class="search_btn" onclick="search()" value="查询"/>
</sf:form>
</div>
<div class="ljlq_bt">共有<strong>${page.total }</strong>条结果</div>
<div class="ljlq">
<ul>
<c:forEach items="${page.data }" var="list" varStatus="vs" > 
<li class=<c:if test="${vs.count % 2 == 0 }">bj_none</c:if>>
<div class="lq_left">
<img src="../images/tx1.jpg" />
<span>${list.applicantName }</span>
</div>
<div class="lq_right">
<div class="lq_right_left1">
<span>企业类型：${list.companyType }</span>
<span>员工数：${list.personNum }人</span>
<span>年销售收入：${list.sales }万</span>
<span>企业经营年限：${list.runYear }年</span>
</div>
<div class="lq_right_left2">
<span>贷款额度：${list.credit }万元</span>
<span>担保方式：${list.guaranteeType }</span> 
<span>信用记录：${list.twoYearCredit }</span>
<span>抵押物：${list.collateral }</span>
</div>
<div class="lq_right_left3">
<span>申贷期限：${list.limitDate }月</span>
<span>企业年增值税：${list.totalVat }万元</span> 
<a href="javascript:show1('${list.price }','${list.id }')" class="ckkhxq_btn">立即购买</a>
</div>
</div>
</li>
</c:forEach>
</ul>
</div>
<p:page url="${ctx }/order/fixlist" pageData="${page}"></p:page>
<input type="hidden" value="${page.totalPage }" id="help_totalPage">
</div>
</div>
<div id="login" style="margin-top:-20px; margin-left:-50px;">
       <div class="login1">
       <div class="bt"><h1>立即购买</h1><a href="javascript:hide()"><img src="../images/close.png" /></a><div class="clear"></div></div>
       <div class="cj_nr">
       <p class="yebz">抱歉，您的帐号余额不足，领取客户需要20元。<a href="cz.html">立即充值></a></p>
       <p class="cj_btn"><a href="#" class="cj_qx_btn">取消</a></p>
	   </div>
       </div>
  </div>
  
<div id="xgcj" style="margin-top:-20px; margin-left:-50px;">
       <div class="login1">
      <div class="bt"><h1>立即购买</h1><a  href="javascript:hide1()"><img src="../images/close.png" /></a><div class="clear"></div></div>
       <div class="cj_nr">
       <p class="yebz">您好，领取该客户需要付费<span id="price">20</span>元。</p>
       <p class="cj_btn"><a id="buy" href="#" class="cj_qd_btn">确定领取</a></p>
		</div>
        </div>
  </div>
   <div id="over"></div>
</div>
<div class="clear"></div>
</div>
</body>
</html>
