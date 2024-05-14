package com.goodee.bacademy.vo;

import lombok.Data;

@Data
public class WishListVO {
	private String lectureNo;		// JOIN으로 강의 테이블에서 가져온 컬럼
	private String lectureName;		// JOIN으로 강의 테이블에서 가져온 컬럼
	private String lecturePrice;	// JOIN으로 강의 테이블에서 가져온 컬럼
	private String roomNum;			// JOIN으로 강의 테이블에서 가져온 컬럼
	private String lectureTime;		// JOIN으로 강의 테이블에서 가져온 컬럼
	private String lectureDay;		// JOIN으로 강의 테이블에서 가져온 컬럼
	private String startDate;		// JOIN으로 강의 테이블에서 가져온 컬럼
	private String endDate;			// JOIN으로 강의 테이블에서 가져온 컬럼
}
