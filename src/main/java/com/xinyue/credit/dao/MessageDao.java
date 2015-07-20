package com.xinyue.credit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.credit.bean.MessageInfo;
import com.xinyue.credit.model.Message;


/**
 * 
 * @author wenhai.you
 * @2015年7月13日
 * @上午10:43:20
 */
public interface MessageDao{

	public List<Message> findPageList(MessageInfo minfo);
	
	public int getCount(MessageInfo minfo);
	
	public int delMessage(@Param("list") List<String> list);
	
	public int updateReads(@Param("list") List<String> list);
	
	public Message getMessageById(String id);
	
	public List<Message> getReadById(MessageInfo minfo);
}
