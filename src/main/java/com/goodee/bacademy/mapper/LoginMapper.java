package com.goodee.bacademy.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.MemberVO;

@Mapper
public interface LoginMapper {
	Map<String, Object> validateMember(MemberVO member);
	
}
