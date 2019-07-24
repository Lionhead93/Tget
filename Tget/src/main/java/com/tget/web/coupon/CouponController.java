package com.tget.web.coupon;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tget.service.coupon.CouponService;
import com.tget.service.coupon.domain.Coupon;

@Controller
@RequestMapping("/coupon/*")
public class CouponController {
	
	///Field
	Coupon coupon = new Coupon();
	@Autowired
	@Qualifier("couponServiceImpl")
	private CouponService couponService;
	
		
	public CouponController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="getCouponList", method=RequestMethod.GET )
	public String getCouponList( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getCoupon : GET");
		//Business Logic
		Map<String, Object> map = couponService.getCouponList(userId);
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		
		return "forward:/coupon/getCouponList.jsp";
	}
	
	
	
	
	
	
	
}