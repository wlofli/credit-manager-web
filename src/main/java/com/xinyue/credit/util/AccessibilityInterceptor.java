package com.xinyue.credit.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 拦截url
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月2日
 */
public class AccessibilityInterceptor implements HandlerInterceptor {

	private Logger log = Logger.getLogger(AccessibilityInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		Object user = request.getSession().getAttribute(Globals.SESSION_USER_INFO);
		
		String redirectUrl = request.getContextPath()+Globals.REDIRECT_URL;
		
		if (user == null) {
			log.info("重定向url："+redirectUrl);
			response.sendRedirect(redirectUrl);
		}else {
			return true;
		}
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	

}
