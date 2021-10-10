package com.film.service;

import java.util.HashMap;
import java.util.List;

import com.film.dto.CouponDTO;

public interface CouponService {
	public void insertCoupon(CouponDTO dto);
	public List<HashMap<String, Object>> getMyCoupon(String member_id);
	
	//사용함
	public void oneUseCoupon(int coupon_no);
	
	//날짜 지남
	public void updateCouponCon();
	
	public HashMap<String, Object> getInfo(int coupon_no);
	public List<HashMap<String, Object>> getRealCoupon(String member_id);
}
