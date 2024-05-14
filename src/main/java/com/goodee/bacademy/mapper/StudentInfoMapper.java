package com.goodee.bacademy.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.StudentVO;

@Mapper
public interface StudentInfoMapper {
	StudentVO getStudentOne(String id);
}
