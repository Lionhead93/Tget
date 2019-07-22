package com.tget.web.rnp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tget.service.rnp.RNPService;
import com.tget.service.rnp.domain.Review;
import com.tget.service.user.UserService;
import com.tget.service.user.domain.User;


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
		public String getReviewList(HttpSession session, Model model) throws Exception {
			System.out.println("===============getReviewList===============");
			
			model.addAttribute("reviewList",rNPService.getReviewList(((User)session.getAttribute("user")).getUserId()));
			
			
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
		
		@RequestMapping(value="addReview", method=RequestMethod.GET)
		public String addReview(@RequestParam int tranNo,Model model) throws Exception {
			System.out.println("===============addReview GET===============");	
			
			model.addAttribute("tranNo",tranNo);
			return "forward:/rnp/addReview.jsp";
		}
		
		@RequestMapping(value="addReview", method=RequestMethod.POST)
		public String addReview(@ModelAttribute("review") Review review) throws Exception {
			System.out.println("===============addReview===============");
			
			rNPService.addReview(review);
			
			return "forward:/rnp/addReview.jsp";
		}
		
		@RequestMapping(value="updateReview", method=RequestMethod.GET)
		public String updateReview(@RequestParam int tranNo, Model model) throws Exception {
			System.out.println("===============updateReview(===============");
			
			Review review = rNPService.getReview(tranNo);
		
			model.addAttribute("tranNo", tranNo);
			model.addAttribute("review", review);
			
			return "forward:/rnp/addReview.jsp";
		}
}
