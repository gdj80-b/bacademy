package com.goodee.bacademy.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.LectureVO;
import com.goodee.bacademy.vo.PagingVO;

@Mapper
public interface LectureMapper {
	
	// 강의 등록
	public int addLecture(LectureVO lecture);
	
	// 강의 목록
	public List<LectureVO> getLectureList(PagingVO paging);
	
	// 강의 상세
	public List<LectureVO> getLectureOne(int lectureNo);

	// 강의 수정
	public int modifyLecture(LectureVO lecture);
	
	// 강의 삭제
	public int deleteLecture(LectureVO lecture);
	
	// 페이징을 위한 총 강의 목록 개수
	public int getTotalRow(PagingVO paging);
	
	// 강의 등록 유효성 체크
	public List<LectureVO> lectureConfirm(String startDate, String endDate, String lectureDay, String roomNum, String id);
}
