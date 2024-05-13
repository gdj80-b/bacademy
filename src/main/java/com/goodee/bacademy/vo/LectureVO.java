package com.goodee.bacademy.vo;

import lombok.Data;

@Data
public class LectureVO {
	private int lectureNo;
	private String category;
	private String lectureName;
	private String id;
	private int roomNum;
	private String startDate;
	private String endDate;
	private String lectureTime;
	private String lectureDay;
	private int lecturePrice;
	private String updateDate;
	private String createDate;
	// 강의상태 얻기 위한 임시 필드
	private String lectureStatus;
}
