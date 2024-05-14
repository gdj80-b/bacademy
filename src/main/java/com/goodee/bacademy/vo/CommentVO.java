package com.goodee.bacademy.vo;

import lombok.Data;

@Data
public class CommentVO {
	private int commentNo;
	private int boardNo;
	private String id;
	private String content;
	private String updateDate;
	private String createDate;
}
