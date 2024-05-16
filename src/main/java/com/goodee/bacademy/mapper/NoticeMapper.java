package com.goodee.bacademy.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.goodee.bacademy.vo.NoticeVO;
import com.goodee.bacademy.vo.PagingVO;

@Mapper
public interface NoticeMapper {

	// 공지사항 조회
	public List<NoticeVO> getNotice(PagingVO paging);
	
	// 공지사항 추가
	int addNotice(NoticeVO vo);
	
	// 공지사항 상세보기
	public NoticeVO getNoticeOne(Integer noticeNo);

	// 공지사항 수정
	public void modifyNotice(NoticeVO vo);
	
	// 공지사항 삭제
	public void deleteNotice(Integer noticeNo);
	
	public int getTotalRow(PagingVO paging);
}