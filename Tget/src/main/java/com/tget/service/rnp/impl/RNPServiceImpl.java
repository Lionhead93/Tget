package com.tget.service.rnp.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tget.service.rnp.domain.PointHistory;
import com.tget.service.rnp.domain.Review;
import com.tget.service.user.domain.User;
import com.tget.service.event.EventService;
import com.tget.service.rnp.RNPDao;
import com.tget.service.rnp.RNPService;


@Service("rNPServiceImpl")
public class RNPServiceImpl implements RNPService{
	///F
	@Autowired
	@Qualifier("rNPDaoImpl")
	private RNPDao rNPDao;

	///M
	public void addReview(Review review) throws Exception{
		rNPDao.updateReview(review);
	}
	
	public List<PointHistory> getPointHistory(String userId) throws Exception{
		//
		return rNPDao.selectPointHistory(userId);
	}
	
	public List<Review> getReviewList(String buyerId) throws Exception{
		//
		return rNPDao.selectReviewList(buyerId);
	}
	
	public List<Review> getSellerEstimationList(String sellerId) throws Exception{

		return rNPDao.selectSellerEstimationList(sellerId);
	}
	
	public void updateReview(Review review) throws Exception{
		rNPDao.updateReview(review);
	}
	
	public void addPoint(PointHistory pointHistory) throws Exception{
		rNPDao.insertPointHistory(pointHistory);
	}
	
	public Review getReview(int tranNo) throws Exception{
		return rNPDao.selectReview(tranNo);
	}
	
	public void updatePoint(User user) throws Exception{
		rNPDao.updatePoint(user);
	}
	
	public int getPointHistoryCount(String userId) throws Exception{
		return rNPDao.selectPointHistoryCount(userId);
	}
	
	
	
//	public  PointHistory getPointHistoryByTranNo(int tranNo)  throws Exception{
//		return null;
//	}
	
}