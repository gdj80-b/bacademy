package com.goodee.bacademy.vo;

import lombok.Data;

@Data
public class LectureVO {
	private int lectureNo;
	private int categoryNo;
	private String lectureName;
	private String id;
	private String roomNum;
	private String startDate;
	private String endDate;
	private String lectureTime;
	private String lectureDay;
	private int lecturePrice;
	private String updateDate;
	private String createDate;
	
	// 강의상태 얻기 위한 임시 필드
	private String lectureStatus;

	private String category;	// 과목명을 가져오기 위해 추가
	private String name;		// 강사 이름을 가져오기 위해 추가
}
