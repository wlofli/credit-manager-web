<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="header">
		<div class="h_bar">
			<div class="h_b_left"><h1>400-860-9280</h1><span>（工作日：9:00-17:30）</span>
				<span>
				<a href="#" class="fx_xl" onmouseover="show('xlfx')" onmouseout="hid('xlfx')"></a>
				<img src="${ctx}/images/weixin.jpg" id="xlfx" style="z-index:999;" width="100" height="90"/>
			</span>
			<span>
				<a href="#" class="fx_wx" onmouseover="show('wxfx')" onmouseout="hid('wxfx')"></a>
				<img src="${ctx}/images/weibo.jpg" id="wxfx" style="z-index:999;" width="100" height="90"/>
			</span>
			<span>
				<a href="http://wpa.qq.com/msgrd?v=3&uin=2740293039&site=qq&menu=yes" target="_blank" class="fx_qq" onmouseover="show('qqfx')" onmouseout="hid('qqfx')"></a>
				<img src="http://wpa.qq.com/pa?p=2:2740293039:51" id="qqfx" style="z-index:999;"/>
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
							<li><a href="/xinyue-server-webapp/register/member">注册会员</a></li>
							<li><a href="/xinyue-server-webapp/login/member">登录平台</a></li>
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
					<li id="index"><a href="/xinyue-server-webapp/index">首页</a></li>
					<li id="product"><a href="javascript:void(0)" onclick="document.location.href='/xinyue-server-webapp/product/show'">贷款产品</a></li>
					<li id="org"><a href="javascript:void(0)" onclick="document.location.href='/xinyue-server-webapp/org/show'">融资机构</a></li>
					<li id="manager"><a href="/xinyue-server-webapp/manager">信贷经理</a></li>
					<li id="new"><a href="/xinyue-server-webapp/new/homelist">新闻资讯</a></li>
					<li id="help"><a href="/xinyue-server-webapp/help">帮助中心</a></li>
					<li id="question"><a href="javascript:void(0)" onclick="document.location.href='/xinyue-server-webapp/quest/show'">问答中心</a></li>
					<li class="clear"></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>