package com.tget.service.coupon.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tget.service.coupon.CouponDao;
import com.tget.service.coupon.CouponService;
import com.tget.service.coupon.domain.Coupon;
import com.tget.service.user.UserDao;


//==> ȸ������ ���� ����
@Service("couponServiceImpl")
public class CouponServiceImpl implements CouponService{
	
	///Field
	@Autowired
	@Qualifier("couponDaoImpl")
	private CouponDao couponDao;
	public void setCouponDao(CouponDao couponDao) {
		this.couponDao = couponDao;
	}
	
	///Constructor
	public CouponServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addCoupon(Coupon coupon) throws Exception {
		couponDao.insertCoupon(coupon);
		
	}

	@Override
	public Map<String, Object> getCouponList(String userId) throws Exception {
		List<Coupon> list= couponDao.selectCouponList(userId);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		
		return map;
	}

	@Override
	public void updateCoupon(Coupon coupon) throws Exception {
	couponDao.updateCoupon(coupon);
		
	}


	
}