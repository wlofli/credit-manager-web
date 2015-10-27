package com.xinyue.credit.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xinyue.credit.model.User;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.model.CreditManager;
import com.xinyue.manage.model.CreditManagerInfo;
import com.xinyue.manage.model.OutLine;
import com.xinyue.manage.model.Servicer;
import com.xinyue.manage.service.CreditManagerService;
import com.xinyue.manage.service.RewardService;
import com.xinyue.manage.service.ServicerService;
import com.xinyue.manage.util.GlobalConstant;

/**
 * author lzc
 * 信贷经理->我的主页
 */
@Controller
@RequestMapping("/home")
public class HomeController {
	
	
	@Resource
	private CreditManagerService creditManagerService;
	
	@Resource
	private ServicerService servicerService;
	
	
	@Resource
	private RewardService rewardService;
	
	@RequestMapping("/home")
	public String homePage(HttpSession session,Model model){
		User user = (User) session.getAttribute(Globals.SESSION_USER_INFO);
		CreditManagerInfo creditManager = creditManagerService.findCreditManagerInfoById(user.getId());
		model.addAttribute("creditManager", creditManager);
		
		
		//前期准备用id为1的隔壁老王
		Servicer servicer = servicerService.getServicerById("1");
		model.addAttribute("servicer", servicer);
		
		OutLine outLine = rewardService.getOutLine(user.getId(), GlobalConstant.USER_TYPE_CREDIT);
		model.addAttribute("outline", outLine);
		
		
		return "credit/main";
	}
	
	
	@RequestMapping("redirect")
	public String redirect(){
		return "commons/redirect";
	}

}
