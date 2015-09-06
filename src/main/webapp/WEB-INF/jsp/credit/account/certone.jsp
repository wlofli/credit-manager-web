<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信贷经理-个人中心-实名认证-上传资料</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../commons/common.jsp"  %>
<script type="text/javascript">
function convert(t){
	
	if(t == 'p'){
		$("#person_center_convert").attr("action" , "${ctx}/credit/user/show");
		$("#person_center_convert").submit();
	}else{
		$("#person_center_convert").attr("action" , "${ctx}/credit/user/cert");
		$("#person_center_convert").submit();
	}
	
}
$(function(){
	
	$("div.left li").each(function(){
		$(this).removeClass("hit");
	});
	$("a.zh").parent().addClass("hit");
	$("a.zh").parent().children().find("li").eq(0).addClass("hit");
	
});

</script>
</head>
<body>
	<s:form action="" method="post" id="person_center_convert">
		<input type="hidden" name="index" id="person_index" value="2">
	</s:form>
	<div class="main">
		<jsp:include page="../../commons/left.jsp"></jsp:include>

		<div class="right">
			<jsp:include page="../../commons/head.jsp"></jsp:include>
			<div class="grzl">
				<div class="grzx_bt">
					<span>个人中心</span>
				</div>
				<div class="grzx_nr">
					<div class="grzx_nr1">
						<ul>
							<li><a href="javascript:void(0)" onclick="convert('p')">个人资料</a></li>
							<li><a href="javascript:void(0)" class="hit">实名认证</a></li>
						</ul>
					</div>
					<div class="smrz1"></div>
					<div class="grzx_nr2">
						<s:form commandName="user" method="post" id="person_uploads" enctype="multipart/form-data">
						<div class="zjsc">
							<input type="hidden" id="upload_file"/>
							<s:hidden path="id" id="person_id"/>
							<div class="zjsc1">
								<dl>
									<dt>有效身份证</dt>
									<dd class="zj_dd">
										<c:choose>
											<c:when test="${empty user.cardImgPath}">
												<img src="${ctx }/images/sfz.png" id="card_person_img" onclick="javascript:show(1)" />
											</c:when>
											<c:otherwise>
												<img src="${showpath }credit/person/card/${user.cardImgPath}" id="card_person_img" onclick="javascript:show(1)" />
											</c:otherwise>
										</c:choose>
										<s:hidden path="cardImgPath" id="card_person" required="true"/>
									</dd>
									<dd>
										<input type="button" value="立即上传" class="tpsc"
											onclick="javascript:show(1)" />
									</dd>
								</dl>

							</div>
							<div class="zjsc2">
								<dl>
									<dt>工作证</dt>
									<dd class="zj_dd">
										<c:choose>
											<c:when test="${empty user.workImgPath }">
												<img src="${ctx }/images/gzz.png" id="work_person_img" onclick="javascript:show(2)" />
											</c:when>
											<c:otherwise>
												<img src="${showpath }credit/person/work/${user.workImgPath}" id="work_person_img" onclick="javascript:show(2)" />
											</c:otherwise>
										</c:choose>
										
										<s:hidden path="workImgPath" id="work_person" required="true"/>
									</dd>
									<dd>
										<input type="button" value="立即上传" class="tpsc"
											onclick="javascript:show(2)" />
									</dd>

								</dl>
							</div>
							<div class="zjsc3">
								<dl>
									<dt>近半身职业照</dt>
									<dd class="zj_dd">
										<c:choose>
											<c:when test="${empty user.headImgPath }">
												<img src="${ctx }/images/tx.png" id="head_person_img" onclick="javascript:show(3)" />
											</c:when>
											<c:otherwise>
												<img src="${showpath }credit/person/head/${user.headImgPath}" id="head_person_img" onclick="javascript:show(3)" />
											</c:otherwise>
										</c:choose>
										<s:hidden path="headImgPath" id="head_person" required="true"/>
									</dd>
									<dd>
										<input type="button" value="立即上传" class="tpsc"
											onclick="javascript:show(3)" />
									</dd>
								</dl>
							</div>
							<div class="clear"></div>
						</div>
						<div id="login">
							<div class="login1">
								<div class="bt">
									<h1>上传图片</h1>
									<a href="javascript:hide()"><img src="${ctx }/images/close.png" /></a>
									<div class="clear"></div>
								</div>
								<div class="nr">
									<input type="file" name="file" id="file_upload"/> <input type="button" value="上传"
										class="sc_btn" onclick="upload()"/>
								</div>
							</div>
						</div>
						</s:form>
						<p>
							<input type="button" class="save_btn" value="上一步" onclick="history.back()"/>
							<input type="button" class="next_btn1" value="保 存" onclick="save()"/>
							<c:choose>
								<c:when test="${(not empty user.headImgPath) && (not empty user.cardImgPath) && (not empty user.workImgPath)}">
									<input type="button" class="next_btn1" value="下一步" onclick="next()"/>
								</c:when>
								<c:otherwise>
									<input type="button" class="next_btn1" id="next_btn" disabled="disabled" value="下一步" onclick="next()"/>
								</c:otherwise>
							</c:choose>
						</p>
						<p class="scsm">
							说明：<br /> <span>1、若身份证不在身边或者丢失，可上传驾驶证或护照扫描件代替。</span><span>
								2、工作证只要可以证明身份即可，例如：名片。</span><span> 3、请确认您三证中的头像、身份信息、工作信息完成一致。</span><span>
								4、为了您尽快通过实名认证，请您上传清晰可辨的三证。</span><span class="red_ts">
								5、图片最大支持2MB.</span><span class="red_ts">
								6、图片格式仅支持.jpg/.gif/.png/.bmp格式。</span>
						</p>

					</div>

				</div>

			</div>
		</div>
		<div class="clear"></div>
	</div>
	
	<div id="over"></div>
	<script type="text/javascript">
		var login = document.getElementById("login");
		var over = document.getElementById("over");
		function show(v) {
			$("#upload_file").val(v);
			login.style.display = "block";
			over.style.display = "block";
		}
		function hide() {
			login.style.display = "none";
			over.style.display = "none";
		}	
	
		$(function(){
			$("#person_uploads").validate({
				errorPlacement: function(error, element) {
					error.appendTo(element.parent());
				},
			});
		});
		
		function upload(){
			var f = $("#file_upload").val();
			var v = $("#upload_file").val();
			var type = [];
			if(f == ""){
				alert("请选择文件");
				return;
			}else{
				type = f.split(".");
			}
			
			$.ajaxFileUpload({
				url:'${ctx}/credit/user/upload',
				fileElementId:'file_upload',
				secureuri:true,
				data:{'suffix':type[1] },
				dataType:'json',
				type:'post',
				success:function(data){
				
					if(data != 'fail'){
						alert("上传成功");
						if(v == '1'){
							$("#card_person").val(data.name);
							$("#card_person_img").attr("src" , data.path);
						}else if(v == '2'){
							$("#work_person").val(data.name);
							$("#work_person_img").attr("src" , data.path);
						}else{
							$("#head_person").val(data.name);
							$("#head_person_img").attr("src" , data.path);
						}
					}
				}
			});
		}
		
		function save(){
			if($("#person_uploads").valid()){
				$.ajax({
					url:'${ctx}/credit/user/saveCertImg',
					type:'post',
					data:$("#person_uploads").serialize(),
					success:function(data){
						if(data == "success"){
							$("#next_btn").removeAttr("disabled");
							alert("保存成功");
						}
					}
				});
			}
		}
		
		function next(){
			if(confirm("温馨提示,\n提交之前请确认数据信息是否正确")){
				$.ajax({
					url:'${ctx}/credit/user/updateAudit',
					type:'post',
					contentType:'application/json',
					dataType:'json',
					data:JSON.stringify($("#person_id").val()),
					success:function(data){
						if(data == 'success'){
							convert('n');
						}else{
							alert("提交审核失败 ");
						}
					}
				});
			}
		}
	</script>
</body>
</html>