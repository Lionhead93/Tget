package com.tget.web.rnp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tget.service.rnp.RNPService;
import com.tget.service.user.UserService;


@Controller
@RequestMapping("/rnp/*")
public class ReviewAndPointController {

		///Field
		@Autowired
		@Qualifier("rNPServiceImpl")
		private RNPService rNPService;
		
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		
		///C
		public ReviewAndPointController(){
			System.out.println(this.getClass());
		}

		///M	
		@RequestMapping(value="getPointHistory")
		public String getPointHistory(HttpServletRequest request, Model model) throws Exception {
			System.out.println("===============getPointHistory===============");
			
			rNPService.getPointHistory(request.getParameter("userId"));
			
			return "forward:/rnp/getPointHistory.jsp";
			
		}
		
		@RequestMapping(value="getReviewList")
		public String getReviewList(HttpServletRequest request, Model model) throws Exception {
			System.out.println("===============getReviewList===============");
			
			rNPService.getReviewList(request.getParameter("buyerId"));
			
			return "forward:/rnp/listReview.jsp";
			
		}
		
		@RequestMapping(value="getSellerEstimationList")
		public String getSellerEstimationList(@RequestParam String sellerId,Model model) throws Exception {
			System.out.println("===============getSellerEstimationList===============");
			
			model.addAttribute("sellerEstimationList", rNPService.getSellerEstimationList(sellerId));
			model.addAttribute("sellerId",sellerId);
			model.addAttribute("sellerNickname",userService.getUser(sellerId).getNickName());
			
			return "forward:/rnp/listSellerEstimation.jsp";
			
		}
}
