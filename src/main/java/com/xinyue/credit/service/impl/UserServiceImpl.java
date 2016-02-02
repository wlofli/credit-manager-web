package com.xinyue.credit.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Iterator;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.xinyue.credit.dao.UserDao;
import com.xinyue.credit.model.User;
import com.xinyue.credit.service.UserService;
import com.xinyue.credit.util.Globals;

/**
 * 
 * @author wenhai.you
 * @2015年7月6日
 * @下午1:38:52
 */
@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao udao;
	
	private Logger logger = Logger.getLogger(UserServiceImpl.class);
	@Override
	public User getUserById(String id) {
		// TODO Auto-generated method stub
		User user =  udao.getUserById(id);
//		String location = user.getLocation();
//		user.setProvince(new StringBuffer(location.substring(0, 2)).append("0000").toString());
//		user.setCity(location);
//		user.setCitys(user.getCity());
		return user;
	}
	
	@Override
	public boolean saveUser(User user , String loginName) {
		// TODO Auto-generated method stub
		try {
			if(!Globals.isNull(user.getTel())){
				user.setTelPhone(user.getTel());
			}
			
//			user.setLocation(user.getCity());
			udao.saveUser(user);
			
			logger.info("用户信息修改成功  修改者为:"+loginName);
			return true;
		} catch (Exception e) {
			logger.error("用户信息修改失败 修改者为:"+loginName , e);
			return false;
		}
	}
	
	@Override
	public User getCertById(String id) {
		// TODO Auto-generated method stub
		User u =  udao.getCertById(id);
		if(!Globals.isNull(u)){
			u.setCitys(u.getCity());
		}
		return u;
	}
	
	@Override
	public boolean saveCert(User user , User u) {
		// TODO Auto-generated method stub
		String loginName = u.getTelPhone();
		try {
			if(Globals.isNull(user.getId())){
				user.setUserid(u.getId());
				udao.insertCert(user);
				logger.info("实名认证信息添加成功 , 添加者为:"+loginName);
			}else{
				udao.updateCert(user);
				logger.info("实名认证信息修改成功 , 修改者为:"+loginName);
			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			if(Globals.isNull(user.getId())){
				logger.error("实名认证信息添加失败 , 添加者为:"+loginName, e);
			}else{
				logger.error("实名认证信息修改失败 , 修改者为:"+loginName, e);
			}
			
			return false;
		}
	}
	private void move(String dir , String img){
		String tempcard = TEMP_PATH + img;
		String dirs = new StringBuffer(REAL_PATH).append("credit/person/").append(dir).toString();
		String realcard = dirs + img;
		File pathFile = new File(dirs);
		if (!pathFile.exists()) {
			pathFile.mkdirs();
		}
		System.out.println("tempcard = " + tempcard);
		System.out.println("realcard = " + realcard);
		File tempFile =  new File(tempcard);
		File realFile =  new File(realcard);
		
		try {
			FileCopyUtils.copy(tempFile, realFile);
		} catch (IOException e) {
			logger.error("移动图片失败 图片目录为:"+realcard ,e);
			e.printStackTrace();
		}
	}
	@Override
	public boolean updateCertImg(User user, User u) {
		// TODO Auto-generated method stub
		String loginName = u.getTelPhone();
		try {
			//modified by lzc   增加了判空标志
			String card = user.getCardImgPath();
			if(!card.isEmpty()){
				move("card/" , card);
			}
			String head = user.getHeadImgPath();
			if(!head.isEmpty()){
				move("head/" , head);
			}
			String work = user.getWorkImgPath();
			if(!work.isEmpty()){
				move("work/" , work);
			}
			udao.updateCertImg(user);
			logger.info("上传认证信息修改成功 , 修改者为:"+loginName);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("上传认证信息修改失败 , 修改者为:"+loginName, e);
			return false;
		}
	}
	
	public String upload(MultipartHttpServletRequest multi , String suffix){
		File dir = new File(TEMP_PATH);
		if(!dir.exists()){
			dir.mkdirs();
		}
		Iterator<String>  iter = multi.getFileNames();
		while(iter.hasNext()){
			MultipartFile file = multi.getFile(iter.next());
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssms");
			String code = new StringBuffer(df.format(new java.sql.Timestamp(System.currentTimeMillis()))).toString();
			String fileName = new StringBuffer(code).append(".").append(suffix).toString();
			
			File uploadFile = new File(TEMP_PATH+fileName);
			
			try {
				FileCopyUtils.copy(file.getBytes(), uploadFile);
				String path = DOWN_PATH+fileName;
				return "{'name':'"+fileName+"','path':'"+_filterStr(path)+"'}";
			} catch (Exception e) {
				// TODO: handle exception
				logger.error("上传广告图片失败", e);
				return "fail";
			}
				
		}
		return "fail";
	}
	private String _filterStr(String s) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {

			char c = s.charAt(i);
			switch (c) {
			case '\"':
				sb.append("\\\"");
				break;
			case '\\':
				sb.append("\\\\");
				break;
			case '/':
				sb.append("\\/");
				break;
			case '\b':
				sb.append("\\b");
				break;
			case '\f':
				sb.append("\\f");
				break;
			case '\n':
				sb.append("\\n");
				break;
			case '\r':
				sb.append("\\r");
				break;
			case '\t':
				sb.append("\\t");
				break;
			default:
				sb.append(c);
			}
		}
		return sb.toString();
	}
	
	@Override
	public boolean updateAudit(String id, String loginName) {
		// TODO Auto-generated method stub
		try {
			//add by lzc 添加文件检查机制
			if (!isFullOfFile(id)) {
				logger.info("用户文件未提交完全");
				return false;
			}
			int s = udao.updateAudit(id);
			if(s == 1){
				logger.info("提交审核成功 ,提交者:"+loginName);
				return true;
			}
			logger.info("提交审核失败 无数据 ,提交者:"+loginName);
			return false;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.info("提交审核失败 ,提交者:"+loginName);
			return false;
		}
	}
	
	@Override
	public boolean initialAudit(String id, String loginName) {
		// TODO Auto-generated method stub
		try {
			int s = udao.initAudit(id);
			if(s == 1){
				logger.info("修改审核状态成功 ,提交者:"+loginName);
				return true;
			}
			logger.info("修改审核状态失败 无数据 ,提交者:"+loginName);
			return false;
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("修改审核状态失败 ,提交者:"+loginName);
			return false;
		}
	}
	
	/**检查用户文件是否齐全
	 * add by lzc     date: 2015年11月11日
	 * @param id
	 * @return
	 */
	private boolean isFullOfFile(String id){
		User user = udao.getFilePathByCertId(id);
		if(user == null) return false;
		if (user.getHeadImgPath().isEmpty() || user.getCardImgPath().trim().isEmpty() || user.getWorkImgPath().isEmpty()) {
			return false;
		}
		return true;
		
	}
}
