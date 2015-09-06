<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理-个人中心-实名认证-认证完成</title>
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
					<div class="grzx_nr2 smrz_p_c">
						<p>
							<span><i></i>真实姓名 :</span><span class="rzcg_s">${cert.realName }</span>
						</p>
						<p>
							<span><i></i>性别 :</span><span class="rzcg_s">${cert.sexName }</span>
						</p>
						<p>
							<span><i></i>身份证号 :</span><span class="rzcg_s">${cert.idcard }</span>
						</p>
						<p>
							<span><i></i>手机号码 :</span><span class="rzcg_s">${cert.telPhone }</span>
						</p>
						<p>
							<span><i></i>所属机构 :</span><span class="rzcg_s">${cert.organization }</span>
						</p>
						<p>
							<span><i></i>部门职位 :</span><span class="rzcg_s">${cert.position }</span>
						</p>
						<p>
							<span><i></i>所属地区 :</span><span class="rzcg_s">${cert.citys }</span>
						</p>
						<p>
							<span><i></i>机构地址 :</span><span class="rzcg_s">${cert.organizationAdressString }</span>
						</p>
						<ul class="zjzl">
							<li><img src="${showpath }credit/person/card/${cert.cardImgPath}" /><span>有效身份证</span></li>
							<li><img src="${showpath }credit/person/work/${cert.workImgPath}" /><span>工作证</span></li>
							<li><img src="${showpath }credit/person/head/${cert.headImgPath}" /><span>近半身职业照</span></li>
						</ul>

					</div>

				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
</body>
</html>