package com.xinyue.credit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.credit.model.User;
import com.xinyue.credit.service.LoginService;
import com.xinyue.credit.util.Globals;
import com.xinyue.credit.util.ImageAuthcode;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.service.OrganizationService;
import com.xinyue.manage.service.SelectService;

/**
 * 登录注册修改
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月8日
 */
@Controller
public class LoginController {

	private Logger log = Logger.getLogger(LoginController.class);
	
	@Resource
	private SelectService selectService;
	
	@Resource
	private LoginService loginService;
	
	@Resource
	private OrganizationService organizationService;
	
	@RequestMapping(value = { "/", "/index","/login/credit/page" })
	public String tologin(Model model) {

		User user = new User();
		model.addAttribute("loginInfo", user);
		
		return "credit/login";
	}

	/**
	 * 登录
	 * @param model
	 * @param req
	 * @param loginInfo
	 * @return
	 */
	@RequestMapping(value = "/login/credit",method=RequestMethod.POST)
	public String login(Model model, HttpServletRequest req, User loginInfo) {
		
		//debug start
		User test = new User();
		test.setId("3");
		test.setTelPhone("18768104912");
		test.setRealName("李志超");
		test.setOrganization("1");
//		test.setLocation("330100");
		test.setLoginType("0");
		test.setIpAddress("127.0.0.1");
		test.setInvitationCode("abcdef");
		test.setHeadImgPath("");
		test.setLastLoginTime("2015-06-02");
		req.getSession().setAttribute(Globals.SESSION_USER_INFO, test);
		return "forward:/home/home";
		//debug end
		
//		User result = loginService.checkUser(loginInfo);
//		
//		if (result != null) {
//			req.getSession().setAttribute(Globals.SESSION_USER_INFO, result);
//			return "credit/main";
//		} else {
//			model.addAttribute("checkMessage", "账户或密码不正确！");
//			
//			User user = new User();
//			user.setTelPhone(loginInfo.getTelPhone());
//			model.addAttribute("loginInfo", user);
//			
//			return "forward:home/home";
//		}
	}

	/**
	 * 生成验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/imgauthcode")
	public void ImageAuthcode(HttpServletRequest request,HttpServletResponse response){
		try{
			ImageAuthcode.authCode(request, response);
		}
		catch(Exception e){
			log.error("验证码图片错误："+e.getMessage());
		}
	}
	
	/**
	 * 登录验证码验证
	 * @param checkCode
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/login/check/code",method=RequestMethod.POST)
	public @ResponseBody boolean checkCode(String checkCode,HttpServletRequest request) {
		
		String sessionCode = request.getSession().getAttribute(Globals.LOGIN_CHECK_CODE).toString();
		
		if (checkCode.toLowerCase().equals(sessionCode.toLowerCase())) {
			return true;
		}else {
			return false;
		}
		
	}
	
	/**
	 * 手机验证码验证
	 * @param checkCode
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/register/check/code",method=RequestMethod.POST)
	public @ResponseBody boolean checkPhoneCode(String checkCode,HttpServletRequest request) {
		
		try {
			String sessionCode = request.getSession().getAttribute(Globals.SESSION_PHONE_CODE).toString();
			
			if (checkCode.toLowerCase().equals(sessionCode.toLowerCase())) {
				return true;
			}
		} catch (Exception e) {
			log.error("session中不存在手机验证码！");
		}
		return false;
		
	}
	
	/**
	 * 进入注册页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/register/credit/page")
	public String gotoRegister(Model model,String invitationCode) {
		
		User user = new User();
		user.setInvited(invitationCode);
		model.addAttribute("registerInfo", user);
		
		//省
		List<SelectInfo> provinces = selectService.findProvince();
		model.addAttribute("provinces", provinces);
		
		//机构
		List<SelectInfo> organizations = organizationService.getOrganizations();
		model.addAttribute("organizations", organizations);
		
		return "credit/register";
	}
	
	/**
	 * 注册
	 * @param request
	 * @param model
	 * @param registerInfo
	 * @return
	 */
	@RequestMapping(value="/register/credit/submit",method=RequestMethod.POST)
	public String registerSubmit(HttpServletRequest request,Model model,User registerInfo) {
		
		
		boolean result = loginService.saveUser(registerInfo);
		
		if (result) {
			return "credit/main";
		}else {
			model.addAttribute("registerInfo", registerInfo);
			return "credit/register";
		}
	}
	
	@RequestMapping(value="/credit/change/psw")
	public String gotoChangePsw(Model model) {
		User pswInfo = new User();
		
		model.addAttribute("pswInfo", pswInfo);
		
		return "credit/changePassword";
	}
	
	@RequestMapping(value="/credit/check/psw",method=RequestMethod.POST)
	public @ResponseBody boolean checkPsw(HttpServletRequest request,String password) {
		
		User user = (User)request.getSession().getAttribute(Globals.SESSION_USER_INFO);
		
		int result = loginService.checkPsw(user.getTelPhone(),password);
		
		if (result > 0) {
			return true;
		}
		return false;
	}
	
	@RequestMapping(value="/credit/psw/submit",method=RequestMethod.POST)
	public @ResponseBody String changePswSubmit(User pswInfo,Model model,HttpServletRequest request) {
		
		User user = (User)request.getSession().getAttribute(Globals.SESSION_USER_INFO);
		
		pswInfo.setTelPhone(user.getTelPhone());
		pswInfo.setId(user.getId());
		
		boolean result = loginService.updatePsw(pswInfo);
		
		if (result) {
			return "true";
		}
		
		return "false";
	}
}
