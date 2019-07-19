package com.tget.service.user.test;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tget.service.user.domain.User;
import com.tget.service.user.UserService;


@RunWith(SpringJUnit4ClassRunner.class)

//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
//@ContextConfiguration(locations = { "classpath:config/context-common.xml" })
public class UserServiceTest {


	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//@Test
	public void testAddUser() throws Exception {
		Date today = new Date();
		User user = new User();
		user.setUserId("111");
		user.setUserName("111");
		user.setPassword("testPasswd");
		user.setPhone("123");
		user.setNickName("111");
		user.setAddress("1");
		user.setPostalCode(1);
		user.setRole("1");
		user.setLocal("1");
		user.setPoint(1);
		user.setUserStatement("1");
		user.setLastConnDate(today);
		user.setBlacklistCode("0");
	/*	user.setKakaoId("1");
		user.setNaverId("1");
		user.setFacebookId("1");*/
		
		userService.addUser(user);
		
		user = userService.getUser("111");

	
		//System.out.println(user);
		

		Assert.assertEquals("3", user.getUserId());
		Assert.assertEquals("3", user.getUserName());
		Assert.assertEquals("testPasswd", user.getPassword());
		Assert.assertEquals("123", user.getPhone());
		Assert.assertEquals("3", user.getNickName());
		Assert.assertEquals("1", user.getAddress());
		Assert.assertEquals(1, user.getPostalCode());
		Assert.assertEquals("1", user.getRole());
		Assert.assertEquals("1", user.getLocal());
		Assert.assertEquals(1, user.getPoint());
		Assert.assertEquals("1", user.getUserStatement());
		Assert.assertEquals(today, user.getLastConnDate());
		Assert.assertEquals("0", user.getBlacklistCode());
	}
	
	//@Testasd
	/*public void testGetUser() throws Exception {
		
		User user = new User();
		
		user.setUserId("testUserId");
		user.setUserName("testUserName");
		user.setPassword("testPasswd");
		user.setPhone(111-2222-3333);
		user.setNickName("1");
		user.setAddress("1");
		user.setPostalCode(1);
		user.setRole("1");
		user.setLocal("1");
		user.setPoint(1);
		user.setUserStatement("1");
		
		userService.addUser(user);
		user = userService.getUser("testUserId");


		System.out.println(user);
		

		Assert.assertEquals("testUserId", user.getUserId());
		Assert.assertEquals("testUserName", user.getUserName());
		Assert.assertEquals("testPasswd", user.getPassword());
		Assert.assertEquals(111-2222-3333, user.getPhone());
		Assert.assertEquals("1", user.getNickName());
		Assert.assertEquals("1", user.getAddress());
		Assert.assertEquals(1, user.getPostalCode());
		Assert.assertEquals("1", user.getRole());
		Assert.assertEquals("1", user.getLocal());
		Assert.assertEquals(1, user.getPoint());
		Assert.assertEquals("1", user.getUserStatement());
	}*/

	//@Test
	 public void testUpdateUser() throws Exception{
		 
		User user = userService.getUser("admin");
		Assert.assertNotNull(user);
		
		Assert.assertEquals("admin", user.getUserId());
		Assert.assertEquals("관리자", user.getUserName());

		
		
		user.setUserName("test");
		user.setNickName("닉네임");
		
		userService.updateUser(user);
		
		user = userService.getUser("test");
		Assert.assertNotNull(user);
		
		System.out.println(user);
			
		Assert.assertEquals("test", user.getUserName());
		Assert.assertEquals("닉네임", user.getNickName());
	
	 }
	 

	//@Test
//	public void testCheckDuplication() throws Exception{

//			User user = new User();
//			user.setUserId("testUserId");
//			user.setUserName("testUserName");
//			user.setPassword("testPasswd");
//			user.setSsn("1111112222222");
//			user.setPhone("111-2222-3333");
//			user.setAddr("  ");
//			user.setEmail("test@test.com");
//			
//			userService.addUser(user);
		
		//System.out.println(userService.checkDuplication("testUserId"));
		//System.out.println(userService.checkDuplication("testUserId"+System.currentTimeMillis()) );
	 	
	/*	Assert.assertFalse( userService.checkDuplication("testUserId") );
	 	Assert.assertTrue( userService.checkDuplication("testUserId"+System.currentTimeMillis()) );
		 	
	}
	
	 //@Test
	 public void testGetUserListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = userService.getUserList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = userService.getUserList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetUserListByUserId() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("admin");
	 	Map<String,Object> map = userService.getUserList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(1, list.size());
	 	
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = userService.getUserList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	 
	 //@Test
	 public void testGetUserListByUserName() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword("SCOTT");
	 	Map<String,Object> map = userService.getUserList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setSearchCondition("1");
	 	search.setSearchKeyword(""+System.currentTimeMillis());
	 	map = userService.getUserList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(0, list.size());
	 	
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }	 */

//@Test
	public void testAddBlacklist() throws Exception {
		
		User user = userService.getUser("manager");
		
		Assert.assertNotNull(user);
		
		Assert.assertEquals("manager", user.getUserId());
		
		user.setBlacklistCode("1");


		userService.addBlacklist(user);
		
		user = userService.getUser("manager");
		Assert.assertNotNull(user);
		
		System.out.println(user);
			
		Assert.assertEquals("manager", user.getUserId());
		Assert.assertEquals("2", user.getBlacklistCode());
	
		
	}
	
@Test

public final void testGetDate() {

     

    Calendar cal = Calendar.getInstance();

    cal.setTime(new Date());

    cal.add(Calendar.DATE, 2);

    cal.add(Calendar.MONTH, 2);

     
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    String strDate = df.format(cal.getTime());

    System.err.println(strDate);

}



	}
