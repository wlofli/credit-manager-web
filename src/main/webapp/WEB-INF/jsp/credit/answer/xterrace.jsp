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
<title>信贷经理-客户问答-新越网平台问题</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../commons/common.jsp"  %>
<script type="text/javascript">

$(function(){
	
	$("div.left li").each(function(){
		$(this).removeClass("hit");
	});
	$("a.wd").parent().addClass("hit");
	$("a.wd").parent().children().find("li").eq(0).addClass("hit");
	
});
$(function(){
	$(".khwd_list ul .khwd_li").click(function(){ 
		$(this).find('#tck').removeClass("menu_chioce");
		$(".menu_chioce").slideUp(); 
		$(this).find('#tck').slideToggle();
		$(this).find('#tck').addClass("menu_chioce");
	});
});

$(function(){
	$(".khwd_list ul .khwd_li #tck .hdwt_nr1 .yc_wt_tck").click(function(){ 
		$(this).parent().removeClass("menu_chioce");
		$(".menu_chioce").slideUp(); 
		$(this).parent().slideToggle();
		$(this).parent().addClass("menu_chioce");
	});
});

function tab_item(n)
{
		var menu = document.getElementById("menu");
		var menuli = menu.getElementsByTagName("li");
		for(var i = 0; i< menuli.length; i++)
		{
			menuli[i].className="";
			menuli[n].className="hit";
			document.getElementById("tab"+ i).style.display = "none";
			document.getElementById("tab"+ n).style.display = "block";
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
					<span>客户问答</span>
				</div>
				<div class="grzx_nr">
					<div class="khwd_nr1">
						<div class="khwd_nr1_top">
							<span class="wdbt">我的回答：</span>
							<ul>
								<li><span>待审核<br />
									<strong>${myanswer.verify }</strong></span></li>
								<li><span>审核通过<br />
									<strong>${myanswer.pass }</strong></span></li>
								<li><span>未通过<br />
									<strong>${myanswer.fail }</strong></span></li>
								<li><span>通过率<br />
									<strong>${myanswer.rate }%</strong></span></li>
								<li class="wd_n_bj"><span>获得积分<br />
									<strong>132</strong></span></li>
								<div class="clear"></div>
							</ul>
						</div>
						<div class="khwd_nr1_top">
							<span class="wdbt">最近回答：</span>
							<ul>
								<li><span>昨日回答<br />
									<strong>${recentanswer.yesterday }</strong></span></li>
								<li><span>今日排名<br />
									<strong>${recentanswer.rank }</strong></span></li>
								<li class="wd_n_bj"><span>今日回答<br />
									<strong>${recentanswer.today }</strong></span></li>
								<div class="clear"></div>
							</ul>
						</div>
					</div>
					<div class="grzx_nr1">
						<ul>
							<li><a href="javascript:void(0)" class="hit" onclick="document.location.href='${ctx }/credit/answerctr/xterrace?index=1'">新越网平台问题</a></li>
							<li><a href="javascript:void(0)" onclick="document.location.href='${ctx}/credit/answerctr/jterrace'">所在机构问题</a></li>
						</ul>
					</div>

					<div class="news_nr">
						<div class="news_btn1">
							<ul class="wd_tab" id="menu">
								<li class="hit"><a href="javascript:void(0)" onclick="document.location.href='${ctx}/credit/answerctr/xterrace?index=1'"><span>少回答问题</span></a></li>
								<li><a href="javascript:void(0)" onclick="document.location.href='${ctx}/credit/answerctr/xposs?index=1'"><span>热门问题</span></a></li>
								<li><a href="javascript:void(0)" onclick="document.location.href='${ctx}/credit/answerctr/myanswer'"><span>我的回答</span></a></li>
							</ul>
						</div>
						<div class="khwd_list" id="tab0">
							<ul>
								<c:forEach items="${absence.data }" var="quest">
									<li class="khwd_li" onmouseover="style.background='#eee'"
										onmouseout="style.background='none'"><i class="jljftb"></i>
										<span class="jljfsz">+5分</span> <a class="wd_bt" href="javascript:void(0)" onclick="gtarget(event , '${quest.id}')" id="wdbt">${quest.title }</a>
										<span class="twsj">${quest.createtime }</span> <span class="hdgs">0个回答</span>
										<div class="clear"></div>
										<div class="hdwt_tck" id="tck">
											<div class="hdwt_nr1">
												<span class="wt_ms">提问者：<strong><c:if test="${quest.questType eq 'm' }" var="flag">普通会员</c:if><c:if test="${not flag }">信贷经理</c:if></strong></span><a
													class="yc_wt_tck">收起</a>
											</div>
											<div class="hdwt_nr2">
												<s:form commandName="answer" method="post" id="answer_form${quest.id }">
													<s:hidden path="questid" value="${quest.id }"/>
													<p>
														<s:textarea path="acontent" class="hdwt_textarea1"/>
													</p>
													<p class="nm_p">
														<s:hidden path="createid" id="answer_createid_${quest.id} }"/>
														<input type="checkbox" onclick="javascript:$('#answer_createid_${quest.id }').val(this.checked?'0':'${answer.createid }')" class="nmhdwt_c1"/><span>匿名回答</span>
													</p>
													<p class="nm_p">
														<input type="button" class="hdwt_btn" value="回答" onclick="saveAnswer('${quest.id}')"/>
													</p>
												</s:form>
											</div>
										</div></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<p:page url="${ctx }/credit/answerctr/xterrace" pageData="${absence}"></p:page>
					<input type="hidden" value="${absence.totalPage }" id="absence_totalPage">
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
				data:$("#answer_form"+node).serialize(),
				success:function(data){
					if(data == 'success'){
						document.location.href='${ctx}/credit/answerctr/xterrace';
						alert("保存成功");
						
					}else{
						alert("保存失败");
					}
				}
			});
		}
		
		function changePage(url , topage){
			var totalpage = $("#absence_totalPage").val();
			if(topage<0){
				alert("所写页码需大于0");
				return;
			}
			if(topage>totalpage){
				alert("所写页码大于总页码了, 当前总页码为"+totalpage);
				return;
			}
			var uri = url+topage;
			document.location.href = uri;
		}
		
		function gtarget(event , questid){
			event.stopPropagation();
			document.location.href="${ctx }/credit/answerctr/showZeroAnswer?questid="+questid+"&index=1";
		}
	</script>
</body>
</html>