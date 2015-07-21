package com.xinyue.credit.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xinyue.credit.bean.MessageInfo;
import com.xinyue.credit.dao.MessageDao;
import com.xinyue.credit.model.Message;
import com.xinyue.credit.model.PageData;
import com.xinyue.credit.service.MessageService;
import com.xinyue.credit.util.Globals;

/**
 * 
 * @author wenhai.you
 * @2015年7月13日
 * @上午10:54:41
 */
@Service
public class MessageServiceImpl implements MessageService {

	@Resource
	private MessageDao mdao;
	private Logger logger = Logger.getLogger(MessageServiceImpl.class);
	@Override
	public PageData<Message> findPageList(MessageInfo minfo) {
		// TODO Auto-generated method stub
		String topage = minfo.getTopage();
		topage = Globals.isNull(topage) || topage.equals("0")?"1":topage;
		minfo.setTopage(topage);
		int currentPage = Integer.valueOf(topage);
		minfo.setStart((currentPage-1)*Globals.PAGE_SIZE);
		//PageData<Message> pdata = new PageData<Message>(mdao.findPageList(minfo), mdao.getCount(minfo), Integer.valueOf(topage));
		return new PageData<Message>(mdao.findPageList(minfo), mdao.getCount(minfo), currentPage);
	}

	@Override
	public Message updateReadById(String id) {
		// TODO Auto-generated method stub
		try {
			Message m = mdao.getMessageById(id);
			if(m.getHasRead().equals("0")){
				List<String> list = new ArrayList<String>();
				list.add(id);
				mdao.updateReads(list);
			}
			logger.info("修改信息已阅读成功");
			return m;
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("修改信息已阅读失败");
			return null;
		}
	}
	
	@Override
	public List<Message> updateReadByMessageInfo(MessageInfo minfo) {
		// TODO Auto-generated method stub
		return mdao.getReadById(minfo);
	}
	
	@Override
	public int getCount(MessageInfo minfo) {
		// TODO Auto-generated method stub
		return mdao.getCount(minfo);
	}
	
	@Override
	public boolean delMessage(List<String> list) {
		// TODO Auto-generated method stub
		try {
			mdao.delMessage(list);
			logger.info("删除信息成功");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("删除信息失败", e);
			return false;
		}
	}
		
	@Override
	public boolean updateRead(List<String> list) {
		// TODO Auto-generated method stub
		try {
			mdao.updateReads(list);
			logger.info("标记已读成功");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("标记已读失败", e);
			return false;
		}
	}
}
