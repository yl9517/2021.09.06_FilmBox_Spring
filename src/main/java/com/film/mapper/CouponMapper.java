package com.film.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.CouponDTO;

@Mapper
public interface CouponMapper {
	public void insertCoupon(CouponDTO dto);
	public List<HashMap<String, Object>> getMyCoupon(String member_id);
}
