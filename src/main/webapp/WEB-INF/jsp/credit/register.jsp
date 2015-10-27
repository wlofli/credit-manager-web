<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理_入驻</title>
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
		<div class="c_bt"><h1>填写注册信息</h1><span>（全部为必填项）</span></div>
		<div class="c_nr">
			<s:form action="${ctx}/register/credit/submit" commandName="registerInfo" method="post" id="registerForm" >
				<div class="zc_wbk">
					<span class="zc_bt">手机号:</span>
					<s:input path="telPhone" class="text required digits" id="tel" maxlength="11"/>
					<s:hidden path="invited"/>
				</div>
				<div class="zc_wbk">
					<span class="zc_bt">登录密码:</span>
					<s:password path="password" class="text" />
				</div>
				<div class="zc_wbk">
					<span class="zc_bt">确认密码:</span>
					<s:password path="passwordConfirm" class="text"/>
				</div>
				<div class="zc_wbk">
					<span class="zc_bt">真实姓名:</span>
					<s:input path="realName" class="text required" />
				</div>
				<div class="zc_wbk">
					<span class="zc_bt">所在机构:</span>
					<s:select path="organization" class="csxz required">
						<s:option value="">--请选择--</s:option>
						<s:options items="${organizations}" itemValue="key" itemLabel="value"/>
					</s:select>
				</div>
				<div class="zc_wbk">
					<span class="zc_bt">所在地区:</span>
					<s:select path="province" class="csxz" id="editP" onchange="getCities()">
						<s:option value="">--省--</s:option>
						<s:options items="${provinces}" itemValue="key" itemLabel="value"/>
					</s:select>
					<s:select path="city" class="csxz" id="editC">
						<s:option value="">--市--</s:option>
						<s:options items="${cities}" itemValue="key" itemLabel="value"/>
					</s:select>
				</div>
				<div class="zc_wbk">
					<span class="zc_bt">手机验证码:</span>
					<input id="checkCode" name="checkCode" value="" class="text1" />
					<input type="button" class="btn_sjyz" value="获取验证码" id="code_btn" onclick="sendCode()" />
				</div>
				<div class="zc_tk">
					<input type="checkbox" class="left" checked="checked" id="server_cb"/><a href="#">同意服务条款</a>
				</div>
				<div class="zc_btn">
					<input type="button" value="注 册" class="z_btn" onclick="register()"/>
				</div>
			</s:form>
				<%-- 		<div class="smdl">
		<img src="../images/smzc.jpg" />
		<span>微信扫一扫<br />直接登录新越网</span>
		</div> --%>
		</div>
	</div>
	<div class="footer">
	   <p><a href="#">关于新越网</a>  | <a href="#">服务条款</a> | <a href="#">法律声明</a> |  <a href="#">隐私保护</a> |  <a href="#">联系我们</a>  | <a href="#">帮助中心</a> | <a href="#">加入我们</a>  |  <a href="#">友情链接</a></p>
	    <p>浙ICP备11022285号  www.91loan.cn © 2012-2014     新越网网站所有权归杭州摩科信息技术有限公司所有      客服电话：0571-86707362    </p>
	</div>
</div>
<script type="text/javascript">
var time = 61;
$(function(){
	$("#registerForm").validate({
		rules: {
			password:"required",
			passwordConfirm: {
				equalTo:"#password"
			},
			city:"required",
			checkCode:{
				required:true,
				remote:{
                    type: "post",
                    url:"${ctx}/register/check/code",
                    data:{
                    	checkCode: function(){return $("#checkCode").val();}
                    }
				}
			}
		},
		messages: {
			city:"<span class='zc_zs'>* 请选择所在地区</span>",
			checkCode:{
				remote:"<span class='zc_zs'>* 手机验证码错误</span>"
			}
		},
		errorPlacement: function(error, element) {
			error.appendTo(element.parent());
		},
	});
});

function register(){
	if ($("#registerForm").valid()) {
		$("#registerForm").submit();
	}
}	

	function getCities(){
		var provinceVal = $("#editP option:selected").val();
		
		$("#editC").empty();
		var option= $("<option/>");
		option.attr("value","");
		option.html("--市--");
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
				}
			});
		}
	}
	
	function sendCode(){
		var tel = $("#tel").val();
		if (tel == "") {
			alert("请填写手机号！");
			return;
		}

		$.ajax({
			url:"${ctx}/send/tel/code?phone="+tel,
			type:"post",
			success:function(data){
				if (data=="true") {
					timer();
				} else {
					alert("验证码发送失败！");
				}
			}
		});
	}
	
	function timer(){
		if (time == 1) {
			$("#code_btn").val("获取验证码");
			$("#code_btn").removeClass("btn_sjyz1");
			$("#code_btn").addClass("btn_sjyz");
			$("#code_btn").removeAttr("disabled");
			time = 61;
		} else {
			$("#code_btn").removeClass("btn_sjyz");
			$("#code_btn").addClass("btn_sjyz1");
			$("#code_btn").attr("disabled","disabled");
			time = time - 1;
			$("#code_btn").val(time+"秒后重新获取");
			setTimeout(function(){timer()},1000);
		}
	}
</script>
</body>
</html>