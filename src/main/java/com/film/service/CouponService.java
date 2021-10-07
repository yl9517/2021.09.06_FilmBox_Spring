package com.film.service;

import java.util.HashMap;
import java.util.List;

import com.film.dto.CouponDTO;

public interface CouponService {
	public void insertCoupon(CouponDTO dto);
	public List<HashMap<String, Object>> getMyCoupon(String member_id);
}
