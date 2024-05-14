package com.goodee.bacademy.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.LectureVO;
import com.goodee.bacademy.vo.TeacherVO;

@Mapper
public interface MemberInfoMapper {
	List<LectureVO> getMyLectureList(String id);
	Map<String, Object> getEmpOne(String id);
	
	// 정건희 : 직원 전체 조회
	public List<TeacherVO> getEmpList(int currengPage);
}
