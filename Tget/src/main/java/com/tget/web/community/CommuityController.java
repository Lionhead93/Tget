package com.tget.web.community;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tget.common.domain.Page;
import com.tget.common.domain.Search;
import com.tget.service.community.CommunityService;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;
import com.tget.service.transaction.TranService;
import com.tget.service.user.UserService;
import com.tget.service.user.domain.User;

@Controller
@RequestMapping("/community/*")
public class CommuityController {

		///Field
		@Autowired
		@Qualifier("communityServiceImpl")
		private CommunityService communityService;
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		@Autowired
		@Qualifier("tranServiceImpl")
		private TranService tranService;
			
		public CommuityController(){
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		//@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		//@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		//@Value("#{commonProperties['fileroot']}")
		//String fileroot;
		
		
		
		@RequestMapping(value="addContent", method=RequestMethod.GET)
		public String addContent() throws Exception {

			System.out.println("content/addContent: GET");
			
			return "forward:/community/addContent.jsp";
		}
		
		@RequestMapping(value="addContent", method=RequestMethod.POST)
		public String addContent( @ModelAttribute("content") Content content) throws Exception {
			//, @RequestParam("file") MultipartFile file
			System.out.println("content/addContent: POST");
			//Business Logic
			//String fileName = file.getOriginalFilename();
			
			//File f = new File(fileroot, fileName);
			//String originFileName =  file.getOriginalFilename();
					
			//String uploadFile = System.currentTimeMillis()+ originFileName;
//			String safeFile = fileroot + uploadFile;
//			
//			try {
//				file.transferTo(new File(fileroot , uploadFile ));
//				
//			} catch(IOException e) {
//				e.printStackTrace();
//			}
//			
//			content.setFileName(uploadFile);
			if(content.getContentCode().equals("7")) {
				content.setRefundCheck("1");
			}
			
			communityService.addContent(content);
			
			return "forward:/community/getContentList";
		}
		
		@RequestMapping(value="addReport", method=RequestMethod.GET)
		public String addReport(@RequestParam("contentNo") int contentNo, @ModelAttribute("content") Content content, Model model) throws Exception {

			System.out.println("community/addReport: GET");
			
			Content content1 = communityService.getContent(contentNo);
			
			model.addAttribute("content", content1);
			
			return "forward:/community/addReport.jsp";
		}
		
		@RequestMapping(value="addReport", method=RequestMethod.POST)
		public String addReport(@ModelAttribute("report") Report report, HttpSession session) throws Exception {

			System.out.println("community/addContent: POST");
			//User user = userService.getUser("userId");
			
			communityService.addReport(report);
			
			
			return "forward:/community/getReportList";
		}

		@RequestMapping(value="getContent")// View의 요청 경로 지정 
		public String getContent( @RequestParam("contentNo") int contentNo , Model model) throws Exception {
			
			System.out.println("/community/getContent: GET");
			
			Content content = communityService.getContent(contentNo);
			
			//Model객체를 이용해서 View로 데이터 전달
			
			model.addAttribute("content", content);
			model.addAttribute("reply", new Reply());
			
			return "forward:/community/getContent.jsp";
		}
	
		@RequestMapping(value="updateContent" , method= RequestMethod.GET)
		public String updateContent( @RequestParam("contentNo") int contentNo , Model model) throws Exception{

			System.out.println("/community/updateContent: GET");
			//Business Logic			
			
			model.addAttribute("content", communityService.getContent(contentNo));
			
			return "forward:/community/updateContent.jsp";
		}
		
		@RequestMapping(value="updateContent" , method= RequestMethod.POST)
		public String updateContent( @ModelAttribute("content") Content content, Model model) throws Exception{
			
			System.out.println("/community/updateContent: POST");
			//Business Logic			
			communityService.updateContent(content);
			
			model.addAttribute("content", content);
			
			return "forward:/community/getContent?contentNo="+content.getContentNo();
		}
	
		@RequestMapping(value="getContentList")
		public String getContentList( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
			
			System.out.println("/community/getContentList: GET/ POST");

			// Business logic
			Map<String , Object> map=communityService.getContentList(search);
			
			// Model and View 
			model.addAttribute("list", map.get("list"));
			model.addAttribute("totalCount", map.get("totalCount"));
			model.addAttribute("search", search);
			
			return "forward:/community/getContentList.jsp";
		}
		
		@RequestMapping(value="getReportList")
		public String getReportList(  @ModelAttribute("search") Search search , User user, Report report, Model model , HttpServletRequest request, HttpSession session) throws Exception{
			
			System.out.println("/community/getReportList: GET/ POST");
			
			// Business logic
			Map<String , Object> map=communityService.getReportList(search);
								
			System.out.println(map);
			
			// Model and View 
			model.addAttribute("list", map.get("list"));
			model.addAttribute("totalCount", map.get("totalCount"));
			model.addAttribute("search", search);
			
			return "forward:/community/getReportList.jsp";
		}
		
		@RequestMapping(value="getRefundList")
		public String getRefundList( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
			
			System.out.println("/community/getRefundList: GET/ POST");

			// Business logic
			Map<String , Object> map=communityService.getRefundList(search);
			
			// Model and View 
			model.addAttribute("list", map.get("list"));
			model.addAttribute("totalCount", map.get("totalCount"));
			model.addAttribute("search", search);
			
			return "forward:/community/getRefundList.jsp";
		}
		
		// 신고 리스트에서 검증 후 블랙리스트로 보내기
		@RequestMapping(value="addBlack")
		public String addBlack(@RequestParam("reportNo") int reportNo) throws Exception {
			
			System.out.println("@@되어야하느니라");
			Report report = communityService.getReport(reportNo);
			User user = userService.getUser(report.getBlackId());	
			
			userService.addBlacklist(user);
			
			report.setCheck("0");
			communityService.updateReport(report);
			System.out.println(report);

			return "forward:/user/listUser.jsp";
		}
		//환불 게시판 환불 검증 여부 처리
		@RequestMapping(value="updateRefund")
		public String updateRefund(@RequestParam("contentNo") int contentNo, Model model) throws Exception{
			
			System.out.println("/community/updateRefund");
			//Business Logic			
			Content refundContent = communityService.getContent(contentNo);
			
			// refundTranNo : 환불 거래 번호, refundCheck : 환불 검증 여부 ...update 필요..
			
			refundContent.setRefundCheck("0");
			communityService.updateRefund(refundContent);
			System.out.println(refundContent);
		
			return "forward:/community/getRefundList.jsp";
		}
		
	}