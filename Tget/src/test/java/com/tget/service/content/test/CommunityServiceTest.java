package com.tget.service.content.test;

import java.io.BufferedReader;
import java.sql.Clob;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tget.common.domain.Search;
import com.tget.service.community.CommunityService;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;

/*
 *	FileName :  UserServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { 
									"classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml" })
public class CommunityServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;

/////////////////testaddContent////////////////////////////////
	//@Test
	public void testAddContent() throws Exception {
		
		
		Content content = new Content();
//		Clob clob = new Clob();
//		Object c = null;
//		
//		if(content.getContentBody() instanceof java.sql.Clob) {
//			c = 
//		}
		content.setUserId("admin");
		content.setUserNickname("나관리자얌");
		content.setContentName("게시글");
		content.setContentBody("sdafsdafasadfasdfdsa");
		content.setBoardCode("1");
		content.setContentCode("2");
		content.setOpen("1");

		communityService.addContent(content);
}
//////////////////////////////////////////////////////////////////	
///////////////////testAddReport//////////////////////////
	@Test
	public void testAddReport() throws Exception{
		
		Report report = new Report();
		
		report.setWhiteId("admin");
		report.setWhiteNickName("나관리자얌");
		report.setBlackId("manager");
		report.setReportReasonCode("1");
		report.setContentNo(10002);
		report.setCheck("1");
		report.setReportCode("1");
		System.out.println("@@@@@@@@"+report);
		communityService.addReport(report);
	}
///////////////////////////////////////////////////////////	
////////////////////testAddReply/////////////////////////
//	@Test
	public void testAddReply() throws Exception {
	
		Reply reply = new Reply();
		
		reply.setUserId("admin");
		reply.setUserNickName("나관리자얌");
		reply.setContentNo(10002);
		reply.setReplyBody("리플리플리플리플");
		System.out.println("!!!!!!!!"+reply);
		communityService.addReply(reply);	
}
////////////////////////////////////////////////////////
///////////////testGetContent/////////////////////
	//@Test
	public void testGetContent() throws Exception {
		
		Content content = new Content();

		content = communityService.getContent(10002);

		System.out.println(content);
		
		Assert.assertEquals(10002, content.getContentNo());
		Assert.assertNotNull(communityService.getContent(10003));
	}	

//////////////////////////////////////////////////////////
	/////////////testUpdateContent//////////////////////// CLOB......
	//@Test
	 public void testUpdateContent() throws Exception{

		Content content = communityService.getContent(10002);
		Assert.assertNotNull(content);
	
		Assert.assertEquals(10002, content.getContentNo());
		Assert.assertEquals("게시글", content.getContentName());
		Assert.assertEquals("게시글", content.getContentBody());////null을 어떻게;;;;;;;;;;;
		//Assert.assertEquals(

		content.setContentName("게시글게시글게시글");
		//content.setContentBody("게시글게시글게시글");////null을 어떻게;;;;;;;;;;;
		
		communityService.updateContent(content);
		content = communityService.getContent(10002);
			
		Assert.assertEquals("게시글게시글게시글", content.getContentName());
		Assert.assertEquals("게시글게시글게시글", content.getContentBody());////null을 어떻게;;;;;;;;;;;
	 }
//////////////////////////////////////////////////////////
	 //////////////testDeleteContent////////////////////// content는 필요없고 reply는 필요할거같음 Test필요 
	//@Test
//			public void deleteContent() throws Exception {
//
//				communityService.deleteContent(10002);
//	}

//////////////////////////////////////////////////////////
	 //////////////testselectListContent//////////////////////
	 //@Test
	 public void selectListContent() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = communityService.getContentList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = communityService.getContentList(search);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
}