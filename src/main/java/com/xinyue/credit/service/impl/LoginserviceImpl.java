package com.xinyue.credit.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xinyue.credit.dao.LoginDAO;
import com.xinyue.credit.model.User;
import com.xinyue.credit.service.LoginService;
import com.xinyue.credit.util.SecurityUtils;

/**
 * 登录相关服务层
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月1日
 */
@Service
public class LoginserviceImpl implements LoginService {

	@Resource
	private LoginDAO loginDAO;
	
	private Logger log = Logger.getLogger(LoginserviceImpl.class);
	
	@Override
	public User checkUser(User user) {
		
		try {
			//MD5转换
			user.setPassword(SecurityUtils.makeMD5(user.getPassword()));
			
			User result = loginDAO.findUserByPhoneAndPsw(user.getTelPhone(), user.getPassword());
			
			return result;
		} catch (Exception e) {
			log.error(e.getMessage());
			return null;
		}
	}

	@Override
	public boolean saveUser(User user) {
		
		try {
			//MD5转换
			user.setPassword(SecurityUtils.makeMD5(user.getPassword()));
			
			while (true) {
				//邀请码生成
				String invitationCode = SecurityUtils.randomStr(6);
				
				int checkResult=loginDAO.checkInvitationCode(invitationCode);
				
				if (checkResult == 0) {
					user.setInvitationCode(invitationCode);
					break;
				}
			}
			
			if (user.getCity().equals("")) {
				user.setLocation(user.getProvince());
			} else {
				user.setLocation(user.getCity());
			}
			
			int result = loginDAO.saveUser(user);
			
			if (result > 0) {
				return true;
			}
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		return false;
	}

	@Override
	public int checkPsw(String telPhone, String password) {
		
		int result = 0;
		try {
			String pswT = SecurityUtils.makeMD5(password);
			
			result = loginDAO.checkPsw(telPhone,pswT);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return result;
	}

	@Override
	public boolean updatePsw(User pswInfo) {

		try {
			pswInfo.setPasswordConfirm(SecurityUtils.makeMD5(pswInfo.getPasswordConfirm()));
			
			int result = loginDAO.updatePsw(pswInfo);
			
			if (result > 0) {
				log.info("密码修改成功！");
				return true;
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return false;
	}

}
