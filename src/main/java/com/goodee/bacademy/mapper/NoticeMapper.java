package com.goodee.bacademy.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.goodee.bacademy.vo.Notice;

@Mapper
public interface NoticeMapper {

	// 공지사항 조회
	public List<Notice> getNotice();
	
	// 공지사항 추가
	int addNotice(Notice vo);
	
	// 공지사항 상세보기
	Notice getNoticeOne(Integer noticeNo);

	// 공지사항 수정
	public void modifyNotice(Notice vo);
	
	// 공지사항 삭제
	public void deleteNotice(Integer noticeNo);
}
