package com.goodee.bacademy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.bacademy.vo.CommentVO;

@Mapper
public interface CommentMapper {
	
	// 댓글 조회
	public List<CommentVO> getComment (int boardNo);
	
	// 댓글 작성
	public int addComment(CommentVO vo);
	
	// 댓글 수정
	public int modifytCommentAction(int boardNo, int commentNo, String content);
	
	// 댓글 삭제
	public int deleteCommentAction(int boardNo, int commentNo);
}
