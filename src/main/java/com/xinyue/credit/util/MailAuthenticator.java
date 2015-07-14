package com.xinyue.credit.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 服务器邮箱登录验证
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月10日
 */
public class MailAuthenticator extends Authenticator {

	protected String userName = null;
	
	protected String userpassword = null;
	
	public MailAuthenticator(String userName,String userPsw){
		this.userName = userName;
		this.userpassword = userPsw;
	}
	
	
	/* (non-Javadoc)
	 * @see javax.mail.Authenticator#getPasswordAuthentication()
	 */
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(userName, userpassword);
	}

}
