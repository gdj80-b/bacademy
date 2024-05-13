package com.goodee.bacademy.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.bacademy.mapper.NoticeMapper;
import com.goodee.bacademy.vo.Notice;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class NoticeController {

	private final NoticeMapper noticeMapper;

	// 공지사항 조회
	@GetMapping("/noticeList")
	public String noticeList(Model model) {
		List<Notice> noticeList = noticeMapper.getNotice();
		System.out.println("noticeList:" + noticeList);
		model.addAttribute("noticeList", noticeList);
		return "noticeList";
	}

	// 공지사항 등록 페이지
	@GetMapping("/addNoticeForm")
	public String addNoticeForm() {
		return "addNoticeForm";
	}

	// 공지사항 등록 액션
	@PostMapping("/addNotice")
	public String addNoticeAction(Notice vo) {
		
		System.out.println("vo:" + vo);
		
		String result = "";

		int addRow = noticeMapper.addNotice(vo);
		System.out.println("addRow:" + addRow);

		if (addRow == 1) {
			result = "redirect:/noticeList";
		} else {
			result = "redirect:/addNoticeForm";
		}
		return result;
	}

	// 공지사항 상세보기
	@GetMapping("/noticeOne/{noticeNo}")
	public String noticeDetail(@PathVariable Integer noticeNo, Model model) {
		Notice noticeOne = noticeMapper.getNoticeOne(noticeNo);
		System.out.println("noticeOne:" + noticeOne);
		model.addAttribute("noticeOne", noticeOne);
		return "noticeOne";
	}

	// 공지사항 수정 페이지
	@GetMapping("/ModifynoticeForm/{noticeNo}")
	public String ModifynoticeForm(@PathVariable Integer noticeNo, Model model) {
		Notice noticeVO = noticeMapper.getNoticeOne(noticeNo);
		System.out.println("noticeVO:" + noticeVO);
		model.addAttribute("noticeVo", noticeVO);
		return "noticeOneModifyForm"; // boardUpdate.jsp
	}

	// 공지사항 수정
	@PostMapping("/modifyNotice")
	public String modifyNoticeAction(Notice notice) { 
		noticeMapper.modifyNotice(notice);
		System.out.println(notice);
		return "redirect:/noticeList";
	}

	// 공지사항 삭제
	@GetMapping("/deleteNotice/{noticeNo}")
	public String deleteNoticeAction (@PathVariable Integer noticeNo) { 
		noticeMapper.deleteNotice(noticeNo); //삭제		
		return "redirect:/noticeList";
	}	
}
