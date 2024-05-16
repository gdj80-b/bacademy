package com.goodee.bacademy.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.bacademy.mapper.BoardMapper;
import com.goodee.bacademy.mapper.CommentMapper;
import com.goodee.bacademy.vo.BoardVO;
import com.goodee.bacademy.vo.CommentVO;
import com.goodee.bacademy.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BoardController {
	
	@Autowired
	private final BoardMapper boardMapper;
	
	@Autowired
	private final CommentMapper commentMapper;

	@GetMapping("/boardList")
	public String boardList(Model model) {
		List<BoardVO> boardList = boardMapper.getBoard();
		model.addAttribute("boardList", boardList);
		return "board/boardList";
	}
	
		@GetMapping("/addBoardForm")
		public String addBoardForm() {
			return "board/addBoardForm";
	}
		
		@PostMapping("/addBoard")
		public String addBoardAction(BoardVO vo) {
			
			String result = "";

			int addRow = boardMapper.addBoard(vo);

			if (addRow == 1) {
				result = "redirect:boardList";
			} else {
				result = "redirect:addBoardForm";
			}
			return result;
		}	
		
		@PostMapping("/addComment")
		public String addComment(@RequestParam("boardNo") int boardNo, CommentVO vo) {
			
			String result = "";
			
			int addCommentRow = commentMapper.addComment(vo);
			
			if (addCommentRow == 1) {
				result = "redirect:boardOne?boardNo=" + boardNo;
			} else {
				result = "redirect:boardOne?boardNo=" + boardNo;
			}
			return result;
		}
		
		@GetMapping("/boardOne")
		public String boardDetail(@RequestParam("boardNo") int boardNo, Model model) {
			BoardVO boardOne = boardMapper.getBoardOne(boardNo);
			List<CommentVO> comments = commentMapper.getComment(boardNo);
			model.addAttribute("boardOne", boardOne);
			model.addAttribute("comments", comments);
			return "board/boardOne";
		}
		
		@GetMapping("/modifyBoardForm")
		public String ModifyBoardForm(@RequestParam("boardNo") int boardNo, Model model) {
			BoardVO boardVO = boardMapper.getBoardOne(boardNo);
			model.addAttribute("boardVO", boardVO);
			return "board/boardOneModifyForm";
		}

		@PostMapping("/modifyBoard")
		public String modifyBoardAction(BoardVO board) { 
			boardMapper.modifyBoard(board);
			return "redirect:boardList";
		}
		
		@PostMapping("/modifyComment")
		public String modifyCommentAction(@RequestParam("commentNo") int commentNo, @RequestParam("boardNo") int boardNo, @RequestParam("content") String content) { 
			commentMapper.modifytCommentAction(boardNo, commentNo, content);
			return "redirect:boardOne?boardNo=" + boardNo;
		}

		@GetMapping("/deleteBoard")
		public String deleteBoardAction (@RequestParam("boardNo") int boardNo) { 
			boardMapper.deleteBoard(boardNo); 		
			return "redirect:boardList";
		}	
		
		@GetMapping("/deleteComment")
		public String deleteCommentAction (@RequestParam("commentNo") int commentNo, @RequestParam("boardNo") int boardNo) { 
			commentMapper.deleteCommentAction(boardNo, commentNo); 		
			return "redirect:boardOne?boardNo=" + boardNo;
		}	
}