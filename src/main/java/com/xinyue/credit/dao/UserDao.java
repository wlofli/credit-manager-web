package com.xinyue.credit.dao;

import org.apache.ibatis.annotations.Param;

import com.xinyue.credit.model.User;

/**
 * 
 * @author wenhai.you
 * @2015年7月6日
 * @上午11:30:23
 */
public interface UserDao {

	public User getUserById(@Param("id") String id);
	
	public void saveUser(User user);
	//by userid
	public User getCertById(@Param("id") String id);
	
	public void updateCert(User user);
	public void updateCertImg(User uesr);
	public void insertCert(User user);
	public int updateAudit(@Param("id") String id);
	public int initAudit(@Param("id") String id);
	
	/**获取文件路径
	 * add by lzc     date: 2015年11月11日
	 * @param id
	 * @return
	 */
	public User getFilePathByCertId(@Param("id") String id);
}
