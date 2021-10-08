package com.film.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.NoticeDTO;

@Mapper
public interface NoticeMapper {

	public int noticeInsert(NoticeDTO dto);
	public List<NoticeDTO> noticeList(HashMap<String, Object> hm);
	public NoticeDTO noticeDetail(int notice_no);
	public void noticeModify(NoticeDTO dto);
	public void noticeDelete(NoticeDTO dto);
	public int totalCount();
	public int updateReadno(int notice_no);

}
