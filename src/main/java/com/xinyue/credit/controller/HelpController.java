package com.xinyue.credit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xinyue.credit.model.HelpModel;
import com.xinyue.credit.service.CreditHelpService;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.beans.PageData;

/**
 * 
 * @author wenhai.you
 * @2015年7月2日
 * @下午5:24:32
 */
@Controller
@RequestMapping("/credit/help")
public class HelpController {

	@Resource
	private CreditHelpService hbiz;
	
	@RequestMapping("/find")
	public String find(Model model , HttpServletRequest req){
		int total = hbiz.getCount();
		String topage = req.getParameter("topage");
		int currentPage = Globals.isNull(topage) || topage.equals("")?1:Integer.valueOf(topage);
		List<HelpModel> list = hbiz.findPageList((currentPage-1)*Globals.PAGE_SIZE, Globals.PAGE_SIZE);
		PageData<HelpModel> pagedata  =  new PageData<HelpModel>(list , total , currentPage);
		model.addAttribute("pagedata", pagedata);
		return "credit/help/help";
	}
	
	@RequestMapping("/edit{id}")
	public String show(@PathVariable String id , Model model){
		
		HelpModel helpmodel = hbiz.findHelpById(id);
		model.addAttribute("help", helpmodel);
		return "credit/help/helpdetail";
	}
}
