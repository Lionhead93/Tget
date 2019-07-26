package com.tget.service.transaction.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tget.common.domain.Search;
import com.tget.service.transaction.TranDao;
import com.tget.service.transaction.TranService;
import com.tget.service.transaction.domain.Transaction;

@Service("tranServiceImpl")
public class TranServiceImpl implements TranService{
	
	@Autowired
	@Qualifier("tranDaoImpl")
	private TranDao tranDao;
	
	public void setTranDao(TranDao traDao) {
		this.tranDao = traDao;
	}
	
	public TranServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}	
	
	@Override
	public int addTran(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
				
		return tranDao.insertTran(transaction);
	}

	@Override
	public void addDelivery(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		tranDao.updateDeliveryInfo(transaction);
	}

	@Override
	public void updateTranCode(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		tranDao.updateTranCode(transaction);
	}

	@Override
	public void updateDeliveryAddr(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		tranDao.updateDeliveryAddr(transaction);
	}

	@Override
	public Transaction getTran(int tranNo) throws Exception {
		// TODO Auto-generated method stub
		return tranDao.selectTran(tranNo);
	}

	@Override
	public Map<String, Object> getTranList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Transaction> list = tranDao.selectListTran(search); 
		int totalCount = tranDao.selectTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);		
		
		return map;
	}

	@Override
	public Transaction getTranWhere(Transaction transaction) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Transaction getDeliveryImageInfo(File file) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deposit(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
