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
<title>信贷经理-消息中心</title>
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
					<s:form commandName="minfo" method="post" action="${ctx }/credit/messagectr/show" id="credit_mesage_form">
						<s:hidden path="topage" id="credit_message_topage"/>
						<s:hidden path="userid" id="credit_message_id"/>
						<s:hidden path="record" id="credit_message_record"/>
						<s:hidden path="recordindex" id="credit_message_recordindex"/>
						<s:hidden path="index" id="credit_message_index"/>
						<div class="news_cx">
							<span>开始时间：</span>
								<s:input path="startTime" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="true"/>
							<span>结束时间：</span>
								<s:input path="endTime" class="date" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" readonly="true"/>
								<input type="button" class="search_btn" value="查询" onclick="show(2)"/>
						</div>
						<div class="news_nr">
							<div class="news_btn">
								<a href="javascript:void(0)" class="del" onclick="del()">删除</a> <a href="javascript:void(0)" class="bwyd" onclick="read()">标为已读</a>
							</div>
							<div class="news_btn1">
							
								<a href="javascript:void(0)" onclick="option('all')">全选</a> <a href="javascript:void(0)" onclick="option('none')">取消选择</a> 
								<a href="javascript:void(0)" onclick="show(0)">未读</a> <a href="javascript:void(0)" onclick="show(1)">已读</a> 
								<s:hidden path="hasRead" id="credit_message_read"/>
							</div>
							<div class="news_list">
								<ul>
									<c:forEach items="${mpage.data}" var="mesage" varStatus="vs">
										<c:set var="result" value="${result}${vs.first ? '':','}${mesage.id}" scope="page"/>
										<c:set var="paramindex" value="${vs.index}" scope="page"/>
										<c:if test="${mesage.hasRead == 0 }" var="flag">
											<li class="wd">
										</c:if>
										<c:if test="${not flag }">
											<li class="yd">
										</c:if>
										<input type="checkbox" class="check1" name="ck_credit_message" value="${mesage.id }"/><i></i><a
										href="javascript:void(0)" onclick="detail(${mesage.id } , ${vs.index })">${mesage.title }</a><span class="news_des">-${fn:replace(mesage.content , fn:substring(mesage.content ,30 , -1  ) , "...") }</span><span
										class="time">${mesage.sendTime }</span></li>
									</c:forEach>
									
								</ul>
							</div>
						</div>
					</s:form>
					<p:page url="${ctx }/credit/messagectr/show" pageData="${mpage}"></p:page>
					<input type="hidden" value="${mpage.totalPage }" id="new_totalPage">
				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
	
	<script type="text/javascript">
		function option(node){
			if(node == 'all'){
				$("div.news_list input[name='ck_credit_message']").each(function(){
					
					//$(this).attr("checked", true);
					this.checked = true;
				});	
			}else{
				$("div.news_list input[name='ck_credit_message']").each(function(){
					
					//$(this).attr("checked", true);
					this.checked = false;
				});	
			}
		}
		
		function show(node){
			$("#credit_mesage_form").attr("action" , "${ctx }/credit/messagectr/show");
			switch (node) {
			case 0:
				$("#credit_message_read").val(0);
				$("#credit_mesage_form").submit();
				break;
			case 1:
				$("#credit_message_read").val(1);
				$("#credit_mesage_form").submit();
				break;
			case 2:
				$("#credit_mesage_form").submit();
				break;
			}
		}
		
		function del(){
			var id_all = [];//存储id
			$("div.news_list input[name='ck_credit_message']").each(function(){
				if(this.checked){
					id_all.push(this.value);
				}
			});	
			if(id_all.length == 0){
				alert("请选择数据");
				return;
			}
			$.ajax({
				url:'${ctx}/credit/messagectr/del',
				type:'post',
				contentType:'application/json',
				dataType:'json',
				data:JSON.stringify(id_all),
				success:function(data){
					if(data == 'success'){
						$("#credit_message_topage").val(1);
						show(2);
						alert("删除成功");
					}else{
						alert("删除失败");
					}
				}
			});
		}
		
		function read(){
			var id_all = [];//存储id
			$("div.news_list input[name='ck_credit_message']").each(function(){
				if(this.checked){
					id_all.push(this.value);
				}
			});	
			if(id_all.length == 0){
				alert("请选择数据");
				return;
			}
			$.ajax({
				url:'${ctx}/credit/messagectr/updateRead',
				type:'post',
				contentType:'application/json',
				dataType:'json',
				data:JSON.stringify(id_all),
				success:function(data){
					if(data == 'success'){
						
						show(2);
						alert("标记为已读成功");
					}else{
						alert("标记为已读失败");
					}
				}
			});
		}
		
		function detail(node , index){
			var p = '<%=pageContext.getAttribute("result")%>';
			var pi = '<%=pageContext.getAttribute("paramindex")%>';
			
			$("#credit_message_record").val(p);
			$("#credit_message_recordindex").val(pi);
			$("#credit_message_index").val(index);
			$("#credit_message_id").val(node);
			$("#credit_mesage_form").attr("action" , "${ctx }/credit/messagectr/detail");
			$("#credit_mesage_form").submit();
		}
		
		function changePage(url , topage){
			var totalpage = $("#new_totalPage").val();
			if(topage<0){
				alert("所写页码需大于0");
				return;
			}
			if(topage>totalpage){
				alert("所写页码大于总页码了, 当前总页码为"+totalpage);
				return;
			}
			$("#credit_message_topage").val(topage);
			show(2);
		}
	</script>
</body>
</html>