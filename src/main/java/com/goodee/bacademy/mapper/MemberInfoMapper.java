package com.goodee.bacademy.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.LectureVO;

@Mapper
public interface MemberInfoMapper {
	List<LectureVO> getMyLectureList(String id);
	List<LectureVO> getCurrentLectureList(String id);
	Map<String, Object> getEmpOne(String id);
	
	// 정건희 : 직원 전체 조회
	public List<HashMap<String, Object>> getEmpList(int currengPage);
}
