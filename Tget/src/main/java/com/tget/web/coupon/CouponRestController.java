package com.tget.web.coupon;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tget.service.coupon.CouponService;
import com.tget.service.coupon.domain.Coupon;
import com.tget.service.user.UserService;

@Controller
@RequestMapping("/coupon/*")
public class CouponRestController {
	
	///Field
	Coupon coupon = new Coupon();
	@Autowired
	@Qualifier("couponServiceImpl")
	private CouponService couponService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
		
	public CouponRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="rest/getCouponList/{userId}", method=RequestMethod.GET )
	public Map<String,Object> getCouponList( @PathVariable("userId") String userId ) throws Exception {
		
		System.out.println("/coupon/rest/getCouponList : GET");
		
		return  couponService.getCouponList(userId);
	}
	
/*	@RequestMapping( value="rest/addCoupon", method=RequestMethod.POST )
	public Map<String,Object> addCoupon(  ) throws Exception {
		
		System.out.println("/coupon/rest/addCouponList : POST");
		
		return  couponService.getCouponList(userId);
	}
	
	*/
	
	
	
	
}