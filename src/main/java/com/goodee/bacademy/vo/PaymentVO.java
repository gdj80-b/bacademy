package com.goodee.bacademy.vo;
// 내 캐쉬내역 ( cashHistoryVO + LectureVO)

import lombok.Data;

@Data
public class PaymentVO {
	
	
	// 마이캐쉬 
	private String state;  			// JOIN으로 수강, 수납테이블에서 가져온 컬럼
	private String date;			// JOIN으로 수강, 수납테이블에서 가져온 컬럼
	private String info;			// JOIN으로 강의테이블에서 가져온 컬럼
	private String chargeCash;		// JOIN으로 수납,강의 테이블에서 가져온 컬럼
	private String applicationNum;	// JOIN으로 수강테이블에서 가져온 컬럼
	private String lectureNum;		// JOIN으로 강의테이블에서 가져온 컬럼
	private String payNum;			// JOIN으로 수납테이블에서 가져온 컬럼
	
	private String balance;
}
