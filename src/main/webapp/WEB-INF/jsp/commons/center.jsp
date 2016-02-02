<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${ctx}/js/jquery-1.9.0.min.js"></script>
<div class="r2">
	<div class="r2_1">
		<div class="r2_1_left">
			<div class="hyxx">
				<div class="hyxx1">
					<ul>
						<li class="gly_tx"><a href="xdjlsy.html"><img
								src="${ctx }/images/hy_tx.png" alt="会员名" /></a></li>
						<li class="gly_xx1">
							<div>
								<span>姓名：</span><strong>${creditManager.personName }</strong>
							</div>
							<div>
								<span>机构：</span><strong>${creditManager.organization }</strong>
							</div>
							<div id="star">
								<span>服务：</span>
								<img src="${ctx}/images/${creditManager.starLevel }" width="92px" />
								<p></p>
							</div>
						</li>
						<li class="gly_xx2">
							<div>
								<span>实名认证：</span><strong>
								<c:if test="${creditManager.realNameStatus == true }">已认证</c:if>
								<c:if test="${creditManager.realNameStatus == false }">未认证</c:if>
								</strong>
							</div>
							<div>
								<span>机构认证：</span><strong>
								<c:if test="${creditManager.organizationAuthStatus == true }">已认证</c:if>
								<c:if test="${creditManager.organizationAuthStatus == false }">已认证</c:if>
								</strong>
							</div>
							<div>
								<span>服务区域：</span><strong>${creditManager.serverZone }</strong>
							</div>
						</li>
						<li class="clear"></li>
					</ul>
				</div>
				<div class="hyxx2">
					<ul>
						<li><a href="${ctx}/credit/user/detail/list">
						<c:choose>
							<c:when test="${empty outline.cashRemain}">0</c:when>
							<c:otherwise>${outline.cashRemain }</c:otherwise>
						</c:choose>
						<span>账户余额</span></a></li>
						<li><a href="${ctx}/credit/user/detail/list">
						<c:choose>
							<c:when test="${empty outline.rewardRemain}">0</c:when>
							<c:otherwise>${outline.rewardRemain }</c:otherwise>
						</c:choose>
							<span>代金券余额</span></a></li>
						<li><a href="${ctx}/credit/user/reward/list">
						<c:choose>
							<c:when test="${empty outline.awardRemain}">0</c:when>
							<c:otherwise>${outline.awardRemain }</c:otherwise>
						</c:choose>
						<span>奖励余额</span></a></li>
						<li><a href="#">0<span>剩余积分</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="r2_1_right">
			<div class="a_c_x_k">
				<ul>
					<li class="li_left m_b_15"><a href="#"><i
							class="cp_tb"></i>
						<p>
								<span class="bt">产品</span><span class="sz">33</span>
							</p></a></li>
					<li class="li_right m_b_15"><a href="${ctx}/credit/case/list"><i
							class="anli_tb"></i>
						<p>
								<span class="bt">案例</span><span class="sz">
								${caseNum }
								</span>
							</p></a></li>
					<li class="li_left"><a href="${ctx}/order/appointlist"><i
							class="kehu_tb"></i>
						<p>
								<span class="bt">客户</span><span class="sz">${orderNum }</span>
							</p></a></li>
					<li class="li_right"><a href="javascript:void(0)" onclick="message()"><i
							class="xxi_tb"></i>
						<p>
								<span class="bt">消息</span><span class="sz">${message }</span>
							</p></a></li>
				</ul>

			</div>

		</div>
		<div class="clear"></div>
	</div>
	<Div class="r2_2">
		<div class="r2_2_left">
			<dl>
				<dt>
					<span>商务顾问</span>
				</dt>
				<dd>
					您的顾问：<span>${servicer.name }李小姐</span>
				</dd>
				<dd>
					联系手机：<span>${servicer.phone }15586986986</span>
				</dd>
				<dd>
					联系电话：<span>${servicer.tel }0571-6855954000</span>
				</dd>
				<dd>
					Q Q客服：<span>${servicer.qq }125156894</span>
				</dd>
				<dd>
					微信号码：<span>${servicer.weChat }dwa15586986859</span>
				</dd>
			</dl>
		</div>
		<div class="r2_2_center">
			<dl>
				<dt>
					<span>积分获取</span>
				</dt>
				<dd>
					<a href="${ctx}/credit/user/show" class="div_left" ><p>
							完善资料<br />
							<span>+10 </span>分
						</p>
						<i class="wszl"></i></a>
				</dd>
				<dd>
					<a href="javascript:void(0)"  onclick="convert()" class="div_right">
					<p>
							实名认证<br />
							<span>+30 </span>分
						</p>
						<i class="smrz"></i></a>
				</dd>
				<dd>
					<a href="${ctx }/credit/memberctr/find" class="div_left"><p>
							推荐会员<br />
							<span>+1 </span>分
						</p>
						<i class="mrqd"></i></a>
				</dd>
				<dd>
					<a href="${ctx }/credit/answerctr/xterrace" class="div_right"><p>
							回答问题<br />
							<span>+2 </span>分
						</p>
						<i class="hdwt"></i></a>
				</dd>
				<div class="clear"></div>
			</dl>
		</div>
		<div class="r2_2_right">
			<dl>
				<dt>
					<span>APP下载</span>
				</dt>
				<dd>
					<img src="${ctx}/images/smdl1.jpg" /><span>Android版下载</span>
				</dd>
				<dd>
					<img src="${ctx}/images/smdl1.jpg" /><span>IOS版下载</span>
				</dd>
				<div class="clear"></div>
			</dl>
		</div>
		<div class="clear"></div>
	</Div>
	<div class="r2_3">
		<div class="r2_3_left">
			<div class="cptg">
				<div class="cptg_bt">
					<span>产品推广</span>
				</div>
				<div class="cptg_nr">
					<p>&nbsp;&nbsp;&nbsp;&nbsp;设置产品推广可获得更好的产品展示位置
						（已有23503位信贷经理设置完成，其中有 92%的用户得到提升效果）</p>
					<a href="#" class="tg_btn">立即设置</a>
				</div>
			</div>
		</div>
		<div class="r2_3_center">
			<div class="cptg">
				<div class="cptg_bt">
					<span>推荐分享</span>
				</div>
				<div class="cptg_nr">
					<p>&nbsp;&nbsp;&nbsp;&nbsp;推荐给好友可获得积分，好友充值或贷款成功可获得奖励(已有2342位信贷经理成功推荐会员，其中93%的信贷经理获得现金奖励)
					</p>
					<a href="${ctx }/credit/memberctr/find" class="tg_btn">立即分享</a>
				</div>
			</div>
		</div>
		<div class="r2_3_right">
			<div class="cptg">
				<div class="cptg_bt">
					<span>账户充值</span>
				</div>
				<div class="cptg_nr">
					<p>&nbsp;&nbsp;&nbsp;&nbsp;设置产品推广可获得更好的产品展示位置
						（已有23503位信贷经理设置完成，其中有 92%的用户得到提升效果）</p>
					<a href="#" class="tg_btn">立即充值</a>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<form action="" method="post" id="person_center_convert">
		<input type="hidden" name="index" value="0">
</form>

<script>
function convert(){
	$("#person_center_convert").attr("action" , "${ctx}/credit/user/cert");
	$("#person_center_convert").submit();
	
}

</script>