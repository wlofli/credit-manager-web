package com.xinyue.credit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.xinyue.credit.model.User;
import com.xinyue.credit.service.UserService;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.service.CityService;
import com.xinyue.manage.service.OrganizationService;
import com.xinyue.manage.service.SelectService;

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
}
