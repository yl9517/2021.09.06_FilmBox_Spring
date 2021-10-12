package com.film.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.CouponDTO;
import com.film.dto.PointDTO;
import com.film.mapper.CouponMapper;
import com.film.mapper.MovieMapper;
import com.film.mapper.PointMapper;
import com.film.mapper.UserMapper;

@Service
public class CouponServiceImple implements CouponService{

	@Autowired
	private CouponMapper mapper;
	@Autowired
	private PointMapper pointMapper;
	@Autowired
	private UserMapper userMapper;

	
	@Override
	public void insertCoupon(CouponDTO dto) {
		mapper.insertCoupon(dto);
		 PointDTO pointdto = new PointDTO(dto.getMember_id(), (int) (dto.getCoupon_price()*0.05),"스토어 구매적립");//포인트 적립
		 pointMapper.changePoint(pointdto); //포인트 적립
		 
		 userMapper.updateMyPoint(dto.getMember_id()); //회원테이블 업뎃(포인트)
		
			//포인트 적립
			//회원테이블 업뎃
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

	@Override
	public List<HashMap<String, Object>> getRealCoupon(String member_id) {
		return mapper.getRealCoupon(member_id);
	}

}
