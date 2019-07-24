package com.tget.service.coupon;

import java.util.List;
import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.coupon.domain.Coupon;

public interface CouponService {

	public void addCoupon(Coupon coupon) throws Exception;

	public Map<String, Object> getCouponList(String userId) throws Exception;
	
	public void updateCoupon(Coupon coupon) throws Exception;
	
//	public Map<String , Object> getCouponList(Search search) throws Exception;

}
