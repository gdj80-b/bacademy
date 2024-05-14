package com.goodee.bacademy.vo;

import lombok.Data;

@Data
public class RefundVO {
	private int refundNo;
	private String id;
	private String state;
	private String requestDate;
	private String acceptDate;
	private int refundCash;
	
	// state에 따른 요청날짜 or 승인날짜 합친변수
	private String date;
	
	// 외래키로 받아 올 학생 이름
	private String name;
}
