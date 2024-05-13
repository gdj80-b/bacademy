package com.goodee.bacademy.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {
	private Integer noticeNo;
	private String id;
	private String title;
	private String content;
	private String writer;
	private String updateDate;
	private String createDate;
	private Integer count;
}
