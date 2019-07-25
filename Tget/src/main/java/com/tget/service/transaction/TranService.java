package com.tget.service.transaction;

import java.io.File;
import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.transaction.domain.Transaction;

public interface TranService {
	
	public int addTran(Transaction transaction) throws Exception;
	
	public void addDelivery(Transaction transaction) throws Exception;
	
	public void updateTranCode(Transaction transaction) throws Exception;
	
	public void updateDeliveryAddr(Transaction transaction) throws Exception;
	
	public Transaction getTran(int tranNo) throws Exception;
	
	public Map<String,Object> getTranList(Search search) throws Exception;
	//배송조회
	public Transaction getTranWhere(Transaction transaction) throws Exception;
	//운송장이미지출력	
	public Transaction getDeliveryImageInfo(File file) throws Exception;
	
	public String deposit(String userId) throws Exception;
	
}
