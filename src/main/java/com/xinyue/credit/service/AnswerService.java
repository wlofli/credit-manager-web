package com.xinyue.credit.service;

import com.xinyue.credit.bean.QuestionBean;
import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.ShowAnswer;
import com.xinyue.manage.model.Answer;
import com.xinyue.manage.model.Question;

/**
 * 
 * @author wenhai.you
 * @2015年8月6日
 * @下午4:36:13
 */
public interface AnswerService {

	public QuestionBean getMyAnswer(String createid);
	
	public QuestionBean getRecentlyAnswer(String createid);
	
	public PageData<Question> findXAbsenceAnswer(String topage);
	
	
	public PageData<Question> findXPossAnswer(String topage);
	
	
	public PageData<Question> findJAbsenceAnswer(String topage);
	
	
	public PageData<Question> findJPossAnswer(String topage);
	
	
	public PageData<Question> findJPassAnswer(String topage);
	
	
	public PageData<Question> findMyAnswer(String topage , String createid);
	
	public boolean addAnswer(Answer answer);
	
	public PageData<ShowAnswer> showAnswer(String questid , String topage);
	public ShowAnswer showZeroAnswer(String questid);
}
