package com.xinyue.credit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.xinyue.credit.model.User;
import com.xinyue.credit.service.UserService;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.SearchReward;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.Consumption;
import com.xinyue.manage.model.OutLine;
import com.xinyue.manage.model.Recharge;
import com.xinyue.manage.model.Reward;
import com.xinyue.manage.model.WithdrawMoney;
import com.xinyue.manage.service.CityService;
import com.xinyue.manage.service.FundService;
import com.xinyue.manage.service.OrganizationService;
import com.xinyue.manage.service.RewardService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.GlobalConstant;

/**
 * 
 * @author wenhai.you
 * @2015年7月6日
 * @上午9:47:21
 */
@Controller
@RequestMapping("/credit/user")
public class UserController {

	@Resource
	private UserService ubiz;
	

	//add by lzc
	@Resource
	private RewardService rewardService;
	
	//add by lzc
	@Resource
	private FundService fundService;
	
	@Resource
	private SelectService sbiz;
	
	@Resource
	private CityService cbiz;
	
	@Resource
	private OrganizationService obiz;
	@RequestMapping(value = "/show")
	public String person(Model model , HttpServletRequest req){
	
		List<SelectInfo> province = sbiz.findProvince();
		model.addAttribute("province", province);
		//机构
		List<SelectInfo> organizations = obiz.getOrganizations();
		model.addAttribute("organizations", organizations);
		User user = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		model.addAttribute("user", ubiz.getUserById(Long.valueOf(user.getId())));
		return "credit/account/personcenter";
	}
	
	
	@RequestMapping(value = "/city", method = {RequestMethod.POST})
	public @ResponseBody List<SelectInfo> getCity(@RequestBody String id, HttpServletRequest req) {
		
		List<SelectInfo> cities = cbiz.getCitiesByProvinceId(id);
		
		return cities;
	}
	
	@RequestMapping(value="/saveUser" , method={RequestMethod.POST})
	@ResponseBody
	public String saveUser(User user , HttpServletRequest req){
		User u = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		boolean b = ubiz.saveUser(user, u.getTelPhone());
		if(b){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value = "/cert" , method={RequestMethod.POST })
	public String certification(Model model , HttpServletRequest req){
		User u = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		User user = ubiz.getCertById(u.getId());
		
		String index = req.getParameter("index");
		if(Globals.isNull(user)){
			user = new User();
			model.addAttribute("user", user);
			List<SelectInfo> province = sbiz.findProvince();
			model.addAttribute("province", province);
			return "credit/account/cert";
		}else if("3".equals(user.getAudit())){
			model.addAttribute("user", user);
			return "credit/account/defeat";
		}else if("4".equals(user.getAudit())){
			model.addAttribute("cert", user);
			model.addAttribute("showpath", ubiz.SHOW_PATH);
			return "credit/account/certvalid";
		}else if("2".equals(user.getAudit()) || (!Globals.isNull(index) && index.equals("2"))){
			return "credit/account/review";
		}else if("1".equals(user.getAudit()) && !Globals.isNull(index) && index.equals("0")){
			List<SelectInfo> province = sbiz.findProvince();
			model.addAttribute("province", province);
			model.addAttribute("user", user);
			return "credit/account/cert";
		}else{
			model.addAttribute("user", user);
			model.addAttribute("showpath", ubiz.SHOW_PATH);
			return "credit/account/certone";
		}
		/**
		else if("1".equals(user.getAudit()) && !Globals.isNull(index) && index.equals("1")){
			model.addAttribute("user", user);
			model.addAttribute("showpath", ubiz.SHOW_PATH);
			return "credit/account/certone";
		}
		*/
	}
	
	@RequestMapping(value="/saveCert" , method={RequestMethod.POST})
	@ResponseBody
	public String saveCert(User user , HttpServletRequest req){
		User u = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		boolean b = ubiz.saveCert(user,u);
		if(b){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/saveCertImg" , method={RequestMethod.POST})
	@ResponseBody
	public String saveCertImg(User user , HttpServletRequest req){
		User u = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		boolean b = ubiz.updateCertImg(user,u);
		if(b){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/updateAudit" , method={RequestMethod.POST})
	@ResponseBody
	public String updateAudit(@RequestBody String id , HttpServletRequest req){
		User u = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		boolean b = ubiz.updateAudit(id, u.getTelPhone());
		if(b){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/initialAudit" , method={RequestMethod.POST})
	@ResponseBody
	public String initialAudit(@RequestBody String id , HttpServletRequest req){
		User u = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		boolean b = ubiz.initialAudit(id, u.getTelPhone());
		if(b){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="upload" , method={RequestMethod.POST})
	@ResponseBody
	public String upload(HttpServletRequest req , String suffix){
		CommonsMultipartResolver multipartResolver  = new CommonsMultipartResolver(req.getServletContext());
		if(multipartResolver.isMultipart(req)){
			MultipartHttpServletRequest  multiRequest = (MultipartHttpServletRequest)req;
			return ubiz.upload(multiRequest, suffix);
		}
		return "fail";
	}
	
//	add by lzc start
	@RequestMapping("withdraw/list")
	public String withdrawList(@ModelAttribute("search")SearchReward searchReward, Model model, 
			HttpSession session,@RequestParam(defaultValue="1")int topage){
		User user = (User) session.getAttribute(Globals.SESSION_USER_INFO);
		OutLine outLine = rewardService.getOutLine(user.getId(), GlobalConstant.USER_TYPE_CREDIT);
		model.addAttribute("outline", outLine);
		model.addAttribute(Globals.FUND_TYPE, Globals.FUND_TYPE_WITHDRAW);
		List<WithdrawMoney> withdrawMoneyList = rewardService
				.getRewardWithdrawList(user.getId(), (topage - 1) * GlobalConstant.PAGE_SIZE, GlobalConstant.PAGE_SIZE, searchReward);
		int count = rewardService.countRewardWithdraw(user.getId(), searchReward);
		PageData<WithdrawMoney> page = 	new PageData<WithdrawMoney>(withdrawMoneyList, count, topage);
		model.addAttribute("page", page);
		return "credit/fund/withdrawList";
	}
	
	
	@RequestMapping("detail/list")
	public String fundDetailList(@ModelAttribute("search")SearchReward searchReward, Model model,
			HttpSession session,@RequestParam(defaultValue="1")int topage){
		User user = (User) session.getAttribute(Globals.SESSION_USER_INFO);
		OutLine outLine = rewardService.getOutLine(user.getId(), GlobalConstant.USER_TYPE_CREDIT);
		model.addAttribute("outline", outLine);
		model.addAttribute(Globals.FUND_TYPE, Globals.FUND_TYPE_DETAIL);
		List<OutLine> outLineList = rewardService.getDetaiList(user.getId(), GlobalConstant.USER_TYPE_CREDIT, 
						(topage - 1) * GlobalConstant.PAGE_SIZE, GlobalConstant.PAGE_SIZE, searchReward);
		
		int count = rewardService.countDetailList(user.getId(), GlobalConstant.USER_TYPE_CREDIT, searchReward);
		
		PageData<OutLine> page = new PageData<OutLine>(outLineList, count, topage);
		model.addAttribute("page", page);
		return "credit/fund/detailList";
	}
	
	
	@RequestMapping("reward/list")
	public String rewardList(@ModelAttribute("search")SearchReward searchReward, Model model,HttpSession session,
			@RequestParam(defaultValue="1")int topage){
		User user = (User) session.getAttribute(Globals.SESSION_USER_INFO);
		OutLine outLine = rewardService.getOutLine(user.getId(), GlobalConstant.USER_TYPE_CREDIT);
		model.addAttribute("outline", outLine);
		model.addAttribute(Globals.FUND_TYPE, Globals.FUND_TYPE_REWARD);
		List<Reward> rewards = rewardService.getRewardList(user.getId(), 
				(topage - 1) * GlobalConstant.PAGE_SIZE, GlobalConstant.PAGE_SIZE, searchReward);
		int count = rewardService.countRewardList(user.getId(), searchReward);
		PageData<Reward> page = new PageData<Reward>(rewards, count, topage);
		model.addAttribute("page", page);
		return "credit/fund/rewardList";
	}
	
	
	@RequestMapping("consumption/list")
	public String consumptionList(@ModelAttribute("search")SearchReward searchReward,Model model,HttpSession session,
			@RequestParam(defaultValue="1")int topage){
		User user = (User) session.getAttribute(Globals.SESSION_USER_INFO);
		OutLine outLine = rewardService.getOutLine(user.getId(), GlobalConstant.USER_TYPE_CREDIT);
		model.addAttribute("outline", outLine);
		model.addAttribute(Globals.FUND_TYPE, Globals.FUND_TYPE_CONSUMPTION);
		List<Consumption> consumptions = fundService.getConsumptionsByUserId(user.getId(),GlobalConstant.USER_TYPE_CREDIT,
				(topage -1) * GlobalConstant.PAGE_SIZE, GlobalConstant.PAGE_SIZE, searchReward);
		
		int count = fundService.countConsumptionByUserId(user.getId(),GlobalConstant.USER_TYPE_CREDIT,searchReward);
		
		PageData<Consumption> page = new PageData<Consumption>(consumptions, count, topage);
		model.addAttribute("page", page);
		return "credit/fund/consumptionList";
	}
	
	@RequestMapping("recharge/list")
	public String rechargeList(@ModelAttribute("search")SearchReward searchReward,Model model,HttpSession session,
			@RequestParam(defaultValue="1")int topage){
		User user = (User) session.getAttribute(Globals.SESSION_USER_INFO);
		OutLine outLine = rewardService.getOutLine(user.getId(), GlobalConstant.USER_TYPE_CREDIT);
		model.addAttribute("outline", outLine);
		model.addAttribute(Globals.FUND_TYPE, Globals.FUND_TYPE_RECHARGE);
		List<Recharge> recharges = fundService
				.getRechargesByUserId(user.getId(), GlobalConstant.USER_TYPE_CREDIT, (topage - 1) * GlobalConstant.PAGE_SIZE, GlobalConstant.PAGE_SIZE, searchReward);
		int count = fundService.countRechargeByUserId(user.getId(), GlobalConstant.USER_TYPE_CREDIT, searchReward);
		PageData<Recharge> page = new PageData<Recharge>(recharges, count, topage);
		model.addAttribute("page", page);
		return "credit/fund/rechargeList";
	}
//	add by lzc end
	
	
	
	
}
