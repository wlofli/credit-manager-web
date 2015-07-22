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
$(function(){
	
	$("div.left li").each(function(){
		$(this).removeClass("hit");
	});
	$("a.zh").parent().addClass("hit");
	$("a.zh").parent().children().find("li").eq(0).addClass("hit");
	
});
$(function(){
	var val = $("#person_citys").val();
	if($("#person_province").val() != ""){
		changeSelect(val);
	}
});
</script>
</head>
<body>
	<s:form action="" method="post" id="person_center_convert">
		<input type="hidden" name="index" id="person_index" value="1">
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
					<div class="smrz"></div>
					<div class="grzx_nr2 smrz_p_c">
						<s:form commandName="user" method="post" id="person_cert">
						<s:hidden path="id"/>
						<s:hidden path="audit"/>
						<p>
							<span><i></i>真实姓名 :</span>
							<c:if test="${audit == 4 }" var="flag">
								<s:input path="realName" class="grzl_t1" readonly="true"/>
							</c:if>
							<c:if test="${not flag }">
								<s:input path="realName" class="grzl_t1" required="true"/>
							</c:if>
						</p>
						<p>
							<span><i></i>性别 :</span>
								<c:if test="${flag}">
									<s:radiobutton path="sex" value="1" readonly="true" class="grzl_xb"/>男
									<s:radiobutton path="sex" value="2" readonly="true" class="grzl_xb"/>女
									<s:radiobutton path="sex" value="3" readonly="true" class="grzl_xb" checked="checked"/>保密
								</c:if>
								<c:if test="${not flag }">
									<s:radiobutton path="sex" value="1" class="grzl_xb"/>男
									<s:radiobutton path="sex" value="2" class="grzl_xb"/>女
									<s:radiobutton path="sex" value="3" class="grzl_xb" checked="checked"/>保密
								</c:if>
						</p>
						<p>
							<span><i></i>身份证号 :</span><s:input path="idcard" class="grzl_t1" required="true"/>
						</p>
						<p>
							<span><i></i>手机号码 :</span><s:input path="telPhone" class="grzl_t1" type="mobile" required="true"/>
						</p>
						<p>
							<span><i></i>手机验证 :</span>
							<input type="button" class="smrz_btn1"
								value="获取手机验证码" /><input type="text" class="smrz_t1" />
						</p>
						<p>
							<span><i></i>所属机构 :</span>
							<s:input path="organization" class="grzl_t1" required="true"/>
						</p>
						<p>
							<span><i></i>部门职位 :</span>
							<s:input path="position" class="grzl_t1" required="true"/>
						</p>
						<p>
							<span><i></i>所属地区 :</span>
								<s:select path="province" class="grzl_s1" id="person_province" onchange="changeSelect()">
									<s:option value="">请选择</s:option>
									<s:options items="${province }" itemLabel="value" itemValue="key" />
								</s:select>
								<s:select path="city" class="grzl_s1" id="person_city" required="true">
									<s:option value="">请选择</s:option>
								</s:select>
								<s:hidden path="citys" id="person_citys"/>
						</p>
						<p>
							<span><i></i>机构地址 :</span><s:input path="organizationAdressString" class="grzl_t1" required="true"/>
						</p>
						<p>
							<input type="button" class="save_btn" value="保 存" onclick="save()" />
							<c:if test="${not empty user.realName}">
								<input
								type="button" class="next_btn1" value="下一步"
								onclick="convert('n')"/>
							</c:if>
							<c:if test="${empty user.realName}">
								<input
								type="button" class="next_btn1" value="下一步" id="cert_next"
								onclick="convert('n')" disabled="disabled" />
							</c:if>
						</p>
						</s:form>
					</div>

				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
	<script type="text/javascript">
	
		$(function(){
			$("#person_cert").validate({
				errorPlacement: function(error, element) {
					error.appendTo(element.parent());
				},
			});
		});
		
		function changeSelect(val){
			var selected = $("#person_province option:selected").val();
			
			$("#person_city").empty();
			var option= $("<option/>");
			option.attr("value","");
			option.html("请选择");
			$("#person_city").append(option);
			if(selected != ""){
				$.ajax({
					type:"post",
					dataType:"json",      
		            contentType:"application/json", 
					data:JSON.stringify(selected),
					url:'${ctx}/credit/user/city',
					success:function(data){
						var jsonData = eval(data);
						for(var i=0;i<jsonData.length;i++){
							var city=jsonData[i];
							option= $("<option/>");
							option.attr("value",city.key);
							option.html(city.value);
							$("#person_city").append(option);
						};
						if(val != ""){
							$("#person_city").val(val);
						}
					}
				});
			}
		}
		
		function save(){
			if($("#person_cert").valid()){
				$.ajax({
					url:'${ctx}/credit/user/saveCert',
					type:'post',
					data:$("#person_cert").serialize(),
					success:function(data){
						if(data == "success"){
							$("#cert_next").removeAttr("disabled");
							alert("保存成功");
							
						}
					}
				});
			}
		}
		
	</script>
</body>
</html>