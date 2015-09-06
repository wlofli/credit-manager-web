<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理-客户问答-新越网平台问题-我的回答</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../commons/common.jsp"  %>
<script type="text/javascript">
$(function(){
	
	$("div.left li").each(function(){
		$(this).removeClass("hit");
	});
	$("a.wd").parent().addClass("hit");
	$("a.wd").parent().children().find("li").eq(2).addClass("hit");
	
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
					<span>我的回答</span>
				</div>
				<div class="grzx_nr">
					<div class="news_nr">
						<div class="wdhd">
							<ul>
								<c:forEach items="${myanswer.data}" var="quest">
									<li>
										<div class="wt">
											<span class="bt_wenti">问题：</span>
											<a href="javascript:void(0)" class="wenti_name" onclick="mtarget(event , '${quest.id}')">${quest.title }</a>
											<span class="wt_fbsj">${quest.createtime }</span>
										</div>
										<div class="hd">
											<span class="bt_hd">回答：</span><span class="hd_nr">${quest.answerContent }</span><span
												class="hd_fbsj">${quest.answerCreatetime }</span>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<p:page url="${ctx }/credit/answerctr/myanswer" pageData="${myanswer}"></p:page>

				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
	<script type="text/javascript">
	function mtarget(event , questid){
		event.stopPropagation();
		document.location.href="${ctx }/credit/answerctr/showAnswer?questid="+questid+"&index=3";
	}
	</script>
</body>
</html>