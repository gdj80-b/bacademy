package com.goodee.bacademy.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.bacademy.mapper.NoticeMapper;
import com.goodee.bacademy.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class NoticeController {

	@Autowired
	private final NoticeMapper noticeMapper;

	// 공지사항 조회
	@GetMapping("/noticeList")
	public String noticeList(Model model) {
		List<NoticeVO> noticeList = noticeMapper.getNotice();
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
	public String addNoticeAction(NoticeVO vo) {
		
		System.out.println("vo:" + vo);
		
		String result = "";

		int addRow = noticeMapper.addNotice(vo);
		System.out.println("addRow:" + addRow);

		if (addRow == 1) {
			result = "redirect:noticeList";
		} else {
			result = "redirect:addNoticeForm";
		}
		return result;
	}

	// 공지사항 상세보기
	@GetMapping("/noticeOne")
	public String noticeDetail(@RequestParam("noticeNo") Integer noticeNo, Model model) {
		NoticeVO noticeOne = noticeMapper.getNoticeOne(noticeNo);
		System.out.println("noticeOne:" + noticeOne);
		model.addAttribute("noticeOne", noticeOne);
		return "noticeOne";
	}

	// 공지사항 수정 페이지
	@GetMapping("/modifyNoticeForm")
	public String ModifynoticeForm(@RequestParam("noticeNo") Integer noticeNo, Model model) {
		NoticeVO noticeVO = noticeMapper.getNoticeOne(noticeNo);
		System.out.println("noticeVO:" + noticeVO);
		model.addAttribute("noticeVO", noticeVO);
		return "noticeOneModifyForm";
	}

	// 공지사항 수정
	@PostMapping("/modifyNotice")
	public String modifyNoticeAction(NoticeVO notice) { 
		noticeMapper.modifyNotice(notice);
		return "redirect:noticeList";
	}

	// 공지사항 삭제
	@GetMapping("/deleteNotice")
	public String deleteNoticeAction (@RequestParam("noticeNo") Integer noticeNo) { 
		noticeMapper.deleteNotice(noticeNo); //삭제		
		return "redirect:noticeList";
	}	
}