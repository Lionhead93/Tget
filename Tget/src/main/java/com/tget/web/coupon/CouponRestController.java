package com.tget.web.coupon;

import java.util.HashMap;
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

import com.tget.common.domain.Search;
import com.tget.service.coupon.CouponService;
import com.tget.service.coupon.domain.Coupon;
import com.tget.service.user.UserService;
import com.tget.service.user.domain.User;

@Controller
@RequestMapping("/coupon/*")
public class CouponRestController {
	
	@Autowired
	@Qualifier("couponServiceImpl")
	private CouponService couponService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
		
	public CouponRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="rest/addCoupon/{userId}", method=RequestMethod.GET )
	public Map<String,Object> addCoupon( @PathVariable("userId") String userId ) throws Exception {
		
		System.out.println("/coupon/rest/getCouponList : GET");
		
		Coupon coupon = new Coupon();
		coupon.setCouponCode("1");
		coupon.setUserId(userId);
		couponService.addCoupon(coupon);
		
		coupon.setCouponCode("0");
		couponService.addCoupon(coupon);		
		
		return new HashMap<String, Object>();
	}
	
	@RequestMapping( value="rest/getCouponList/{userId}", method=RequestMethod.GET )
	public Map<String,Object> getCouponList( @PathVariable("userId") String userId ) throws Exception {
		
		System.out.println("/coupon/rest/getCouponList : GET");
		
		return  couponService.getCouponList(userId);
	}
	@RequestMapping( value="rest/getCouponUserList/", method=RequestMethod.GET )
	public Map<String,Object> getCouponUserList() throws Exception {
		
		System.out.println("/coupon/rest/getCouponUserList : GET");
		
		Search search = new Search();					
		
		return userService.getUserList(search);
	}
	
	
	
	
	
	
	
	
}