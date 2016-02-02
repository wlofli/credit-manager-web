package com.xinyue.credit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xinyue.credit.model.User;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.beans.PageData;

/**
 * 
 * @author wenhai.you
 * @2015年7月1日
 * @下午2:55:36
 */
@Controller
public class PageController {

	
	@RequestMapping("/page")
	public String page(Model model , HttpServletRequest req){
		String topage = req.getParameter("topage");
		int currentPage = Globals.isNull(topage) || topage.equals("0")?1:Integer.valueOf(topage);
		List<Object> list = new ArrayList<Object>();
		
		PageData<Object> pagedata = new PageData<Object>(list, 100, currentPage);
		model.addAttribute("pageData", pagedata);
		return "credit/page";
	}
	
	
	@RequestMapping("/test")
	public String test(Model model , HttpServletRequest req){
		model.addAttribute("user", new User());
		return "credit/test";
	}
	
	@RequestMapping("/test2")
	public String test2(Model model , HttpServletRequest req){
		model.addAttribute("user", new User());
		return "credit/test2";
	}
}
