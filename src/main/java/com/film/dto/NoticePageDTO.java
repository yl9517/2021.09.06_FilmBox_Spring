package com.film.dto;

import lombok.Getter;

public class NoticePageDTO {
	
	@Getter
	private int currPage;
	private int totalCount;
	private int pageSize;
	private int blockSize;
	
	private int startRow;

	private int endRow;

	private int startBlock;

	private int endBlock;
	
	@Getter
	private boolean prev;
	
	@Getter
	private boolean next;

	public NoticePageDTO(int currPage, int totalCount, int pageSize, int blockSize) {

		this.currPage = currPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		
		calRow();
		calBlock();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	private void calRow()
	{
		startRow=(currPage-1)*pageSize+1;
		endRow=startRow+pageSize-1;
		
		if(endRow>totalCount)
		{
			endRow=totalCount;
		}
	}
	
	private void calBlock()
	{
		startBlock=(((currPage-1)/blockSize)*blockSize)+1;
		endBlock=startBlock+blockSize-1;
		
		int totalPage=(int)Math.ceil(totalCount/(float)pageSize);
	
		if(endBlock>totalPage)
			endBlock=totalPage;
		
		prev=(startBlock==1)? false:true;
		next=(endBlock<totalPage)? true:false;
	}
	
}
