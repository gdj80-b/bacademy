package com.goodee.bacademy.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.goodee.bacademy.vo.PaymentVO;
import com.goodee.bacademy.vo.RefundVO;
import com.goodee.bacademy.vo.StudentVO;
@Mapper
public interface StudentPaymentMapper {
	
	// 조인환 : 학생 캐쉬내역 조회
	public List<PaymentVO> getMyCashList(String id);
	
	// 조인환 : 학생 본인 환불이력 조회
	public List<RefundVO> getMyRefundHistory(String Id);
	
	// 조인환 : 학생 환불요청
	public int insertRefundRequest(Map<String,Object> refundMap);
	
	// 조인환 : 학생 캐쉬 조회
	public String getMyCash(String id);
}
