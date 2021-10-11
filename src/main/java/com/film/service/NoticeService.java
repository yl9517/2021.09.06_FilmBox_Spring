package com.film.service;

import java.util.List;

import com.film.dto.NoticeDTO;

public interface NoticeService {

	public void noticeInsert(NoticeDTO dto);
	public List<NoticeDTO> noticeList(int startRow, int endRow);
	public int totalCount();
	public NoticeDTO noticeDetail(int notice_no);
	public void noticeModify(NoticeDTO dto);
	public void noticeDelete(NoticeDTO dto);
	public int updateReadno(int notice_no);
	public void noticeModify2(NoticeDTO dto);
}
