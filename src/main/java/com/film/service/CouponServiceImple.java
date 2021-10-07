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

}
