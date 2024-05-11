package com.goodee.bacademy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.CashHistory;
import com.goodee.bacademy.vo.Refund;

@Mapper
public interface CashMapper {
	public List<CashHistory> getCashHistory();
	public List<Refund> getRefundHistory();
}
