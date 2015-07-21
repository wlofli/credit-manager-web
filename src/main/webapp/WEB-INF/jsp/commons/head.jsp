<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
$(function(){
	$("a.gly").click(function(){
	   $("div.zkcd").slideToggle("slow");
	});
})
</script>
<div class="r1">
	<div class="r1_l">
		<a href="#" class="xl" title="新浪分享"></a>
		<a href="#" class="wx" title="微信分享"></a>
		<a href="#" class="qq" title="qq分享"></a>
		<div class="clear"></div>
	</div>
	<div class="r1_r">
		<a href="#" class="cp" title="新产品"><span>3</span></a>
		<a href="#" class="xx" title="新消息"><span>12</span></a>
		<a href="#" class="gly" title="">${sessionScope.user_info.realName}</a>
		<div class="zkcd"><a href="${ctx}/credit/change/psw">修改密码</a><a href="${ctx}/login/credit/page">退出</a></div>
		<div class="clear"></div>
	</div>
</div>