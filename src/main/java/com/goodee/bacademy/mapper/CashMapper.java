package com.goodee.bacademy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.CashHistory;
import com.goodee.bacademy.vo.Refund;

@Mapper
public interface CashMapper {
	
	// 수납이력 조회
	public List<CashHistory> getCashHistory();
	
	// 환불이력 조회
	public List<Refund> getRefundHistory();
	
	// 환불상태 변경(대기 > 승인)
	public int updateRefundState(int refund_no, String state);
	
	// 환불상태 변경(대기 > 승인)에 따른 학생 캐쉬 변경
	public int updateStudentCash(String id, int refund_cash);
	
	// 환불상태 변경(대기 > 승인)에 따른 수납이력 기록
	public int insertCashHistory(String id, int refund_cash);
}
