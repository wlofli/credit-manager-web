package com.xinyue.credit.service;

import java.util.List;

import com.xinyue.credit.bean.MessageInfo;
import com.xinyue.credit.model.Message;
import com.xinyue.manage.beans.PageData;

/**
 * 
 * @author wenhai.you
 * @2015年7月13日
 * @上午10:46:04
 */
public interface MessageService {

	public PageData<Message> findPageList(MessageInfo minfo);
	
	public int getCount(MessageInfo minfo);
	
	public boolean delMessage(List<String> list);
	
	public boolean updateRead(List<String> list);
	
	public Message updateReadById(String id);
	
	public List<Message> updateReadByMessageInfo(MessageInfo minfo);
}
