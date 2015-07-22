<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</script>
</head>
<body>
	<s:form action="" method="post" id="person_center_convert">
		<input type="hidden" name="index" id="person_index" value="0">
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
							<li><a href="javascript:void(0)" onclick="convert('p')">个人资料</a></li>
							<li><a href="javascript:void(0)" class="hit">实名认证</a></li>
						</ul>
					</div>
					<div class="smrz3"></div>
					<div class="grzx_nr2">
						<p class="smrz_cg">
							<i></i><span class="smrz_span">您的实名认证失败，请修改认证资料……</span>
						</p>
						<p class="next_p">
							<input type="button" value="修改认证资料" class="back_btn"
								onclick="audit(${user.id})" />
						</p>
					</div>

				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
	<script type="text/javascript">
		function audit(node){
			alert(node);
			$.ajax({
				url:'${ctx}/credit/user/initialAudit',
				type:'post',
				contentType:'application/json',
				dataType:'json',
				data:JSON.stringify(node),
				success:function(data){
					if(data == 'success'){
						convert('n');
					}else{
						alert("提交审核失败 ");
					}
				}
			});
			
		}
	</script>
</body>
</html>