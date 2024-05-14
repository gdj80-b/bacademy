package com.goodee.bacademy.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo;
	private String id;
	private int lectureNo;
	private String category;
	private String title;
	private String content;
	private String updateDate;
	private String createDate;
}