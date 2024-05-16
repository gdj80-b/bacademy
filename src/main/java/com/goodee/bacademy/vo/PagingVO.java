package com.goodee.bacademy.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class PagingVO implements Serializable{
	
	// 입력받는 데이터
	private int currentPage = 1;	// 현재 페이지 번호
	private int rowPerPage = 10;	// 페이지 당 레코드 수
	private int pageSize = 5;		// 리스트에서 보여줄 페이지 개수
	private int totalRow;			// 총 레코드 수
	
	// 입력받는 데이터를 통해 계산
	private int firstRow;			// 시작 레코드 번호
	private int lastRow;			// 마지막 레코드 번호
	private int totalPage;			// 총 페이지 개수
	private int firstPage;			// 시작 페이지 번호
	private int lastPage;			// 마지막 페이지 번호
	
	public void pageSetting() {
		totalPage = (totalRow - 1) / rowPerPage + 1;
		firstRow = (currentPage - 1) * rowPerPage + 1;
		lastRow = firstRow + rowPerPage - 1;
		if(lastRow >= totalRow) {
			lastRow = totalRow;
		}
		
		firstPage = ((currentPage - 1) / pageSize) * pageSize + 1;
		
		lastPage = firstPage + pageSize + 1;
		lastPage = firstPage + pageSize - 1;
		if(lastPage > totalPage) {
			lastPage = totalPage;
		}
	}
}
