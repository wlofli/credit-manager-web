package com.xinyue.credit.dao;

import org.apache.ibatis.annotations.Param;

import com.xinyue.credit.model.User;

/**
 * 登录注册DAO
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月6日
 */
public interface LoginDAO {

	public User findUserByPhoneAndPsw(@Param("tel")String tel,@Param("psw")String psw);

	public int saveUser(User user);

	public int checkInvitationCode(String invitationCode);

	public int checkPsw(@Param("tel")String telPhone, @Param("psw")String pswT);

	public int updatePsw(User pswInfo);
}
