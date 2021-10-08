package com.film.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.CouponDTO;

@Mapper
public interface CouponMapper {
	public void insertCoupon(CouponDTO dto);
	public List<HashMap<String, Object>> getMyCoupon(String member_id);
	
	//사용함
	public void oneUseCoupon(int coupon_no);
	
	//날짜 지남
	public List<HashMap<String, Object>> selectPastCoupon();
	public void updateCouponCon(List<HashMap<String, Object>> map);
}
