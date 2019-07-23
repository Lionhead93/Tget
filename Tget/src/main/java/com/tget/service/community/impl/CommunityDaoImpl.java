package com.tget.service.community.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tget.common.domain.Search;
import com.tget.service.community.CommunityDao;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;

@Repository("communityDaoImpl")
public class CommunityDaoImpl implements CommunityDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CommunityDaoImpl(){
		System.out.println(this.getClass());
	}

	@Override
	public void InsertContent(Content content) throws Exception {
		sqlSession.insert("CommunityMapper.insertContent", content);
	}
	
	@Override
	public void InsertReport(Report report) throws Exception{
		sqlSession.insert("CommunityMapper.insertReport", report);
	}
	
	@Override
	public void InsertReply(Reply reply) throws Exception{
		sqlSession.insert("CommunityMapper.insertReply", reply);
	}
	
	@Override
	public Content selectContent(int contentNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.selectContent", contentNo);
	}
	
	@Override
	public Reply selectReply(int replyNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.selectReply", replyNo);
	}
	
	@Override
	public Report selectReport(int reportNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.selectReport", reportNo);
	}
	
	@Override
	public void updateContent(Content content) throws Exception {
		sqlSession.update("CommunityMapper.updateContent", content);
	}
	
	@Override
	public void updateReply(Reply reply) throws Exception {
		sqlSession.update("CommunityMapper.updateReply", reply);
	}
	
	@Override
	public void updateReport(Report report) throws Exception {
		sqlSession.update("CommunityMapper.updateReport", report);
	}
	

	//// ¥Ò±€ ªË¡¶
	@Override
	public void deleteReply(int replyNo) throws Exception{
		sqlSession.delete("CommunityMapper.deleteReply", replyNo);
	}
	
	@Override
	public void updateGoodCount(int contentNo) throws Exception {
		sqlSession.update("CommunityMapper.updateGoodCount", contentNo);		
	}
	
	@Override
	public void updateBadCount(int contentNo) throws Exception {
		sqlSession.update("CommunityMapper.updateBadCount", contentNo);		
	}
	
	@Override
	public List<Content> selectListContent(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.selectListContent", search);
	}

	@Override
	public int selectTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CommunityMapper.selectTotalCount", search);
	}
	
	@Override
	public void updateRefund(Content content) throws Exception {
		sqlSession.update("CommunityMapper.updateRefund", content);
	}

	@Override
	public List<Report> selectListReport(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CommunityMapper.selectListReport", search);
	}
	
	@Override
	public List<Content> selectListRefund(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CommunityMapper.selectListRefund", search);
	}

	@Override
	public List<Reply> selectListReply(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("CommunityMapper.selectListReply", reply);
	}
}
