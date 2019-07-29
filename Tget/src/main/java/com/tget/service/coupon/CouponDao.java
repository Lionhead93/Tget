package com.tget.service.coupon;

import java.util.List;
import java.util.Map;

import com.tget.service.coupon.domain.Coupon;

public interface CouponDao {

	public void insertCoupon(Coupon coupon) throws Exception;

	public List<Coupon> selectCouponList(String userId) throws Exception;
	
	public void updateCoupon(Coupon coupon) throws Exception;

	public Coupon selectCoupon(int couponNo) throws Exception;
	
}