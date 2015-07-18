<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理-消息中心-消息详情</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../commons/common.jsp"  %>
<script type="text/javascript">

$(function(){
	
	$("div.left li").each(function(){
		$(this).removeClass("hit");
	});
	$("a.zh").parent().addClass("hit");
	$("a.zh").parent().children().find("li").eq(1).addClass("hit");
	
	
	
});

</script>
</head>
<body>
	<div class="main">
		
		<jsp:include page="../../commons/left.jsp"></jsp:include>
		<div class="right">
			<jsp:include page="../../commons/head.jsp"></jsp:include>
			<div class="grzl">
				<div class="grzx_bt">
					<span>我的消息</span>
				</div>
				<div class="grzx_nr">
					<div class="news_nr">
						<s:form commandName="minfo" action="${ctx }/credit/messagectr/detail" method="post" id="credit_new_detail">
							<s:hidden path="topage"/>
							<s:hidden path="userid" id="credit_new_userid"/>
							<s:hidden path="startTime" />
							<s:hidden path="endTime"/>
							<s:hidden path="hasRead"/>
							<s:hidden path="record" id="credit_new_record"/>
							<s:hidden path="recordindex"/>
							<s:hidden path="index" id="credit_new_index"/>
						</s:form>
						
							<div class="news_btn">
								<a href="javascript:void(0)" class="back" onclick="history.back()">返回</a> <a href="javascript:void(0)" class="del" onclick="del(${message.id})">删除</a> 
								<c:if test="${minfo.index==0 }" var="flag">
									<a href="javascript:void(0)" class="next" style="pointer-events:none;background:#aaa">上一条</a> 
								</c:if>
								<c:if test="${not flag }">
									<a href="javascript:void(0)" class="next" onclick="record(${minfo.index-1})">上一条</a>
								</c:if>
								
								<c:if test="${minfo.index < minfo.recordindex }" var="nextflag">
									<a href="javascript:void(0)" class="next" onclick="record(${minfo.index+1})">下一条</a> 
								</c:if>
								<c:if test="${not nextflag }">
									<a href="javascript:void(0)" class="next" style="pointer-events:none;">下一条</a>
								</c:if>
								
							</div>
							<div class="news_xq">
								<p class="news_xq_bt">${message.title }</p>
								<p class="news_xq_nr">
									${message.content }
								</p>
								<p class="news_xq_fjxx">
									发件人：新越网客服<br />时间：${message.sendTime }
								</p>
							</div>
							
						
					</div>
				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
	<script type="text/javascript">
		function del(node){
			var param = [];
			param.push(node);
			$.ajax({
				url:'${ctx}/credit/messagectr/del',
				dataType:'json',
				contentType:'application/json',
				type:'post',
				data:JSON.stringify(param),
				success:function(data){
					if(data == 'success'){
						alert("删除成功");
						document.location.href = '${ctx}/credit/messagectr/show';
					}else{
						alert("删除失败");
					}
				}
			});
		}
		
		function record(node){
			$("#credit_new_index").val(node);
			var record = $("#credit_new_record").val();
			var r = record.substring(2*node,2*node+1);
			$("#credit_new_userid").val(r);
			$("#credit_new_detail").submit();
		}
	</script>
</body>
</html>