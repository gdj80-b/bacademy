package com.goodee.bacademy.vo;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeNo;
	private String id;
	private String title;
	private String content;
	private String updateDate;
	private String createDate;
}