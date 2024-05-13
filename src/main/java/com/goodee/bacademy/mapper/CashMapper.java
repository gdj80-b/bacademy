package com.goodee.bacademy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.CashHistoryVO;
import com.goodee.bacademy.vo.RefundVO;

@Mapper
public interface CashMapper {
	
	// 수납이력 조회
	public List<CashHistoryVO> getCashHistory();
	
	// 환불이력 조회
	public List<RefundVO> getRefundHistory();
	
	// 환불상태 변경(대기 > 승인)
	public int updateRefundState(int refund_no, String state);
	
	// 환불상태 변경(대기 > 승인)에 따른 학생 캐쉬 변경
	public int updateStudentCash(String id, int refund_cash);
	
	// 환불상태 변경(대기 > 승인)에 따른 수납이력 기록
	public int insertCashHistoryToRefund(String id, int refund_cash);
	
	// 학생 환불이력 조회
	public List<RefundVO> getMyRefundHistory(String Id);
	
	// 학생 캐쉬 충전
	public int insertCashHistoryToCharge(String id, String price);
}
