package com.xinyue.credit.util;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

/**
 * author lzc2015年7月28日下午4:35:27
 */
public class testFilter  extends OncePerRequestFilter{

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
//		System.out.println(request.getServletPath());
		if(!request.getServletPath().startsWith("/images") 
				&& !request.getServletPath().startsWith("/js"  ) 
				&& !request.getServletPath().startsWith( "/html" ) 
				&& !request.getServletPath().startsWith(  "/errors " ) 
				&&!request.getServletPath().startsWith( "/favicon" ) 
				&& !request.getServletPath().startsWith("/css")
				){
			System.err.println("uri=" + uri);
		}
		
		
		filterChain.doFilter(request, response);
		
	}

}
