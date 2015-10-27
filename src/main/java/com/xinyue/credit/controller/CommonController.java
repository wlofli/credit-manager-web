package com.xinyue.credit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.credit.util.Globals;
import com.xinyue.credit.util.SecurityUtils;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.service.CityService;
import com.xinyue.manage.service.CommonService;
import com.xinyue.manage.util.GlobalConstant;

/**ywh 2015-10-16将commonService 移动到common下
 * 共通方法 
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月3日
 */
@Controller
public class CommonController {

	@Resource
	private CommonService commonService;
	
	@Resource
	private CityService cityService;
	
	private Logger log = Logger.getLogger(CommonController.class);
	
	/**
	 * 发送手机验证码
	 * @param request
	 * @param phone
	 * @return true;false
	 */
	@RequestMapping(value="/send/tel/code",method=RequestMethod.POST)
	public @ResponseBody String sendPhoneCode(HttpServletRequest request,String phone) {
		
		String code = SecurityUtils.randomStr(4);
		
		boolean result = commonService.sendCodeByPhone(phone,code);
		
		if (result) {
			log.info("验证码发送成功---手机号："+phone+"；验证码："+code);
			request.getSession().setAttribute(Globals.SESSION_PHONE_CODE, code);
			return "true";
		}else {
			log.info("验证码发送失败!!!---手机号："+phone+"；验证码："+code);
			return "false";
		}
		
	}
	
	@RequestMapping(value={"/get/cities","/get/zones"})
	public @ResponseBody List<SelectInfo> getCitiesOrZones(String id,String type) {
		
		if (type.equals(GlobalConstant.TYPE_CITY)) {
			List<SelectInfo> cities = cityService.getCitiesByProvinceId(id);
			
			return cities;
		}else if (type.equals(GlobalConstant.TYPE_ZONE)) {
			List<SelectInfo> zones = cityService.getZonesByCityId(id);
			
			return zones;
		}
		return null;
	}
}
