package com.tget.web.coupon;

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
	
	@RequestMapping( value="getCoupon", method=RequestMethod.GET )
	public String getCoupon( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getCoupon : GET");
		//Business Logic
		Coupon coupon = couponService.getCoupon(userId);
		// Model �� View ����
		model.addAttribute("coupon", coupon);
		
		return "forward:/coupon/getCoupon.jsp";
	}
	
	
	
	
	
	
	
}