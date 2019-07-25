package com.tget.service.transaction;

import java.util.List;

import com.tget.common.domain.Search;
import com.tget.service.transaction.domain.Transaction;

public interface TranDao {
	
	public int insertTran(Transaction transaction) throws Exception;
	
	public void updateDeliveryInfo(Transaction transaction) throws Exception;
	
	public void updateDeliveryAddr(Transaction transaction);
	
	public void updateTranCode(Transaction transaction) throws Exception;
	
	public Transaction selectTran(int tranNo) throws Exception;
	
	public List<Transaction> selectListTran(Search search) throws Exception;
		
	public int selectTotalCount(Search search) throws Exception;
	
}
