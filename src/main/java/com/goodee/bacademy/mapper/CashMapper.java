package com.goodee.bacademy.mapper;

import java.util.List;
import java.util.Map;

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
	public int updateRefundState(Map<String, Object> refundMap);
	
	// 환불상태 변경(대기 > 승인)에 따른 학생 캐쉬 변경
	public int updateStudentCash(Map<String, Object> refundMap);
	
	// 환불상태 변경(대기 > 승인)에 따른 수납이력 기록
	public int insertCashHistory(Map<String, Object> refundMap);
	
	// 학생 캐쉬 충전
	public int insertCashHistoryToCharge(Map<String,Object> cashMap);
	
	// 학생 환불이력 조회
	public List<RefundVO> getMyRefundHistory(String Id);
	
}
