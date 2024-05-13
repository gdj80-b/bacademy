package com.goodee.bacademy.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.Lecture;

@Mapper
public interface LectureMapper {
	
	public int addLecture(Lecture lecture); // 강의 등록
	
	public List<Lecture> getLectureList();	// 강의 목록
	
	public List<Lecture> getLectureOne(int lectureNo); // 강의 상세

}
