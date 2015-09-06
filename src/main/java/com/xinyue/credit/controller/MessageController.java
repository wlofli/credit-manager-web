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

import com.xinyue.credit.bean.MessageInfo;
import com.xinyue.credit.model.Message;
import com.xinyue.credit.model.User;
import com.xinyue.credit.service.MessageService;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.beans.PageData;

/**
 * 
 * @author wenhai.you
 * @2015年7月13日
 * @上午11:00:36
 */
@Controller
@RequestMapping("/credit/messagectr")
public class MessageController {
	
	@Resource
	private MessageService mbiz;
	
	@RequestMapping("/show")
	public String findPage(MessageInfo minfo , Model model , HttpServletRequest req){
		User m = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		minfo.setUserid(m.getId());
		PageData<Message> pdata = mbiz.findPageList(minfo);
		model.addAttribute("mpage", pdata);
		model.addAttribute("minfo", minfo);
		return "credit/account/news";
	}
	
	@RequestMapping(value = "/del" , method={RequestMethod.POST})
	@ResponseBody
	public String del(@RequestBody List<String> list , HttpServletRequest req){
		boolean b = mbiz.delMessage(list);
		if(b){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value = "/updateRead" , method={RequestMethod.POST})
	@ResponseBody
	public String read(@RequestBody List<String> list , HttpServletRequest req){
		
		boolean b = mbiz.updateRead(list);
		if(b){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value = "/detail", method={RequestMethod.POST})
	public String detail(HttpServletRequest req , Model model , MessageInfo minfo){
	
		Message m = mbiz.updateReadById(minfo.getUserid());
		model.addAttribute("message", m);
		model.addAttribute("minfo", minfo);
		return "credit/account/newxq";
	}
	
	@RequestMapping(value = "/find", method={RequestMethod.POST})
	public String find(HttpServletRequest req , Model model , MessageInfo minfo){
	
		Message m = mbiz.updateReadById(minfo.getUserid());
		model.addAttribute("message", m);
		model.addAttribute("minfo", minfo);
		return "credit/account/newxq";
	}
}
