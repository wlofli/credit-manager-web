<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理-客户问答-客户问答详情页</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../commons/common.jsp"%>
<script type="text/javascript">

$(function(){
	
	$("div.left li").each(function(){
		$(this).removeClass("hit");
	});
	$("a.wd").parent().addClass("hit");
	$("a.wd").parent().children().find("li").eq(0).addClass("hit");
	
});




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
</head>
<body>
	<div class="main">
		<jsp:include page="../../commons/left.jsp"></jsp:include>

		<div class="right">
			<jsp:include page="../../commons/head.jsp"></jsp:include>
			<div class="grzl">
				<div class="grzx_bt">
					<span>客户问答</span>
				</div>
				<div class="grzx_nr">
					<div class="khwd_xq_nr">
						<div class="khwd_xq_wt">
							<p class="wdxq_bt">
								<i></i><span>${question.title }</span>
							</p>
							<p class="twz_zl">
								<span>提问者：<strong><c:if test="${question.qtype eq 'm' }" var="flag">普通会员</c:if><c:if test="${not flag }">信贷经理</c:if> </strong></span>
								<span>所属地区：<strong>${question.address }</strong>
								</span><span>发布时间：<strong>${question.qtime }</strong></span>
							</p>
							<p class="wtbc">${question.content } </p>
							<s:form commandName="answer" method="post" id="detail_question">
								<s:textarea path="acontent" class="wthdk"/>
								<s:hidden path="questid" value="${question.id }"/>
								<p class="tjda">
									<input type="button" value="提交答案" class="tjda_btn" onclick="saveAnswer('${question.id}')"/>
									<s:hidden path="createid" id="answer_createid_${question.id}"/>
									<span class="tjda_span">匿名</span>
									<input type="checkbox" onclick="javascript:$('#answer_createid_${question.id }').val(this.checked?'0':'${answer.createid }')" class="tjda_fxk"/>
									<div class="clear"></div>
								</p>
							</s:form>
						</div>

						<div class="khwd_xq_nr">
							<div class="khwd_xq_nr_bt">
								<span>共${pageanswer.total }条答案</span>
							</div>
							<div class="khwd_xq_nr_cont">
								<ul>
									<c:forEach items="${pageanswer.data }" var="panswer">
									<li>
										<p class="wt1">
											<c:choose>
												<c:when test="${panswer.atype eq 'c' }">
													<a class="hdz" href="#">${panswer.ccreateName }</a><span class="hdzsf">信贷经理</span>
												</c:when>
												<c:when test="${panswer.atype eq 'm' }">
													<a class="hdz" href="#">${panswer.mcreateName }</a><span class="hdzsf">普通会员</span>
												</c:when>
												<c:otherwise>
													<a class="hdz" href="#"></a><span class="hdzsf">匿名</span>
												</c:otherwise>
											</c:choose>
<%-- 											<c:if test="${panswer.atype eq 'c' }" var="flags"> --%>
<%-- 												<a class="hdz" href="#">${panswer.ccreateName }</a><span class="hdzsf">信贷经理</span> --%>
<%-- 											</c:if> --%>
<%-- 											<c:if test="${not flags }"> --%>
<%-- 												<a class="hdz" href="#">${panswer.mcreateName }</a><span class="hdzsf">普通会员</span> --%>
<%-- 											</c:if> --%>
											
											
											|<span
												class="fwly">服务地区：${panswer.address }</span>|<span class="fwly">服务机构：${panswer.oname }</span><span
												class="hdsj">${panswer.atime }</span>
										</p>
										<p class="nr1">${panswer.acontent }</p>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>

					</div>
					<p:page url="${ctx }/credit/answerctr/showAnswer?index=1&questid=${question.id }" pageData="${pageanswer}"></p:page>
					<input type="hidden" value="${pageanswer.totalPage }" id="help_totalPage">
				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
	<script type="text/javascript">
	function saveAnswer(node){
		$.ajax({
			url:'${ctx}/credit/answerctr/addAnswer',
			type:'post',
			data:$("#detail_question").serialize(),
			success:function(data){
				if(data == 'success'){
					alert("保存成功");
					document.location.href='${ctx}/credit/answerctr/showAnswer?index=1&questid='+node;
					
					
				}else{
					alert("保存失败");
				}
			}
		});
	}
	</script>
</body>
</html>