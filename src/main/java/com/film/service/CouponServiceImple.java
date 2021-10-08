package com.film.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.CouponDTO;
import com.film.mapper.CouponMapper;

@Service
public class CouponServiceImple implements CouponService{

	@Autowired
	private CouponMapper mapper;
	
	@Override
	public void insertCoupon(CouponDTO dto) {
		mapper.insertCoupon(dto);
	}

	@Override
	public List<HashMap<String, Object>> getMyCoupon(String member_id) {
		return mapper.getMyCoupon(member_id);
	}

	@Override
	public void oneUseCoupon(int coupon_no) {
		mapper.oneUseCoupon(coupon_no);
		
	}



	@Override
	public void updateCouponCon() {
		mapper.updateCouponCon(mapper.selectPastCoupon());
		
	}

	@Override
	public HashMap<String, Object> getInfo(int coupon_no) {
		return mapper.getInfo(coupon_no);
	}

}
