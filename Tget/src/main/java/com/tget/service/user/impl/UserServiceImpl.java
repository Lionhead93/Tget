package com.tget.service.user.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tget.common.domain.Search;
import com.tget.service.user.TempKey;
import com.tget.service.user.UserDao;
import com.tget.service.user.UserService;
import com.tget.service.user.domain.User;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception  {
		userDao.insertUser(user);
		
	    }


	@Override
	public User getUser(String userId) throws Exception {
		return userDao.selectUser(userId);
	}

	@Override
	public Map<String, Object> getUserList(Search search) throws Exception {
		List<User> list= userDao.selectUserList(search);
		int totalCount = userDao.selectTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}


	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
		
	}

	@Override
	public void updatePassword(User user) throws Exception {
		userDao.updatePassword(user);
		
	}
	
	@Override
	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		User user=userDao.selectUser(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}
	@Override
	public void addBlacklist(User user) throws Exception {
		
		//SYSDATE 생성
		Date today = new Date ();  

		//날짜 계산을 위한 Calendar 생성
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		Calendar cal3 = Calendar.getInstance();
		
		
		cal.setTime(today); cal2.setTime(today); cal3.setTime(today);
		
		cal.add(Calendar.DATE, 7);
		cal2.add(Calendar.MONTH, 1);
		cal3.add(Calendar.YEAR, 999);

		//Calendar --> Date 데이터타입
		Date b1 = new Date(cal.getTimeInMillis());
		Date b2 = new Date(cal2.getTimeInMillis());
		Date b3 = new Date(cal3.getTimeInMillis());
		
		String bc = user.getBlacklistCode();
		
		if(bc.equals("0")) {
			user.setBlacklistCode("1");
			user.setBlacklistStartDate(today);
			user.setBlacklistEndDate(b1);
		}else if
			(bc.equals("1")) {
			user.setBlacklistCode("2");
			user.setBlacklistStartDate(today);
			user.setBlacklistEndDate(b2);
		}else if
			(bc.equals("2")){
			user.setBlacklistCode("3");
			user.setBlacklistStartDate(today);
			user.setBlacklistEndDate(b3);
		}
			
		
		
		userDao.insertBlacklist(user);
		
	}

	@Override
	public User getBlacklist(String userId) throws Exception {
			return null;
	}

	@Override
	public void addSeller(User user) throws Exception {
		userDao.insertUser(user);
		
	}
 
	@Override
	public void updateSeller(User user) throws Exception {
		userDao.updateUser(user);
		
	}

	@Override
	public User getSellerEval(String userId) throws Exception {
		return userDao.selectUser(userId);
	}

	@Override
	public User getSalesGrade(String userId) throws Exception {
		return userDao.selectUser(userId);
	}


	@Override
	public User getCode(String code) throws Exception {
		// TODO Auto-generated method stub
		return userDao.selectCode(code);
	}

	@Override
	public boolean  checknickNameDuplication(String nickName) throws Exception {
	
		boolean result=true;
		
		System.out.println("nickName!!!!!!!!!!!!!!!!!!!!!!!"+nickName);
		
		User user = userDao.selectnickName(nickName);
		
		System.out.println("cafe!!!!!!!!!!!!!!!!!!!!!!!"+user);
		
		if(user != null) {
			result=false;
		}
		return result;
	}

	@Override
	public boolean checkcodeDuplication(String code) throws Exception {
		
		boolean result=true;
		
		System.out.println("nickName!!!!!!!!!!!!!!!!!!!!!!!"+code);
		
		User user = userDao.selectCode(code);
		
		System.out.println("user!!!!!!!!!!!!!!!!!!!!!!!"+user);
		
		if(user != null) {
			result=false;
		}
		return result;
	}

	@Override
	public User finduserId(String phone) throws Exception {
		// TODO Auto-generated method stub
		return userDao.finduserId(phone);
	}

	@Override
	public User findPassword(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.findPassword(userId);
	}

	@Override
	public boolean checkuserIdDuplication(String userId) throws Exception {
		// TODO Auto-generated method stub
boolean result=true;
		
		System.out.println("userId!!!!!!!!!!!!!!!!!!!!!!!"+userId);
		
		User user = userDao.selectuserId(userId);
		
		System.out.println("user!!!!!!!!!!!!!!!!!!!!!!!"+user);
		
		if(user != null) {
			result=false;
		}
		return result;
	}

	@Override
	public User getKakao(String kakaoId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.selectKakao(kakaoId);
	}
	}



	
	