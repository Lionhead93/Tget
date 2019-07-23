package com.tget.service.rnp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tget.service.rnp.domain.PointHistory;
import com.tget.service.rnp.domain.Review;
import com.tget.service.user.domain.User;


public interface RNPService {
	
	public void addReview(Review review) throws Exception;
	
	public List<PointHistory> getPointHistory(String userId) throws Exception;
	
	public List<Review> getReviewList(String buyerId) throws Exception;
	
	public List<Review> getSellerEstimationList(String sellerId) throws Exception;
	
	public void updateReview(Review review) throws Exception;
	
	public void addPoint(PointHistory pointHistory) throws Exception;
	
	public Review getReview(int tranNo) throws Exception;
	
	public void updatePoint(User user) throws Exception;
	
//	public  PointHistory getPointHistoryByTranNo(int tranNo)  throws Exception;
	
}