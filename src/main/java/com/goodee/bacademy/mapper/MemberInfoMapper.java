package com.goodee.bacademy.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.LectureVO;

@Mapper
public interface MemberInfoMapper {
	List<LectureVO> getMyLectureList(String id);
	List<LectureVO> getCurrentLectureList(Map<String, String> lectureInfo);
	Map<String, Object> getEmpOne(String id);
	
}
