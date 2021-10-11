package com.film.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.NoticeDTO;
import com.film.mapper.NoticeMapper;

@Service
public class NoticeServiceImple implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public void noticeInsert(NoticeDTO dto) {
		
		int result=mapper.noticeInsert(dto);
	}

	@Override
	public List<NoticeDTO> noticeList(int startRow, int endRow) {
		HashMap<String, Object> hm=new HashMap<>();
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		
		return mapper.noticeList(hm);
	}

	@Override
	public NoticeDTO noticeDetail(int notice_no) {
		
		return mapper.noticeDetail(notice_no);
	}

	@Override
	public void noticeModify(NoticeDTO dto) {
		
		mapper.noticeModify(dto);
	}

	@Override
	public void noticeDelete(NoticeDTO dto) {
		
		mapper.noticeDelete(dto);
		
	}

	@Override
	public int totalCount() {
		
		return mapper.totalCount();
	}

	@Override
	public int updateReadno(int notice_no) {
		
		return mapper.updateReadno(notice_no);
	}

	@Override
	public void noticeModify2(NoticeDTO dto) {
		
		mapper.noticeModify2(dto);
	}
	
	



	
}
