package com.goodee.bacademy.vo;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String pw;
	private String phoneNum;
	private int grade;
	private String state;
}
