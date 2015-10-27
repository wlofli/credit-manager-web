package com.xinyue.credit.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.credit.model.User;
import com.xinyue.credit.service.MemberBiz;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.beans.EmailBean;
import com.xinyue.manage.beans.RecommendCredit;
import com.xinyue.manage.beans.RecommendMember;
import com.xinyue.manage.service.CommonService;

/**
 * 
 * @author wenhai.you
 * @2015年7月15日
 * @下午4:22:06
 */
@Controller("memberctrController")
@RequestMapping("/credit/memberctr")
public class MemberController {

	@Resource
	private MemberBiz mbiz;
	
	@Resource
	private CommonService cbiz;
	
	@RequestMapping("/find")
	public String show(Model model , HttpServletRequest req){
		User u = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		String yaoqm = mbiz.getYaoqm(u.getId());
		model.addAttribute("code", yaoqm);
		model.addAttribute("credit", mbiz.getRecommendCredit(yaoqm));
		model.addAttribute("member", mbiz.getRecommendMember(yaoqm));
		return "credit/account/member";
	}
	
	@RequestMapping("/emailMember")
	@ResponseBody
	public String emailMember(RecommendMember member, HttpServletRequest req){
		
		boolean result = new EmailBean().sendMail(member.getOrdinaryEmail(), "网站登录地址", member.getOrdinaryLink());
		if(result){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping("/telMember")
	@ResponseBody
	public String telMember(RecommendMember member, HttpServletRequest req){
		
		boolean result = cbiz.sendCodeByPhone(member.getOrdinaryTel(),member.getOrdinaryLink());
		if(result){
			return "success";
		}else{
			return "fail";
		}
	}
	
	
	@RequestMapping("/emailCredit")
	@ResponseBody
	public String emailCredit(RecommendCredit credit, HttpServletRequest req){
		
		boolean result = new EmailBean().sendMail(credit.getCreditEmail(), "网站登录地址", credit.getCreditLink());
		if(result){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping("/telCredit")
	@ResponseBody
	public String telCredit(RecommendCredit credit, HttpServletRequest req){
		
		boolean result = cbiz.sendCodeByPhone(credit.getCreditTel() , credit.getCreditLink());
		if(result){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping("/createCode")
	@ResponseBody
	public String createCode(@RequestBody String url){
		try {
			String codeimg = mbiz.createCode(url);
			if(Globals.isNull(codeimg)){
				return "fail";
			}
			return codeimg;
		} catch (Exception e) {
			// TODO: handle exception
			return "fail";
		}
	}
	
}
