package com.film.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.PointDTO;

@Mapper
public interface PointMapper {
	public void changePoint(PointDTO dto);
	public List<PointDTO> getMyPoints(PointDTO dto);
}
