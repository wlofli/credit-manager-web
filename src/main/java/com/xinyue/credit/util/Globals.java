package com.xinyue.credit.util;
/**
 * 
 * @author wenhai.you
 * @2015年6月30日
 * @上午10:46:42
 */
public class Globals {

	public static final String SESSION_USER_INFO="user_info";
	
	public static final String LOGIN_CHECK_CODE = "login_code";
	
	public static final String REDIRECT_URL = "/errors/redirect.html";
	
	public static final String SESSION_PHONE_CODE = "session_phone_code";
	
	//add by maozj start
	public static final String STAR_LEVEL = "star_level";
	//add by maozj end
	
	public static final int PAGE_SIZE = 10;
	
	public static boolean isNull(Object obj){
		return obj == null || obj.toString().trim().equals("");
	}
	
}
