package com.tget.service.transaction.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tget.common.domain.Search;
import com.tget.service.transaction.TranDao;
import com.tget.service.transaction.domain.Transaction;

@Repository("tranDaoImpl")
public class TranDaoImpl implements TranDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public TranDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public int insertTran(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("TransactionMapper.insertTran", transaction);
		
		return transaction.getTranNo();
	}

	@Override
	public void updateDeliveryInfo(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("TransactionMapper.updateDeliveryInfo", transaction);
	}

	@Override
	public void updateDeliveryAddr(Transaction transaction) {
		// TODO Auto-generated method stub
		sqlSession.update("TransactionMapper.updateDeliveryAddr", transaction);
	}

	@Override
	public void updateTranCode(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("TransactionMapper.updateTranCode", transaction);
	}

	@Override
	public Transaction selectTran(int tranNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("TransactionMapper.selectTran", tranNo);
	}

	@Override
	public List<Transaction> selectListTran(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("TransactionMapper.selectListTran", search);
	}

	@Override
	public int selectTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("TransactionMapper.selectTotalCount", search);
	}

}
