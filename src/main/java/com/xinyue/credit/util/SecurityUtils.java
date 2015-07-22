/*
 * 杭州摩科商用设备有限公司
 * MOKO-Commercial Device Co.,Ltd
 * 
 * 新越网
 * 
 * 创建人：茅
 * 
 * 日期：2014/8/28
 * 
 * 版本v1.0.0
 * 
 */
package com.xinyue.credit.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class SecurityUtils {

	/**
	 * MD5检验
	 * @param temp 检验串
	 * @return
	 */
	public static String makeMD5(String temp) {

		String result = "";

		try {
			// 获得MD5摘要算法的 MessageDigest 对象
			MessageDigest md = MessageDigest.getInstance("MD5");

			// 使用指定的字节更新摘要
			md.update(temp.getBytes());

			// 获得密文
			byte[] b = md.digest();

			StringBuffer buf = new StringBuffer("");

			int k = 0;

			// 获取检验结果
			for (int j = 0; j < b.length; j++) {
				k = b[j];

				if (k < 0) {
					k += 256;
				}
				if (k < 16) {
					buf.append("0");
				}
				
				buf.append(Integer.toHexString(k));
			}

			result = buf.toString();

		} catch (NoSuchAlgorithmException e) {
			e.getStackTrace();
			result = "error";
		}

		return result;
	}
	
	/**
	 * 产生随机数
	 * @param bits 位数
	 * @return 随机数
	 */
	public static String randomStr(int bits) {
		
		String result = "";
		try {
			result = "";
			
			Random random = new Random();
			
			char[] numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz").toCharArray();
			
			char[] randBuffer = new char[bits];
			
			for (int i = 0; i < randBuffer.length; i++) {
				randBuffer[i] = numbersAndLetters[random.nextInt(36)];
			}
			result = new String(randBuffer);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
