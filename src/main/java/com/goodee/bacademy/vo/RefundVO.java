package com.goodee.bacademy.vo;

import lombok.Data;

@Data
public class RefundVO {
	private int refund_no;
	private String id;
	private String state;
	private String request_date;
	private String accept_date;
	private int refund_cash;
	
	// 외래키로 받아 올 학생 이름
	private String name;
}
