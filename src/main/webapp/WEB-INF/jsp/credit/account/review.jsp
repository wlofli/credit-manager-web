<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理-个人中心-实名认证-正在审核</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../commons/common.jsp"  %>
<script type="text/javascript">
function convert(t){
	
	if(t == 'p'){
		$("#person_center_convert").attr("action" , "${ctx}/credit/user/show");
		$("#person_center_convert").submit();
	}else{
		$("#person_center_convert").attr("action" , "${ctx}/credit/user/cert");
		$("#person_center_convert").submit();
	}
	
}
$(function(){
	
	$("div.left li").each(function(){
		$(this).removeClass("hit");
	});
	$("a.zh").parent().addClass("hit");
	$("a.zh").parent().children().find("li").eq(0).addClass("hit");
	
});

</script>
</head>
<body>
	<s:form action="" method="post" id="person_center_convert">
		<input type="hidden" name="index" id="person_index" value="2">
	</s:form>
	<div class="main">
		<jsp:include page="../../commons/left.jsp"></jsp:include>

		<div class="right">
			<jsp:include page="../../commons/head.jsp"></jsp:include>
			<div class="grzl">
				<div class="grzx_bt">
					<span>个人中心</span>
				</div>
				<div class="grzx_nr">
					<div class="grzx_nr1">
						<ul>
							<li><a href="javascript:void(0)">个人资料</a></li>
							<li><a href="javascript:void(0)" class="hit">实名认证</a></li>
						</ul>
					</div>
					<div class="smrz2"></div>
					<div class="grzx_nr2">
						<p class="smrz_cg">
							<span class="smrz_span">您好，你的资料提交成功，正在等待审核。请稍候……</span>
						</p>
						
					</div>

				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
	
</body>
</html>