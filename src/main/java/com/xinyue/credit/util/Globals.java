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
	
	//add by lzc
	public static final String REDIRECT = "/home/redirect";
	
	public static final String SESSION_PHONE_CODE = "session_phone_code";
	
	//add by maozj start
	public static final String STAR_LEVEL = "star_level";
	//add by maozj end
	
	public static final int PAGE_SIZE = 10;
	
	public static boolean isNull(Object obj){
		return obj == null || obj.toString().trim().equals("");
	}
	
	//add by lzc  信贷前台->账户管理->资金管理
	public static final String FUND_TYPE = "fundtype";
	public static final String FUND_TYPE_DETAIL = "1";
	public static final String FUND_TYPE_CONSUMPTION = "2";
	public static final String FUND_TYPE_RECHARGE = "3";
	public static final String FUND_TYPE_REWARD = "4";
	public static final String FUND_TYPE_WITHDRAW = "5";
	
	
}
