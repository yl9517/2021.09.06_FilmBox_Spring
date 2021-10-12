package com.film.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.PointDTO;

@Mapper
public interface PointMapper {
	public void changePoint(PointDTO dto);
	
	public void changePointR(PointDTO dto);
	
	public List<PointDTO> getMyPointList(HashMap<String, Object> hmap);

	public PointDTO getUsePointData(int rev_no);
}
