package com.goodee.bacademy.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.CashHistoryVO;
import com.goodee.bacademy.vo.RefundVO;
import com.goodee.bacademy.vo.StudentVO;

@Mapper
public interface CashMapper {
	
	// 정건희 : 수납이력 조회
	public List<CashHistoryVO> getCashHistory();
	
	// 정건희 : 환불이력 조회
	public List<RefundVO> getRefundHistory();
	
	// 정건희 : 환불상태 변경(대기 > 승인)
	public int updateRefundState(Map<String, Object> refundMap);
	
	// 정건희 : 환불상태 변경(대기 > 승인)에 따른 학생 캐쉬 변경
	public int updateStudentCash(Map<String, Object> refundMap);
	
	// 정건희 : 환불상태 변경(대기 > 승인)에 따른 수납이력 기록
	public int insertCashHistory(Map<String, Object> refundMap);
	
	// 조인환 : 학생 캐쉬 충전
	public int insertCashHistoryToCharge(Map<String,Object> cashMap);
			
}
