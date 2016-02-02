<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理_成功案例_${type}成功案例</title>
<%@ include file="../../commons/common.jsp"%>
</head>
<body>
	<div class="main">
		<jsp:include page="../../commons/left.jsp"></jsp:include>
		<div class="right">
			<jsp:include page="../../commons/head.jsp"></jsp:include>
			<div class="grzl">
				<div class="grzx_bt">
					<span>${type}成功案例</span>
				</div>
				<div class="grzx_nr">
					<div class="grzx_nr2">
						<sf:form action="${ctx}/credit/case/save" commandName="caseInfo" method="post" id="caseForm">
						<p>
							<span><i></i>产品名称 :</span>
							<sf:select path="productId" cssClass="grzl_t1 required">
								<sf:option value="">请选择</sf:option>
								<sf:options items="${products}" itemValue="key" itemLabel="value"/>
							</sf:select>
						</p>
						<p>
							<span><i></i>申请单位/人 :</span>
							<sf:input path="applicantCompany" cssClass="grzl_t1 required"/>
						</p>
						<p>
							<span><i></i>放款金额 (万元):</span>
							<sf:input path="loanAmount" cssClass="grzl_t1 required number"/>
						</p>
						<p>
							<span><i></i>放款日期 :</span>
							<sf:input path="loanDate" cssClass="grzl_t1 required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
						</p>
						<p>
							<span><i></i>贷款期限(月) :</span>
							<sf:input path="loanPeriod" cssClass="grzl_t1 required"/>
						</p>
						<p>
							<span><i></i>放款天数 (天):</span>
							<sf:input path="loanDays" cssClass="grzl_t1 required"/>
						</p>
						<p>
							<span><i></i>贷款类型 :</span>
							<sf:select path="loanType" cssClass="grzl_t1 required">
								<sf:option value="">请选择</sf:option>
								<sf:options items="${loanTypes}" itemValue="key" itemLabel="value"/>
							</sf:select>
						</p>
						<p>
							<span><i></i>所属地区 :</span>
							<sf:select path="loanProvince" cssClass="grzl_s1" id="editP" onchange="getCities('')">
								<sf:option value="">请选择</sf:option>
								<sf:options items="${provinces}" itemValue="key" itemLabel="value"/>
							</sf:select>
							<sf:select path="loanCity" cssClass="grzl_s1 required" id="editC">
								<sf:option value="">请选择</sf:option>
							</sf:select>
						</p>
						<p>
							<span><i></i>月息 (%):</span>
							<sf:input path="monthInterest" cssClass="grzl_t1 required"/>
						</p>
						<p>
							<span><i></i>排序 :</span>
							<sf:input path="orderNumber" cssClass="grzl_t1 required"/>
							<span class="fkje_zs">默认值为1，数字越小越往前</span>
						</p>
						<p>
							<span><i></i>详情描述 :</span>
							<sf:textarea path="description" cssClass="grzl_t2 required"/>
						</p>
						<p>
							<sf:hidden path="id"/>
							<input type="button" class="save_btn" value="保 存"  onclick="saveCase()"/>
						</p>
						</sf:form>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	var province = $("#editP").val();
	var city = $("#editC").val();
	
	if (province != "") {
		getCities(city);
	}
	$("#caseForm").validate();
});
function getCities(val){
	var provinceVal = $("#editP option:selected").val();
	
	$("#editC").empty();
	var option= $("<option/>");
	option.attr("value","");
	option.html("请选择");
	$("#editC").append(option);
	
	if (provinceVal != 0) {
		$.ajax({
			url:"${ctx}/get/cities?type=tc&id="+provinceVal,
			success:function(data){
				var jsonData = eval(data);
				for(var i=0;i<jsonData.length;i++){
					var city=jsonData[i];
					option= $("<option/>");
					option.attr("value",city.key);
					option.html(city.value);
					$("#editC").append(option);
				};
				if(val != ""){
					$("#editC").val(val);
				}
			}
		});
	}
}
function saveCase(){
	if ($("#caseForm").valid()) {
		$.ajax({
			   url:"${ctx}/credit/case/save",
			   type:"post",
			   data:$("#caseForm").serialize(),
			   async:true,
			   success:function(data){
			    if(data == "success"){
				   alert("${type}成功");
				   window.location.href = "${ctx}/credit/case/list";
			   }else{
				   alert("${type}失败");
			   }
			   }
			});
	}
}
</script>
</html>