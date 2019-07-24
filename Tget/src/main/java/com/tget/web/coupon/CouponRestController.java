package com.tget.web.coupon;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tget.service.coupon.CouponService;
import com.tget.service.coupon.domain.Coupon;
import com.tget.service.user.domain.User;

@Controller
@RequestMapping("/coupon/*")
public class CouponRestController {
	
	///Field
	Coupon coupon = new Coupon();
	@Autowired
	@Qualifier("couponServiceImpl")
	private CouponService couponService;
	
		
	public CouponRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="rest/getCouponList/{userId}", method=RequestMethod.GET )
	public Map<String,Object> getCouponList( @PathVariable("userId") String userId ) throws Exception {
		
		System.out.println("/user/rest/getCoupon : GET");
		
		return  couponService.getCouponList(userId);
	}
	
	
	
	
	
	
	
	
}