package com.xinyue.credit.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xinyue.credit.bean.QuestionBean;
import com.xinyue.credit.dao.AnswerDao;
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
 * @下午5:14:13
 */
@Service
public class AnswerServiceImpl implements AnswerService {

	@Resource
	private AnswerDao adao;
	private Logger logger = Logger.getLogger(AnswerServiceImpl.class);
	@Override
	public QuestionBean getMyAnswer(String createid) {
		// TODO Auto-generated method stub
		QuestionBean qb = adao.getMyAnswer(createid);
		int total = qb.getTotal();
		if(total !=0){
			qb.setRate(qb.getPass()/total);
		}
		
		return qb;
	}
	
	@Override
	public QuestionBean getRecentlyAnswer(String createid) {
		// TODO Auto-generated method stub
		return adao.getRecentlyAnswer(createid);
	}
	
	@Override
	public PageData<Question> findXAbsenceAnswer(String topage) {
		// TODO Auto-generated method stub
		int currentPage = Globals.isNull(topage)|| "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage -1)*Globals.PAGE_SIZE;
		PageData<Question> pdata = new PageData<Question>(adao.findXAbsenceAnswer(start, Globals.PAGE_SIZE), adao.getXAbsenceAnswerCount(), currentPage);
		return pdata;
	}

	@Override
	public PageData<Question> findXPossAnswer(String topage) {
		// TODO Auto-generated method stub
		int currentPage = Globals.isNull(topage)|| "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage -1)*Globals.PAGE_SIZE;
		PageData<Question> pdata = new PageData<Question>(adao.findXPossAnswer(start, Globals.PAGE_SIZE), adao.getXPossAnswerCount(), currentPage);
		return pdata;
	}

	@Override
	public PageData<Question> findJAbsenceAnswer(String topage) {
		// TODO Auto-generated method stub
		int currentPage = Globals.isNull(topage)|| "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage -1)*Globals.PAGE_SIZE;
		PageData<Question> pdata = new PageData<Question>(adao.findJAbsenceAnswer(start, Globals.PAGE_SIZE), adao.getJAbsenceAnswerCount(), currentPage);
		return pdata;
	}

	@Override
	public PageData<Question> findJPossAnswer(String topage) {
		// TODO Auto-generated method stub
		int currentPage = Globals.isNull(topage)|| "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage -1)*Globals.PAGE_SIZE;
		PageData<Question> pdata = new PageData<Question>(adao.findJPossAnswer(start, Globals.PAGE_SIZE), adao.getJPossAnswerCount(), currentPage);
		return pdata;
	}

	@Override
	public PageData<Question> findJPassAnswer(String topage) {
		// TODO Auto-generated method stub
		int currentPage = Globals.isNull(topage)|| "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage -1)*Globals.PAGE_SIZE;
		PageData<Question> pdata = new PageData<Question>(adao.findJPassAnswer(start, Globals.PAGE_SIZE), adao.getJPassAnswerCount(), currentPage);
		return pdata;
	}

	@Override
	public PageData<Question> findMyAnswer(String topage, String createid) {
		// TODO Auto-generated method stub
		int currentPage = Globals.isNull(topage)|| "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage -1)*Globals.PAGE_SIZE;
		PageData<Question> pdata = new PageData<Question>(adao.findMyAnswer(createid, start, Globals.PAGE_SIZE)
				, adao.findMyAnswerCount(createid)
				, currentPage);
		return pdata;
	}

	@Override
	public boolean addAnswer(Answer answer) {
		// TODO Auto-generated method stub
		try {
			if("0".equals(answer.getCreateid())){
				answer.setType("n");
			}
			adao.addAnswer(answer);
			logger.info("添加问题回答成功");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("添加问题回答失败" , e);
			return false;
		}
	}
	
	@Override
	public PageData<ShowAnswer> showAnswer(String questid , String topage) {
		// TODO Auto-generated method stub
		int currentPage = Globals.isNull(topage)|| "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage -1)*Globals.PAGE_SIZE;
		
		return new PageData<ShowAnswer>(
				adao.showAnswer(questid , start , Globals.PAGE_SIZE), 
				adao.getShowAnswerCount(questid),
				currentPage
			);
	}
	
	@Override
	public ShowAnswer showZeroAnswer(String questid) {
		// TODO Auto-generated method stub
		return adao.showZeroAnswer(questid);
	}
	
}
