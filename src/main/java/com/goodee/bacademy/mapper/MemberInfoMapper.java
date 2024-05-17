package com.goodee.bacademy.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.LectureVO;
import com.goodee.bacademy.vo.PagingVO;

@Mapper
public interface MemberInfoMapper {
	
	// 차성호 : 나의 강의 목록 조회
	List<LectureVO> getMyLectureList(String id);
	
	// 차성호 : 현재 강의 목록 조회
	List<LectureVO> getCurrentLectureList(Map<String, String> lectureInfo);
	
	// 차성호 : 직원 상세 조회
	Map<String, Object> getEmpOne(String id);
	
	// 정건희 : 직원 전체 조회
	public List<HashMap<String, Object>> getEmpList(PagingVO paging);
	
	// 정건희 : 총 직원 수
	public int getTotalEmpRow(PagingVO paging);
}
