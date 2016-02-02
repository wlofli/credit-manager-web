/**
 * add by lzc <coushuxiaolang@163.com>
 * 验证码统一js
 * 
 * 规则:button id 必须为code_btn
 * input:输入框 id
 * uri:请求的地址
 * 
 * css: smrz_btn2
 * 		smrz_btn1
 * 
 * 
 */

function sendCode(input,uri){
		var tel = $(input).val();
		if (tel == "") {
			alert("请填写手机号！");
			return;
		}

		$.ajax({
			url:uri + tel,
			type:"post",
			success:function(data){
				if (data=="success") {
					timer();
				} else {
					alert("验证码发送失败！");
				}
			}
		});
	}
	
	var time = 61;	

	function timer(){
		if (time == 1) {
			$("#code_btn").val("获取手机验证码");
			$("#code_btn").removeClass("smrz_btn2");
			$("#code_btn").addClass("smrz_btn1");
			$("#code_btn").removeAttr("disabled");
			time = 61;
		} else {
			$("#code_btn").removeClass("smrz_btn1");
			$("#code_btn").addClass("smrz_btn2");
			$("#code_btn").attr("disabled","disabled");
			time = time - 1;
			$("#code_btn").val(time+"秒后重新获取");
			setTimeout(function(){timer()},1000);
		}
	}