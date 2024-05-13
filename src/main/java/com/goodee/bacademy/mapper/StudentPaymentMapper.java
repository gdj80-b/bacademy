package com.goodee.bacademy.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.goodee.bacademy.vo.PaymentVO;
@Mapper
public interface StudentPaymentMapper {
	public List<PaymentVO> getMyCashList();
}
