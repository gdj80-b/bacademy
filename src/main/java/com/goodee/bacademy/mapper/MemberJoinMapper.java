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
	
	// 강사등록(로그인 관련 정보 입력)
	public int addMember(Map<String, String> insertMemberInfo);
	
	// 강사등록(강사 개인정보 입력)
	public int addTeacher(Map<String, String> insertTeacherInfo);
}
