package com.xinyue.credit.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.apache.commons.httpclient.HttpException;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xinyue.credit.service.CommonService;
import com.xinyue.manage.util.CommonFunction;

/**
 * 共通服务层
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月3日
 */
@Service
public class CommonServiceImpl implements CommonService {

	// 短信内容
	private static String strContent = CommonFunction.getValue("sms.content");
	private static String sendUrl = CommonFunction.getValue("sms.send.url");
	private static String account = CommonFunction.getValue("sms.account");
	private static String password = CommonFunction.getValue("sms.password");

	private Logger log = Logger.getLogger(CommonServiceImpl.class);

	@Override
	public boolean sendCodeByPhone(String phone, String code) {
		// 结果
		String result = "";

		String line;

		BufferedReader in = null;

		try {
			// 短信内容说明
			String content = strContent.replace("%", code);

			// 内容编码转换
			String strTemp = URLEncoder.encode(content, "utf-8");

			// url作成
			String strUrl = sendUrl + "?account=" + account + "&password="
					+ password + "&mobile=" + phone + "&content=" + strTemp;

			URL url = new URL(strUrl);

			URLConnection conn = url.openConnection();

			conn.connect();

			in = new BufferedReader(
					new InputStreamReader(conn.getInputStream()));

			// 结果返回
			while ((line = in.readLine()) != null) {
				result += line;
			}
			
			if (!result.equals("100")) {
				log.info("<<<短信验证码发送失败代码-->"+result+">>>");
			}else {
				log.info("<<<短信验证码发送成功代码-->"+result+">>>");
				return true;
			}

		} catch (HttpException e) {
			e.printStackTrace();
			log.error("httpError : " + e.toString());
		} catch (IOException e) {
			e.printStackTrace();
			log.error("IOError : " + e.toString());
		} finally {
			// 释放
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

}
