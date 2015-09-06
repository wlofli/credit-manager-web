package com.xinyue.credit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.credit.bean.QuestionBean;
import com.xinyue.manage.beans.ShowAnswer;
import com.xinyue.manage.model.Answer;
import com.xinyue.manage.model.Question;

/**
 * 
 * @author wenhai.you
 * @2015年8月6日
 * @下午3:51:19
 */
public interface AnswerDao {

	public QuestionBean getMyAnswer(@Param("createid") String createid);
	
	public QuestionBean getRecentlyAnswer(@Param("createid") String createid);
	
	
	public List<Question> findXAbsenceAnswer(@Param("start")int start , @Param("pageSize")int pageSize);
	public int getXAbsenceAnswerCount();
	
	
	
	public List<Question> findXPossAnswer(@Param("start")int start , @Param("pageSize")int pageSize);
	public int getXPossAnswerCount();
	
	
	public int addAnswer(Answer answer);
	
	
	public List<Question> findJAbsenceAnswer(@Param("start")int start , @Param("pageSize")int pageSize);
	public int getJAbsenceAnswerCount();
	
	
	public List<Question> findJPossAnswer(@Param("start")int start , @Param("pageSize")int pageSize);
	public int getJPossAnswerCount();
	
	
	public List<Question> findJPassAnswer(@Param("start")int start , @Param("pageSize")int pageSize);
	public int getJPassAnswerCount();
	
	
	public List<Question> findMyAnswer(@Param("createid")String createid ,@Param("start")int start , @Param("pageSize")int pageSize);
	public int findMyAnswerCount(@Param("createid")String createid);
	
	
	public List<ShowAnswer> showAnswer(@Param("questid")String questid,@Param("start")int start , @Param("pageSize")int pageSize);
	public int getShowAnswerCount(@Param("questid")String questid);
	
	public ShowAnswer showZeroAnswer(@Param("questid")String questid);
	
}
