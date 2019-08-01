package com.tget.web.coupon;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tget.service.coupon.CouponService;
import com.tget.service.coupon.domain.Coupon;
import com.tget.service.user.UserService;

@Controller
@RequestMapping("/coupon/*")
public class CouponController {
	
	///Field
	Coupon coupon = new Coupon();
	@Autowired
	@Qualifier("couponServiceImpl")
	private CouponService couponService;
	@Qualifier("userServiceImpl")
	@Autowired
	private UserService userService;
		
	public CouponController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="getCouponList", method=RequestMethod.GET )
	public String getCouponList( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getCoupon : GET");
		//Business Logic
		Map<String, Object> map = couponService.getCouponList(userId);
		// Model ï¿½ï¿½ View ï¿½ï¿½ï¿½ï¿½
		model.addAttribute("list", map.get("list"));
		
		return "forward:/coupon/getCouponList.jsp";
	}
	
	/*@RequestMapping( value="addCoupon", method=RequestMethod.POST )
	public void addCoupon(@ModelAttribute("coupon") Coupon coupon) throws Exception {

		System.out.println("/user/addCoupon : POST");
		//Business Logic
		System.out.println(coupon+" ¹¹·Î µé¿È?");
		if(session.getAttribute("kakaoId")!=null) {
			System.out.println("Ä«Ä«¿À °èÁ¤ È¸¿ø°¡ÀÔ µé¿È");
		user.setKakaoId((String) session.getAttribute("kakaoId"));
		}
		if(session.getAttribute("naverId")!=null) {
			System.out.println("³×ÀÌ¹ö °èÁ¤ È¸¿ø°¡ÀÔ µé¿È");
		user.setNaverId((String) session.getAttribute("naverId"));
		}
		
		
		userService.addUser(user);
		
		String userId = user.getUserId();
		
		user= userService.getUser(userId);
		
		session.setAttribute("user", user);
	
		return "redirect:/";
		
	}*/
	
	
	
	
	
}