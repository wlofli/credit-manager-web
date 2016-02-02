<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理_修改密码</title>
<%@ include file="../commons/common.jsp"  %>
<script type="text/javascript">
$(function(){
	$(".left ul li #a").click(function(){ 
		$(this).parent().find('.fnav').removeClass("menu_chioce");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('.fnav').slideToggle();
		$(this).parent().find('.fnav').addClass("menu_chioce");
	});
	
	$("#pswForm").validate({
		rules: {
			password:{
				required:true,
				remote:{
					type:"post",
					url:"${ctx}/credit/check/psw",
					data:{
						password:function(){return $("#password").val();}
					} 
				}
			},
			passwordConfirm:"required",
			passwordCheck: {
				equalTo:"#passwordConfirm"
			}
		},
		messages: {
			password:{
				remote:"<span class='zc_zs'>* 原密码错误</span>"
			}
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parent());
		},
	});
});
</script>
</head>
<body>
<div class="main">
	<jsp:include page="../commons/left.jsp"></jsp:include>
	<div class="right">
		<jsp:include page="../commons/head.jsp"></jsp:include>
		<div class="grzl">
			<div class="grzx_bt">
				<span>修改密码</span>
			</div>
			<div class="grzx_nr">
				<div class="grzx_nr2">
					<s:form action="${ctx}/credit/psw/submit" commandName="pswInfo" method="post" id="pswForm">
					<p>
						<span>原密码 :</span><s:password path="password" class="grzl_t1"/>
					</p>
					<p>
						<span>新密码 :</span><s:password path="passwordConfirm" class="grzl_t1"/>
					</p>
					<p>
						<span>确认密码 :</span><input type="password" class="grzl_t1" name="passwordCheck" />
					</p>
					<p>
						<input type="button" class="save_btn" value="修改" onclick="change()" />
					</p>
					</s:form>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
</body>
<script type="text/javascript">
function change(){
	
	if ($("#pswForm").valid()) {
		$.ajax({
		    data:$("#pswForm").serialize(),
			url:"${ctx}/credit/psw/submit",
			type:"post",
			success:function(data){
				if (data=="true") {
					document.location.href = "${ctx}/login/credit/page";
				} else {
					alert("修改失败！");
				}
			}
		});
	}
}
</script>
</html>