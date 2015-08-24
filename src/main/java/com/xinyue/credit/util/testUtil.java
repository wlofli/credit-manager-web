package com.xinyue.credit.util;

import java.lang.reflect.Method;

import javax.servlet.ServletContextListener;

import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.stereotype.Component;

/**
 * author lzc
 * 2015年7月21日上午8:41:47
 */
@Component
public class testUtil implements MethodBeforeAdvice{

	@Override
	public void before(Method method, Object[] args, Object target)
			throws Throwable {
		// TODO Auto-generated method stub
		System.err.println(method);
	}
}
