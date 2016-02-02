package com.xinyue.credit.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.credit.model.User;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.beans.OrderCustomer;
import com.xinyue.manage.beans.OrderInfo;
import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.SearchCustomer;
import com.xinyue.manage.beans.SearchOrderCredit;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.OrderAppointed;
import com.xinyue.manage.model.OrderFixed;
import com.xinyue.manage.model.OrderTrack;
import com.xinyue.manage.service.OrderCustomerService;
import com.xinyue.manage.service.OrderService;
import com.xinyue.manage.service.OrderTrackService;
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
	private OrderTrackService orderTrackService;
	
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
				.getSearchOrderCreditList(GlobalConstant.ORDER_STATUS, GlobalConstant.ORDER_CONDITION, user.getId());
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
		JSONObject jsonObject = new JSONObject();
		try {
			if(orderCustomerService.saveOrderFixed(fixId, user.getId(), user.getId())){
				jsonObject.accumulate(GlobalConstant.RET_JSON_RESULT, GlobalConstant.RET_SUCCESS);
			}else {
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			jsonObject.accumulate(GlobalConstant.RET_JSON_RESULT, GlobalConstant.RET_FAIL);
			jsonObject.accumulate(GlobalConstant.RET_MESSAGE, "领取失败,请联系管理员");
		}
		return jsonObject.toString();
	}
	
	
	@RequestMapping("buyappointed")
	@ResponseBody
	public String buyAppointed(String appointId, HttpSession session){
		User user = (User)session.getAttribute(Globals.SESSION_USER_INFO);
		JSONObject jsonObject = new JSONObject();
		try {
			if(orderCustomerService.saveOrderAppointed(appointId, user.getId(), user.getId())){
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
	
	
	
	@RequestMapping("mycustomer")
	public String myCustomer(@RequestParam(defaultValue="1")int topage, @ModelAttribute("searchCustomer")SearchCustomer searchCustomer, 
			HttpSession session, Model model){
		User user = (User) session.getAttribute(Globals.SESSION_USER_INFO);
		List<SelectInfo> productList = selectService.getProductList();
		model.addAttribute("productList", productList);
		
		List<SelectInfo> orderTypeList = selectService.findSelectByType(GlobalConstant.ORDER_TYPE);
		model.addAttribute("ordertypelist", orderTypeList);
		
		
		List<SearchOrderCredit> orderStatusList = orderCustomerService
				.getMyCustomerSearchOrderCreditList(GlobalConstant.ORDER_STATUS, GlobalConstant.ORDER_CONDITION, user.getId());
		model.addAttribute("orderStatusList", orderStatusList);
		
		
		
		List<OrderCustomer> orderCustomers = orderCustomerService
				.getMyCustomer(searchCustomer,user.getId(),GlobalConstant.PAGE_SIZE * (topage - 1), GlobalConstant.PAGE_SIZE);
		int countall = orderCustomerService.countMyCustomer(searchCustomer,user.getId());
		PageData<OrderCustomer> page = new PageData<OrderCustomer>(orderCustomers, countall, topage);
		model.addAttribute("page", page);
		return "credit/customer/mycustomer";
	}
	
	/**
	 * add by lzc     date: 2015年9月1日
	 * @param id->customerid
	 * @param type->orderType
	 * @param model
	 * @return
	 */
	@RequestMapping("customer/track")
	public String customerTrack(String id, String type, Model model){
		
		OrderInfo info = orderTrackService.getOrderInfo(id, type);
		
		//目前不需要分页展示
		List<OrderTrack> tracklList = orderTrackService.getOrderTrackList(info.getId(), info.getType(),0 ,0);
		
		
		List<SelectInfo> statusList = selectService.findSelectByTypePart(GlobalConstant.ORDER_STATUS, GlobalConstant.ORDER_CONDITION);
		model.addAttribute("statuslist", statusList);
		model.addAttribute("order", info);
		model.addAttribute("tracklist", tracklList);
		
		return "credit/customer/customerTrack";
	}
	
	@ResponseBody
	@RequestMapping("cusomer/addtrack")
	public String addTrack(OrderTrack orderTrack,HttpSession session){
		User user = (User) session.getAttribute(Globals.SESSION_USER_INFO);
		try {
			orderTrack.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			orderTrack.setCreatedId(user.getId());
			orderTrackService.addOrderTrack(orderTrack, user.getRealName());
		} catch (Exception e) {
			// TODO: handle exception
			return GlobalConstant.RET_FAIL;
		}
		return GlobalConstant.RET_SUCCESS;
	}
	
}
