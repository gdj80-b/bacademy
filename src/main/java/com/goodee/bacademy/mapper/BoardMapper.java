package com.goodee.bacademy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.BoardVO;
import com.goodee.bacademy.vo.NoticeVO;

@Mapper
public interface BoardMapper {

	// 게시글 조회
	public List<BoardVO> getBoard();

	int addBoard(BoardVO vo);

	public BoardVO getBoardOne(int boardNo);

	public void modifyBoard(BoardVO vo);

	public void deleteBoard(int boardNo);
}