<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="left">
	<ul>
		<li class="logo bj0"><img src="${ctx }/images/logo.png" onclick="window.open('')" /></li>
		<li class="bj0"><span>信贷经理中心</span></li>
		<li class="hit"><a class="zy" id="a">我的主页</a>
			<ul class="fnav">
				<li class="hit"><a href="#">我的主页</a></li>
			</ul></li>
		<li><a class="zh" id="a">账户管理</a>
			<ul class="fnav">
				<li><a href="javascript:void(0)" onclick="document.location.href='${ctx}/credit/user/show'">个人中心</a></li>
				<li><a href="#">我的消息</a></li>
				<li><a href="#">分享推荐会员</a></li>
				<li><a href="#">资金管理</a></li>
				<li><a href="#">积分管理</a></li>
			</ul></li>
		<li><a class="cp" id="a">产品推广</a>
			<ul class="fnav">
				<li><a href="#">产品推广</a></li>
			</ul></li>
		<li><a class="xx" id="a">信息查询</a>
			<ul class="fnav">
				<li><a href="#">企业信息下载明细</a></li>
				<li><a href="#">人员信息下载明细</a></li>
				<li><a href="#">企业投资信息下载明细</a></li>
			</ul></li>
		<li><a class="kh" id="a">客户管理</a>
			<ul class="fnav">
				<li><a href="#">推送客户</a></li>
				<li><a href="#">领取客户</a></li>
				<li><a href="#">客户评价</a></li>
			</ul></li>
		<li><a class="hq" id="a">获取客户</a>
			<ul class="fnav">
				<li><a href="#">立即领取</a></li>
				<li><a href="#">竞拍客户</a></li>
				<li><a href="#">唯一低价</a></li>
				<li><a href="#">我的出价</a></li>
				<li><a href="#">我的客户</a></li>
			</ul></li>
		<li><a class="wd" id="a">客户问答</a>
			<ul class="fnav">
				<li><a href="#">平台问答</a></li>
				<li><a href="#">机构问答</a></li>
				<li><a href="#">我的问答</a></li>
			</ul></li>
		<li><a class="al" id="a">成功案例</a>
			<ul class="fnav">
				<li><a href="#">成功案例</a></li>
			</ul></li>
		<li><a class="bz" id="a">帮助中心</a>
			<ul class="fnav">
				<li><a href="javascript:void(0)" onclick="document.location.href='${ctx}/credit/help/find'">帮助中心</a></li>
			</ul></li>
	</ul>
</div>
<s:form action="" method="post" id="left_form"></s:form>
<script type="text/javascript">

function commit(t){
	if(t == "person_center"){
		$("#left_form").attr("action" , "${ctx}/credit/user/show");
		$("#left_form").submit();
	}
}
$(function(){
	$("div.left ul li #a").click(function(){
		$(this).parent().find('.fnav').removeClass("menu_chioce");
		$(".menu_chioce").slideUp();
		$(this).parent().find('.fnav').slideToggle();
		$(this).parent().find('.fnav').addClass("menu_chioce");
				
	});

	$("div.left a").click(function(){
		if($(this).attr("class")==undefined){
			$("div.left li").each(function(){
				$(this).removeClass("hit");
			});
			
			$(this).parent().addClass("hit");
			$(this).parent().parent().parent().addClass("hit");
		}else{
			$("div.left li").each(function(){
				$(this).removeClass("hit");
			});
			
			$(this).parent().addClass("hit");
		}
		
	});	
 });
</script> 