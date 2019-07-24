package com.tget.service.user.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tget.common.domain.Search;
import com.tget.service.user.UserDao;
import com.tget.service.user.domain.User;




@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void insertUser(User user) throws Exception {
		sqlSession.insert("UserMapper.insertUser", user);
		
	}

	@Override
	public User selectUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUser", userId);
	}

	@Override
	public List<User> selectUserList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return  sqlSession.selectList("UserMapper.getUserList", search);
	}

	@Override
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
		
	}

	@Override
	public void updatePassword(User user) throws Exception {
		sqlSession.update("UserMapper.updatePassword", user);
		
	}

	@Override
	public User selectSellerEval(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUser", userId);
	
	}

	@Override
	public User selectSalesGrade(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUser", userId);
	}

	@Override
	public int selectTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}

	@Override
	public void insertBlacklist(User user) throws Exception {
		sqlSession.update("UserMapper.insertBlacklist",user);
		
	}

	@Override
	public User nickNameCheck(String nickName) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.nickNameCheck",nickName);
	}

	@Override
	public User selectcode(String code) throws Exception {
	
		return sqlSession.selectOne("UserMapper.selectcode",code);
	}

	@Override
	public User selectnickName(String nickName) throws Exception {
		
		return	sqlSession.selectOne("UserMapper.selectnickName",nickName);
	}
	
	@Override
	public User selectuserId(String userId) throws Exception {
		
		return	sqlSession.selectOne("UserMapper.selectnickName",userId);
	}

	@Override
	public User selectCode(String code) throws Exception {
		
		return	sqlSession.selectOne("UserMapper.selectCode",code);
	}

	@Override
	public User finduserId(String phone) throws Exception  {
		
		return sqlSession.selectOne("UserMapper.finduserId", phone);
		
	}

	@Override
	public User findPassword(String userId) throws Exception {
		// TODO Auto-generated method stub
		 return sqlSession.selectOne("UserMapper.findPassword",userId);
		
	}

	@Override
	public User userIdCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User selectKakao(String kakaoId) throws Exception {
		// TODO Auto-generated method stub
		 return sqlSession.selectOne("UserMapper.selectKakao",kakaoId);
	}


}