package com.xinyue.credit.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.xinyue.credit.model.User;
import com.xinyue.manage.util.CommonFunction;

/**
 * 
 * @author wenhai.you
 * @2015年7月6日
 * @下午1:38:24
 */
public interface UserService {

	public User getUserById(Long id);
	
	public boolean saveUser(User user , String loginName);
	
	public User getCertById(String id);
	
	public boolean saveCert(User user , User u);
	public boolean updateCertImg(User user , User u);
	
	public String upload(MultipartHttpServletRequest multi , String suffix);
	public boolean initialAudit(String id, String loginName);
	public boolean updateAudit(String id , String loginName);
	public final static String TEMP_PATH = (new StringBuffer(CommonFunction.getValue("upload.path")).append("credit/person/temp/")).toString();
	public final static String DOWN_PATH = (new StringBuffer(CommonFunction.getValue("down.path")).append("moko/images/credit/person/temp/")).toString();
	public final static String REAL_PATH = CommonFunction.getValue("upload.path");
	public final static String SHOW_PATH = CommonFunction.getValue("down.path")+"moko/images/";
}
