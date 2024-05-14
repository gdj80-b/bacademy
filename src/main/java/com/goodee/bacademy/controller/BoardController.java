package com.goodee.bacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.bacademy.mapper.BoardMapper;
import com.goodee.bacademy.vo.BoardVO;
import com.goodee.bacademy.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BoardController {
	
	@Autowired
	private final BoardMapper boardMapper;

	@GetMapping("/boardList")
	public String boardList(Model model) {
		List<BoardVO> boardList = boardMapper.getBoard();
		model.addAttribute("boardList", boardList);
		return "boardList";
	}
	
		@GetMapping("/addBoardForm")
		public String addBoardForm() {
			return "addBoardForm";
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
		
		@GetMapping("/boardOne")
		public String boardDetail(@RequestParam("boardNo") int boardNo, Model model) {
			BoardVO boardOne = boardMapper.getBoardOne(boardNo);
			model.addAttribute("boardOne", boardOne);
			return "boardOne";
		}
		
		@GetMapping("/modifyBoardForm")
		public String ModifyBoardForm(@RequestParam("boardNo") int boardNo, Model model) {
			BoardVO boardVO = boardMapper.getBoardOne(boardNo);
			model.addAttribute("boardVO", boardVO);
			return "boardOneModifyForm";
		}

		@PostMapping("/modifyBoard")
		public String modifyBoardAction(BoardVO board) { 
			boardMapper.modifyBoard(board);
			return "redirect:boardList";
		}

		@GetMapping("/deleteBoard")
		public String deleteBoardAction (@RequestParam("boardNo") int boardNo) { 
			boardMapper.deleteBoard(boardNo); 		
			return "redirect:boardList";
		}	
		
}
