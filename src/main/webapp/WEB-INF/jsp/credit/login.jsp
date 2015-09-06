<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理_登录</title>
<link rel="icon" href="${ctx}/images/moke.ico" />
<script type="text/javascript" src="${ctx}/js/tab.js"></script>
<link href="${ctx}/css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/js/messages_zh.min.js"></script>
</head>
<body>
<div class="container">
	<div class="header">
		<div class="h_bar">
			<div class="h_b_left"><h1>400-860-9280</h1><span>（工作日：9:00-17:30）</span>
				<span>
					<a href="#" class="fx_xl" onmouseover="show('xlfx')" onmouseout="hid('xlfx')"></a>
					<img src="${ctx }/images/fx_xl.png" id="xlfx"/>
				</span>
				<span>
					<a href="#" class="fx_wx" onmouseover="show('wxfx')" onmouseout="hid('wxfx')"></a>
					<img src="${ctx }/images/fx_wx.png" id="wxfx"/>
				</span>
				<span>
					<a href="#" class="fx_qq" onmouseover="show('qqfx')" onmouseout="hid('qqfx')"></a>
					<img src="${ctx }/images/fx_qq.png" id="qqfx"/>
				</span>
			</div>
			<div class="h_b_right">
				<ul class="menu">
					<li class="hit" onmouseover="show('xdjl')" onmouseout="hid('xdjl')">
						<a href="#" class="xl">信贷经理</a>
						<ul id="xdjl" class="fnav">
							<li><a href="${ctx}/register/credit/page">入驻平台</a></li>
							<li><a href="${ctx}/login/credit/page">登录平台</a></li>
						</ul>
					</li>
					<li onmouseover="show('pthy')" onmouseout="hid('pthy')">
						<a href="#" class="xl">普通会员</a>
						<ul id="pthy" class="fnav">
							<li><a href="${ctx}/html_pt/zhuce_pt.html">注册会员</a></li>
							<li><a href="${ctx}/html_pt/login_pt.html">登录平台</a></li>
						</ul>
					</li>
					<li><a href="#">新手指南</a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div class="h_logo">
			<div class="h_l_left">
				<a href="#"><img src="${ctx}/images/logo.jpg" /></a>
			</div>
			<div class="h_l_right">
				<ul>
					<li class="hit"><a href="#">首页</a></li>
					<li><a href="#">贷款产品</a></li>
					<li><a href="#">融资机构</a></li>
					<li><a href="#">信贷经理</a></li>
					<li><a href="#">新闻资讯</a></li>
					<li><a href="#">帮助中心</a></li>
					<li><a href="#">问答中心</a></li>
					<li class="clear"></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="center">
		<div class="c_bt"><h1>信贷经理登录</h1><span>还没有账户？<a href="zhuce.html">立即注册></a></span></div>
		<div class="c_nr">
			<s:form action="${ctx}/login/credit" commandName="loginInfo" method="post" id="loginForm">
				<div class="wbk">
					<s:input path="telPhone" class="l_yhm required" placeholder="请输入手机号" />
				</div>
				<div class="wbk">
					<s:password path="password" class="l_mm required" placeholder="请输入密码" />
				</div>
				<div class="yzm">
					<span>验证码:</span><input id="checkCode" value="" class="y" name="checkC" />
					<a href="javascript:void(0)" onClick="document.getElementById('aucode').src='${ctx}/imgauthcode?'+getSec()">
						<img id="aucode" border="0" src="${ctx}/imgauthcode" />
					</a>
				</div>
				<div class="btn">
					<input type="button" value="确认登录" class="l_btn" onclick="creditLogin()"/>
				</div>
				<div class="mdl">
					<s:checkbox path="freeLogin" class="left"/><span>5天内免登录</span>
					<a href="${ctx}/html_gg/find_password.html" class="f_lj">忘记密码？</a>
				</div>
			</s:form>
			<div class="smdl">
				<img src="${ctx}/images/smdl.jpg" />
				<span>扫一扫微信直接登录</span>
			</div>
		</div>
	</div>
	<div class="footer">
	   <p><a href="#">关于新越网</a>  | <a href="#">服务条款</a> | <a href="#">法律声明</a> |  <a href="#">隐私保护</a> |  <a href="#">联系我们</a>  | <a href="#">帮助中心</a> | <a href="#">加入我们</a>  |  <a href="#">友情链接</a></p>
	    <p>浙ICP备11022285号  www.91loan.cn © 2012-2014     新越网网站所有权归杭州摩科信息技术有限公司所有      客服电话：0571-86707362    </p>
	</div>
</div>
<script type="text/javascript">
// $(function(){
// 	$("#loginForm").validate({
// 		rules:{
// 			checkC:{
// 				required:true,
// 				remote:{
//                     type: "post",
//                     url:"${ctx}/login/check/code",
//                     data:{
//                     	checkCode: function(){return $("#checkCode").val();}
//                     }
// 				}
// 			}
// 		},
// 		messages: {
// 			checkC:{
// 				required:"<span class='zc_zs'>* 请输入验证码</span>",
// 				remote:"<span class='zc_zs'>* 手机验证码错误</span>"
// 			}
// 		},
// 		errorPlacement: function(error, element) {
// 			error.appendTo(element.parent());
// 		},
// 	});
// });

function creditLogin(){
	
// 	if ($("#loginForm").valid()) {
		$("#loginForm").submit();
// 	}
}

	
function getSec(){
	var myDate = new Date();
	return myDate.getTime();
}	
</script>
</body>
</html>