package com.tget.web.rnp;

import java.util.HashMap;
import java.util.List;
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
import com.tget.service.rnp.domain.PointHistory;
import com.tget.service.rnp.domain.Review;
import com.tget.service.ticket.TicketService;
import com.tget.service.transaction.TranService;
import com.tget.service.transaction.domain.Transaction;
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
		
		@Autowired
		@Qualifier("tranServiceImpl")
		private TranService tranService;
		
		
		///C
		public ReviewAndPointController(){
			System.out.println(this.getClass());
		}

		///M	
		@RequestMapping(value="getPointHistory")
		public String getPointHistory(HttpSession session, HttpServletRequest request, Model model) throws Exception {
			System.out.println("===============getPointHistory===============");
			List<PointHistory> list= null;
			User user = (User)session.getAttribute("user");
			System.out.println(rNPService.getPointHistoryCount(user.getUserId()));
			
			if (rNPService.getPointHistoryCount(user.getUserId()) != 0 ) {
				list = rNPService.getPointHistory(user.getUserId());
			}
			
			model.addAttribute("pointHistoryList", list);
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
			System.out.println(userService.getUser(sellerId));
			model.addAttribute("sellerEstimationList", rNPService.getSellerEstimationList(sellerId));
			model.addAttribute("sellerId",sellerId);
			model.addAttribute("sellerNickname",userService.getUser(sellerId).getNickName());
			
			return "forward:/rnp/listSellerEstimation.jsp";
			
		}
		
//		@RequestMapping(value="addReview", method=RequestMethod.GET)
//		public String addReview(@RequestParam int tranNo,Model model) throws Exception {
//			System.out.println("===============addReview GET===============");	
//			
//			
//			model.addAttribute("tranNo",tranNo);
////			model.addAttribute("updatePoint", transaction.getTotalPrice()*0.01);
////			System.out.println("=============end============");
//			return "forward:/rnp/addReview.jsp";
//		}
		
//		@RequestMapping(value="addReview", method=RequestMethod.POST)
//		public String addReview(@ModelAttribute("review") Review review,HttpSession session, Model model) throws Exception {
//			System.out.println("===============addReview===============");
//			System.out.println(review);
//			
//			rNPService.addReview(review);
//			User user = (User)session.getAttribute("user");
//			String userId =user.getUserId();
//			
//			Transaction tran =  tranService.getTran(review.getTranNo());
//			tran.setTranCode("3");
//			tranService.updateTranCode(tran);
//			
//			int updatePoint = tran.getTotalPrice()/100;
//			
//			PointHistory pointHistory = new PointHistory();
//			pointHistory.setTranNo(review.getTranNo());
//			pointHistory.setPointUpdateCode("0");
//			pointHistory.setUpdatePoint(updatePoint);
//			pointHistory.setUserId(userId);
//			pointHistory.setTotalPoint(user.getPoint()+updatePoint);
//			user.setPoint(user.getPoint()+updatePoint);
//			
//			rNPService.addPoint(pointHistory);
//			rNPService.updatePoint(user);
//			
//			session.setAttribute("user", user);
//			model.addAttribute("review", review);
//			model.addAttribute("tranNo", review.getTranNo());
//			model.addAttribute("updatePoint", updatePoint);
//			
//			return "forward:/rnp/addReviewPOST.jsp";
//		}
		
//		@RequestMapping(value="updateReview", method=RequestMethod.GET)
//		public String updateReview(@RequestParam int tranNo, Model model) throws Exception {
//			System.out.println("===============updateReview===============");
//
//			Review review = rNPService.getReview(tranNo);
//		
//			model.addAttribute("tranNo", tranNo);
//			model.addAttribute("review", review);
//			
//			return "forward:/rnp/addReview.jsp";
//		}
		
//		@RequestMapping(value="updateReview", method=RequestMethod.POST)
//		public String updateReview(@ModelAttribute("review") Review review, Model model) throws Exception {
//			System.out.println("===============updateReview===============");
//			System.out.println(review);
//			
//			rNPService.updateReview(review);
//			
//			model.addAttribute("review", review);
//			model.addAttribute("tranNo", review.getTranNo());
//			return "forward:/rnp/addReviewPOST.jsp";
//		}
//		
		
}
