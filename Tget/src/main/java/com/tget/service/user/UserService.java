package com.tget.service.user;

import java.util.Date;
import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.user.domain.User;


public interface UserService {
	//회원가입
	public void addUser(User user) throws Exception;
	//회원조회
	public User getUser(String userId) throws Exception;
	//회원목록조회
	public Map<String , Object> getUserList(Search search) throws Exception;
	//회원 수정
	public void updateUser(User user) throws Exception;
	//중복성 체크
	public boolean checkDuplication(String userId) throws Exception;
	//블랙리스트 추가
	public void addBlacklist(User user)throws Exception;
	//블랙리스트 조회
	public User getBlacklist(String userId)throws Exception;
	//판매자 등록
	public void addSeller(User user)throws Exception;
	//판매자 수정
	public void updateSeller(User user)throws Exception;
	//판매자 평가 조회
	public User getSellerEval(String userId)throws Exception;
	//판매등급 조회
	public User getSalesGrade(String userId)throws Exception;
/*	//판매자리스트 조회
	public Map<String , Object> getSellerList(Search search) throws Exception;*/
	public boolean  checknickNameDuplication(String nickName)throws Exception;
	
	public boolean  checkuserIdDuplication(String userId)throws Exception;
	
	public boolean checkcodeDuplication(String code)throws Exception;
	
	public User getCode(String code)throws Exception;
	
	public User finduserId(String phone)throws Exception;

	public User findPassword(String phone)throws Exception;
	
}
