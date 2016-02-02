<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理首页-个人中心</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="icon" href="${ctx}/images/moke.ico" />
<link href="${ctx}/css/base.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="${ctx}/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/js/messages_zh.min.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker.4.8/WdatePicker.js"></script>

<script type="text/javascript">
function show(id){
	document.getElementById(id).style.display="block";
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


function convert(){
	$("#person_center_convert").attr("action" , "${ctx}/credit/user/cert");
	$("#person_center_convert").submit();
	
}
</script>
</head>
<body>
	<s:form action="" method="post" id="person_center_convert">
		<input type="hidden" name="index" value="0">
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
							<li><a href="javascript:void(0)"  class="hit">个人资料</a></li>
							<li><a href="javascript:void(0)" onclick="convert()" >实名认证</a></li>
						</ul>
					</div>
					<div class="grzx_nr2">
						<s:form action="" method="post" commandName="user" id="persons_center_form">
						<p>
							<s:hidden path="id"/>
							
							<span><i></i>真实姓名 :</span>
							<c:if test="${audit == 4 }" var="flag"><s:input path="realName" class="grzl_t1" readonly="true"/></c:if>
							<c:if test="${not flag}">
								<s:input path="realName" class="grzl_t1 required" placeholder="请输入真实姓名"/>
							</c:if>
						</p>
						<p>
							<span><i></i>性别 :</span>
								<c:if test="${flag}">
									<s:radiobutton path="sex" value="1" readonly="true" class="grzl_xb"/>女
									<s:radiobutton path="sex" value="2" readonly="true" class="grzl_xb"/>男
									<s:radiobutton path="sex" value="3" readonly="true" class="grzl_xb"/>保密
								</c:if>
								<c:if test="${not flag}">
									<s:radiobutton path="sex" value="1" class="grzl_xb"/>女
									<s:radiobutton path="sex" value="2" class="grzl_xb"/>男
									<s:radiobutton path="sex" value="3" class="grzl_xb"/>保密
								</c:if>
						</p>
						<p>
							<span><i></i>手机号码 :</span><s:input path="telPhone" class="grzl_t1" readonly="true"/><a
								class="zs_span" onclick='show("xgsj")'>修改手机号码</a>
						</p>
						<div id="xgsj">
							<p>
								<span>新手机号码 :</span><input type="text" class="grzl_t1" value="请输入新手机号码" 
								onfocus="if(this.value==defaultValue) {this.value='';this.type='text'}" onblur="if(!value) {value=defaultValue; this.type='text';}" /> ‍
							</p>
							<p>
								<span>手机验证码 :</span><input type="text" class="sjyzm_t1" value="请输入验证码" required="true"  
								onfocus="if(this.value==defaultValue) {this.value='';this.type='text'}" onblur="if(!value) {value=defaultValue; this.type='text';}" style="color:#888;" />
								<input type="button" value="获取验证码" class="grzl_t2_btn"/>
							</p>
						</div>
						<p>
							<span><i></i>电子邮箱 :</span><s:input path="email" type="email" required="true" class="grzl_t1"/>
						</p>
						<p>
							<span><i></i>出生日期 :</span><s:input path="birthday" class="grzl_t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" type="datetime" required="true"/>
						</p>
						<p>
							<span><i></i>所属机构 :</span>
							<s:select path="organization"  class="grzl_t1 required">
								<s:option value="">--请选择--</s:option>
								<s:options items="${organizations}" itemValue="key" itemLabel="value"/>
							</s:select>
						</p>
						<p>
							<span><i></i>所在地区 :</span>
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
							<span><i></i>擅长业务 :</span>
							<s:textarea path="adept" class="grzl_t2" required="true" placeholder="擅长业务是客户了解您的最初方式，请组织<br />简洁的语言说明您的业务特长、业务范围等"/>
							
						</p>
						<p>
							<input type="button" class="save_btn" value="保 存" onclick="save()"/>
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
			$("#persons_center_form").validate({
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
			
			if(!$("#persons_center_form").valid()){
				return;
			}
			
			$.ajax({
				url:'${ctx}/credit/user/saveUser',
				type:'post',
				data:$("#persons_center_form").serialize(),
				success:function(data){
					if(data == 'success'){
						alert("保存成功");
					}else{
						alert("保存失败");
					}
				}
			});
		}
	</script>
</body>
</html>