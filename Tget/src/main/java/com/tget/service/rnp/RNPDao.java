package com.tget.service.rnp;

import java.util.List;
import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.rnp.domain.PointHistory;
import com.tget.service.rnp.domain.Review;
import com.tget.service.user.domain.User;



//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface RNPDao {
	
//	public void InsertReview(Review review) throws Exception;

	public List<PointHistory> selectPointHistory(String userId)  throws Exception;
	
	public List<Review> selectReviewList(String buyerId)  throws Exception;
	
	public List<Review> selectSellerEstimationList(String sellerId)  throws Exception;
	
	public Review selectReview(int tranNo)  throws Exception;
	
	public void updateReview(Review review)  throws Exception;
	
	public void insertPointHistory(PointHistory pointHistory)  throws Exception;
	
	public void updatePoint(User user) throws Exception;
	
	public int selectPointHistoryCount(String userId) throws Exception;
	
	
//	public  PointHistory selectPointHistoryByTranNo(int tranNo)  throws Exception;

	
}