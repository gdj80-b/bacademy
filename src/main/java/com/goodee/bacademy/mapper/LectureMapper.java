package com.goodee.bacademy.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.LectureVO;

@Mapper
public interface LectureMapper {
	
	// 강의 등록
	public int addLecture(LectureVO lecture);
	
	// 강의 목록
	public List<LectureVO> getLectureList();
	
	// 강의 상세
	public List<LectureVO> getLectureOne(int lectureNo);

	// 강의 수정
	public int modifyLecture(LectureVO lecture);
	
	// 강의 삭제
	public int deleteLecture(LectureVO lecture);
}
