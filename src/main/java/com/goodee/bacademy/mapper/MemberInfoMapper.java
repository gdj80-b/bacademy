package com.goodee.bacademy.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.LectureVO;
import com.goodee.bacademy.vo.PagingVO;

@Mapper
public interface MemberInfoMapper {
	List<LectureVO> getMyLectureList(String id);
	List<LectureVO> getCurrentLectureList(Map<String, String> lectureInfo);
	Map<String, Object> getEmpOne(String id);
	
	// 정건희 : 직원 전체 조회
	public List<HashMap<String, Object>> getEmpList(PagingVO paging);
	
	// 정건희 : 총 직원 수
	public int getTotalEmpRow(PagingVO paging);
}
