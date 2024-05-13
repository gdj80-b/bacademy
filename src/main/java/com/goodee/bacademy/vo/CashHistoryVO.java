package com.goodee.bacademy.vo;

import lombok.Data;

@Data
public class CashHistoryVO {
	private int cash_no;
	private String id;
	private int cash;
	private String reason;
	private String create_date;
	
	// 외래키로 받아 올 학생 이름
	private String name;
	
	// 잔액
	private int balance;
}
