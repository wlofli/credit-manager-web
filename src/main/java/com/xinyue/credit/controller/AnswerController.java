package com.xinyue.credit.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.credit.bean.QuestionBean;
import com.xinyue.credit.model.User;
import com.xinyue.credit.service.AnswerService;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.ShowAnswer;
import com.xinyue.manage.model.Answer;
import com.xinyue.manage.model.Question;

/**
 * 
 * @author wenhai.you
 * @2015年8月6日
 * @下午6:44:00
 */
@Controller
@RequestMapping("/credit/answerctr")
public class AnswerController {

	@Resource
	private AnswerService abiz;
	
	@RequestMapping("/xterrace")
	public String xterrace(Model model , HttpServletRequest req) {
		String index  = req.getParameter("index");
		User user = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		String createid = user.getId();
		if(Globals.isNull(index)){			
			QuestionBean myanswer = abiz.getMyAnswer(createid);
			QuestionBean recentanswer = abiz.getRecentlyAnswer(createid);
			req.getSession().setAttribute("myanswer", myanswer);
			req.getSession().setAttribute("recentanswer", recentanswer);
		}
		model.addAttribute("answer", new Answer(createid));
		PageData<Question> absence = abiz.findXAbsenceAnswer(req.getParameter("topage"));
		model.addAttribute("absence", absence);
		return "credit/answer/xterrace";
	}
	
	@RequestMapping("/addAnswer")
	@ResponseBody
	public String answer(Answer answer){
		boolean b = abiz.addAnswer(answer);
		if(b){
			return "success";
		}else{
			return "fail";
		}
		
	}
	
	@RequestMapping("/xposs")
	public String xposs(Model model , HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		String index  = req.getParameter("index");
		String createid = user.getId();
		if(Globals.isNull(index)){
			QuestionBean myanswer = abiz.getMyAnswer(createid);
			QuestionBean recentanswer = abiz.getRecentlyAnswer(createid);
			req.getSession().setAttribute("myanswer", myanswer);
			req.getSession().setAttribute("recentanswer", recentanswer);
			
		}
		model.addAttribute("answer", new Answer(createid));
		PageData<Question> poss = abiz.findXPossAnswer(req.getParameter("topage"));
		model.addAttribute("poss", poss);
		return "credit/answer/xposs";
	}
	
	
	@RequestMapping("/jterrace")
	public String jterrace(Model model , HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		String createid = user.getId();
		model.addAttribute("answer", new Answer(createid));
		String index  = req.getParameter("index");
		if(Globals.isNull(index)){
			QuestionBean myanswer = abiz.getMyAnswer(createid);
			QuestionBean recentanswer = abiz.getRecentlyAnswer(createid);
			req.getSession().setAttribute("myanswer", myanswer);
			req.getSession().setAttribute("recentanswer", recentanswer);
			
		}
		String tag = req.getParameter("tag");
		if(Globals.isNull(tag) || "1".equals(tag)){
			PageData<Question> absence = abiz.findJAbsenceAnswer(req.getParameter("topage"));
			model.addAttribute("absence", absence);
			tag = "1";
		}else if("2".equals(tag)){
			PageData<Question> poss = abiz.findJPossAnswer(req.getParameter("topage"));
			model.addAttribute("poss", poss);
		}else{
			PageData<Question> pass = abiz.findJPassAnswer(req.getParameter("topage"));
			model.addAttribute("pass", pass);
		}
		model.addAttribute("tag", tag);
		return "credit/answer/jterrace";
	}
	
	
	@RequestMapping("/myanswer")
	public String myanswer(Model model , HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
		PageData<Question> myanswer = abiz.findMyAnswer(req.getParameter("topage"), user.getId());
		model.addAttribute("myanswer", myanswer);
		return "credit/answer/myanswer";
	}
	
	@RequestMapping("/showAnswer")
	public String showAnswer(Model model , HttpServletRequest req , Answer answer){
		
		
		if(Globals.isNull(answer.getCreateid())){
			User user = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
			answer =  new Answer(user.getId());
		}
		model.addAttribute("answer",answer);
		
		String questid = req.getParameter("questid");
		PageData<ShowAnswer> pdata = abiz.showAnswer(questid, req.getParameter("topage"));
		
		model.addAttribute("pageanswer", pdata);
		model.addAttribute("question", pdata.getData().get(0));
		String index  = req.getParameter("index");
		if("1".equals(index)){
			return "credit/answer/xanswer";
		}else if("2".equals(index)){
			return "credit/answer/janswer";
		}else{
			return "credit/answer/showanswer";
		}

	}
	
	@RequestMapping("/showZeroAnswer")
	public String showZeroAnswer(Model model , HttpServletRequest req , Answer answer){
		
		
		if(Globals.isNull(answer.getCreateid())){
			User user = (User)req.getSession().getAttribute(Globals.SESSION_USER_INFO);
			answer =  new Answer(user.getId());
		}
		model.addAttribute("answer",answer);
		
		String questid = req.getParameter("questid");		
		model.addAttribute("question", abiz.showZeroAnswer(questid));
		String index  = req.getParameter("index");
		if("1".equals(index)){
			return "credit/answer/xzeroanswer";
		}else{
			return "credit/answer/jzeroanswer";
		}

	}
}
