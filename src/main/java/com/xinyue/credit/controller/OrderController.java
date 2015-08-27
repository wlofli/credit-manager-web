package com.xinyue.credit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.credit.model.PageData;
import com.xinyue.credit.model.User;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.beans.SearchCustomer;
import com.xinyue.manage.beans.SearchOrderCredit;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.OrderAppointed;
import com.xinyue.manage.model.OrderFixed;
import com.xinyue.manage.service.OrderCustomerService;
import com.xinyue.manage.service.OrderService;
import com.xinyue.manage.service.ProductService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.GlobalConstant;

/**
 * author lzc
 */
@Controller
@RequestMapping("order")
public class OrderController {
	@Resource
	private OrderCustomerService orderCustomerService;
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private SelectService selectService;
	
	@Resource
	private ProductService productService;
	
	@RequestMapping("fixlist")
	public String fixList(@RequestParam(defaultValue="1")int topage, @ModelAttribute("searchCustomer")SearchCustomer searchCustomer, Model model){
		List<OrderFixed> orderFixeds = orderCustomerService.getOrderFixedByPage(searchCustomer, (topage-1) * GlobalConstant.PAGE_SIZE, 
				GlobalConstant.PAGE_SIZE);
		List<SelectInfo> collaterals = selectService.findSelectByType(GlobalConstant.CUSTOMER_COLLERTAOR);
		model.addAttribute("collateralList", collaterals);
		List<SelectInfo> creditList = selectService.findSelectByType(GlobalConstant.CUSTOMER_CREDIT);
		model.addAttribute("creditList", creditList);
		
		int countAll = orderCustomerService.countOrderFixedByPage(searchCustomer);
		
		PageData<OrderFixed> page = new PageData<OrderFixed>(orderFixeds, countAll, topage);
		model.addAttribute("page", page);
		
		return "credit/orderCustomer/fixed";
	}
	
	
	@RequestMapping("appointlist")
	public String appointList(@RequestParam(defaultValue="1")int topage, @ModelAttribute("searchCustomer")SearchCustomer searchCustomer,
			Model model, HttpSession session){
		User user = (User)session.getAttribute(Globals.SESSION_USER_INFO);
		List<OrderAppointed> orderAppointeds = orderCustomerService.getOrderAppointedByPage(searchCustomer, (topage - 1) *GlobalConstant.PAGE_SIZE, 
				GlobalConstant.PAGE_SIZE, user.getId());
		
		List<SelectInfo> productList = selectService.getProductList();
		model.addAttribute("productList", productList);
		
		
		List<SearchOrderCredit> orderStatusList = orderCustomerService
				.getSearchOrderCreditList(GlobalConstant.ORDER_STATUS, GlobalConstant.ORDER_CONDITION);
		model.addAttribute("orderStatusList", orderStatusList);
		int countAll = orderCustomerService.countOrderAppointedByPage(searchCustomer, user.getId());
		PageData<OrderAppointed> page = new PageData<OrderAppointed>(orderAppointeds, countAll, topage);
		model.addAttribute("page", page);
		return "credit/orderCustomer/appointed";
	}
	
	
	@RequestMapping("buyfixed")
	@ResponseBody
	public String buyFixed(String fixId ,HttpSession session){
		User user = (User)session.getAttribute(Globals.SESSION_USER_INFO);
System.out.println(user.getId());
		JSONObject jsonObject = new JSONObject();
		try {
			if(orderCustomerService.saveOrderFixed(fixId, user.getId(), user.getId())){
				jsonObject.accumulate(GlobalConstant.RET_JSON_RESULT, GlobalConstant.RET_SUCCESS);
			}else {
				jsonObject.accumulate(GlobalConstant.RET_JSON_RESULT, GlobalConstant.RET_FAIL);
				jsonObject.accumulate(GlobalConstant.RET_MESSAGE, "余额不足");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			jsonObject.accumulate(GlobalConstant.RET_JSON_RESULT, GlobalConstant.RET_FAIL);
			jsonObject.accumulate(GlobalConstant.RET_MESSAGE, "领取失败,请联系管理员");
		}
		return jsonObject.toString();
	}
	
}
