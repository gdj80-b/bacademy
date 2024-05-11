package com.goodee.bacademy.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.Lecture;

@Mapper
public interface LectureMapper {
	
	int addLecture(Lecture lecture); // 강의 등록

}
