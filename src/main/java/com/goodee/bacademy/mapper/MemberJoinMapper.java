package com.goodee.bacademy.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.MemberVO;

@Mapper
public interface MemberJoinMapper {
	MemberVO checkId(String id);
	Map<String, Object> findId(Map<String, String> map);
	Map<String, Object> findPw(Map<String, String> map);
	int modifyPw(Map<String, String> map);
	int memberJoin(Map<String, String> map);
	int studentJoin(Map<String, String> map);
}
