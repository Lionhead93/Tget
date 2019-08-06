package com.tget.service.user;

import java.util.Date;
import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.user.domain.User;


public interface UserService {
	
	public User getKakao(String kakaoId) throws Exception;
	public User getNaver(String naverId) throws Exception;
	public void addUser(User user) throws Exception;
	public User getUser(String userId) throws Exception;
	public Map<String , Object> getUserList(Search search) throws Exception;
	public void updateUser(User user) throws Exception;
	public void updatePassword(User user)throws Exception;
	public boolean checkDuplication(String userId) throws Exception;
	public void addBlacklist(User user)throws Exception;
	public User getBlacklist(String userId)throws Exception;
	public void addSeller(User user)throws Exception;
	public void updateSeller(User user)throws Exception;
	public User getSellerEval(String userId)throws Exception;
	public User getSalesGrade(String userId)throws Exception;
	public boolean  checknickNameDuplication(String nickName)throws Exception;
	public boolean  checkuserIdDuplication(String userId)throws Exception;
	public boolean checkcodeDuplication(String code)throws Exception;
	public User getCode(String code)throws Exception;
	public User finduserId(String phone)throws Exception;
	public User findPassword(String userId)throws Exception;
	
}
