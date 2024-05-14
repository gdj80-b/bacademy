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
	
	// 정건희 : 강사등록(로그인 관련 정보 입력)
	public int addMember(Map<String, String> insertMemberInfo);
	
	// 정건희 : 강사등록(강사 개인정보 입력)
	public int addTeacher(Map<String, String> insertTeacherInfo);
	
	// 정건희 : 강사수정(멤버 테이블 상태 변경 재직 > 퇴직)
	public int updateMember(String id);
	
	// 정건희 : 강사삭제(강사 테이블에서 데이터 삭제)
	public int deleteTeacher(String id);
}
