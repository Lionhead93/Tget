package com.tget.service.coupon.impl;

import java.util.ArrayList;
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
		
		List<Coupon> listA = new ArrayList<Coupon>();
		List<Coupon> listB = new ArrayList<Coupon>();
		
		if(list.size()!=0) {
			
			for(Coupon coupon:list) {
				if(coupon.getCouponCode().equals("0")) {
					listA.add(coupon);
				}else if(coupon.getCouponCode().equals("1")) {
					listB.add(coupon);
				}
			}
			
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list", list);
		map.put("listA", listA);
		map.put("listB", listB);
		
		return map;
	}

	@Override
	public void updateCoupon(Coupon coupon) throws Exception {
	couponDao.updateCoupon(coupon);
		
	}

	@Override
	public Coupon getCoupon(int couponNo) throws Exception {
		// TODO Auto-generated method stub
		return couponDao.selectCoupon(couponNo);
	}


	
}