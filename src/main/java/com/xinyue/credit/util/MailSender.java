package com.xinyue.credit.util;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Qualifier;

/**
 * 邮件发送器
 * 
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月10日
 */
public class MailSender {

	@Resource
	@Qualifier("mail.smtp.host")
	protected static String mailServerHost ;
	
	@Resource
	@Qualifier("mail.send.address")
	protected static String sendAddress ;
	
	@Resource
	@Qualifier("mail.send.address")
	protected static String sendUserName ;
	
	@Resource
	@Qualifier("mail.send.password")
	protected static String sendUserPassword ;
	
	@Resource
	@Qualifier("mail.send.auth")
	protected static String authValidate;

	/**
	 * 发送邮件
	 * 
	 * @param receiveAddress
	 *            接收地址
	 * @param theme
	 *            主题
	 * @param mailContent
	 *            内容
	 * @return true:发送成功 false:发送失败
	 */
	public static boolean sendMail(String receiveAddress, String theme,
			String mailContent) {

		// 发送邮件的资源文件
		Properties properties = new Properties();
		properties.put("mail.smtp.host", mailServerHost);
		properties.put("mail.smtp.auth", authValidate);

		try {
			// 创建一个密码验证器
			MailAuthenticator authenticator = new MailAuthenticator(
					sendUserName, sendUserPassword);

			// 根据邮件会话属性和密码验证器构造一个发送邮件的session
			Session mailSession = Session.getDefaultInstance(properties,
					authenticator);

			// 根据session创建一个邮件消息
			MimeMessage mailMessage = new MimeMessage(mailSession);

			// 创建邮件发送者地址
			Address from = new InternetAddress(sendAddress);

			// 设置邮件消息的发送者
			mailMessage.setFrom(from);

			// 创建邮件的接收者地址，并设置到邮件消息中
			Address to = new InternetAddress(receiveAddress);
			mailMessage.setRecipient(Message.RecipientType.TO, to);

			// 设置邮件消息的主题
			mailMessage.setSubject(theme);

			// 设置邮件消息发送的时间
			mailMessage.setSentDate(new Date());

			// mailMessage.setText(mailContent);
			mailMessage.setContent(mailContent, "text/html;charset=utf-8");

			Transport.send(mailMessage);

			return true;
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * 多邮箱同内容
	 * 
	 * @param receiveAddressList
	 * @param theme
	 * @param mailContent
	 * @return
	 */
	public static boolean sendMails(List<String> receiveAddressList,
			String theme, String mailContent) {

		// 发送邮件的资源文件
		Properties properties = new Properties();
		properties.put("mail.smtp.host", mailServerHost);
		properties.put("mail.smtp.auth", authValidate);

		try {
			// 创建一个密码验证器
			MailAuthenticator authenticator = new MailAuthenticator(
					sendUserName, sendUserPassword);

			// 根据邮件会话属性和密码验证器构造一个发送邮件的session
			Session mailSession = Session.getDefaultInstance(properties,
					authenticator);

			// 根据session创建一个邮件消息
			MimeMessage mailMessage = new MimeMessage(mailSession);

			// 创建邮件发送者地址
			Address from = new InternetAddress(sendAddress);

			// 设置邮件消息的发送者
			mailMessage.setFrom(from);

			// 创建邮件的接收者地址，并设置到邮件消息中
			int total = receiveAddressList.size();
			InternetAddress[] addresses = new InternetAddress[total];
			for (int i = 0; i < total; i++) {
				addresses[i] = new InternetAddress(receiveAddressList.get(i));
			}
			mailMessage.setRecipients(RecipientType.TO, addresses);

			// 设置邮件消息的主题
			mailMessage.setSubject(theme);

			// 设置邮件消息发送的时间
			mailMessage.setSentDate(new Date());

			// mailMessage.setText(mailContent);
			mailMessage.setContent(mailContent, "text/html;charset=utf-8");
			Transport.send(mailMessage);

			return true;
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return false;
	}
}
