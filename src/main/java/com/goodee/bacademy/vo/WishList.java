package com.goodee.bacademy.vo;

import lombok.Data;

@Data
public class WishList {
	private String lecture_no;		// JOIN으로 강의 테이블에서 가져온 컬럼
	private String lecture_name;	// JOIN으로 강의 테이블에서 가져온 컬럼
	private String lecture_price;	// JOIN으로 강의 테이블에서 가져온 컬럼
	private String room_num;		// JOIN으로 강의 테이블에서 가져온 컬럼
	private String lecture_time;	// JOIN으로 강의 테이블에서 가져온 컬럼
	private String lecture_day;		// JOIN으로 강의 테이블에서 가져온 컬럼
	private String start_date;		// JOIN으로 강의 테이블에서 가져온 컬럼
	private String end_date;		// JOIN으로 강의 테이블에서 가져온 컬럼
}
