package com.goodee.bacademy.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.bacademy.mapper.LectureMapper;
import com.goodee.bacademy.vo.LectureVO;
import com.goodee.bacademy.vo.PagingVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {
	
	@Autowired
	private LectureMapper lectureMapper;
	
	// addLectureForm.jsp
	@GetMapping("/addLectureForm")
	public String addLectureForm() {
		return "lecture/addLectureForm";
	}
	
	// addLectureAction
	@PostMapping("/lecture/addLecture")
	public String addLecture(LectureVO lecture) {
		int addLectureRow = lectureMapper.addLecture(lecture);
		
		if(addLectureRow == 1) {
			System.out.println("강의 등록 성공");
			return "redirect:/lectureList";
		}else {
			System.out.println("강의 등록 실패");
			return "redirect:/addLectureForm";
		}
	}
	
	// lectureList.jsp
	@GetMapping("/lectureList")
	public String lectureList(Model model, @ModelAttribute("paging")PagingVO paging) {
		
		int totalRow = lectureMapper.getTotalRow(paging);
		
		paging.setTotalRow(totalRow);
		paging.pageSetting();
		
		List<LectureVO> lectureList = lectureMapper.getLectureList(paging);
		model.addAttribute("lectureList", lectureList);
		return "lecture/lectureList";
	}
	
	// lectureOne.jsp
	@GetMapping("/lectureOne")
	public String lectureOne(Model model, @RequestParam(value="lectureNo") int lectureNo) {
		List<LectureVO> lectureOneList = lectureMapper.getLectureOne(lectureNo);
		model.addAttribute("lectureOneList", lectureOneList);
		return "lecture/lectureOne";
	}
	
	// modifyLectureForm.jsp
	@GetMapping("/modifyLectureForm")
	public String modifyLectureForm(Model model, @RequestParam(value="lectureNo") int lectureNo) {
		List<LectureVO> lectureOneList = lectureMapper.getLectureOne(lectureNo);
		model.addAttribute("lectureOneList", lectureOneList);
		return "lecture/modifyLectureForm";
	}
	
	// modifyLectureAction
	@PostMapping("/lecture/modifyLecture")
	public String modifyLecture(LectureVO lecture) {
		
		int lectureNo = lecture.getLectureNo();
		
		int modifyLectureRow = lectureMapper.modifyLecture(lecture);
		
		if(modifyLectureRow == 1) {
			System.out.println("강의 수정 성공");
			return "redirect:/lectureOne?lectureNo=" + lectureNo;
		}else {
			System.out.println("강의 수정 실패");
			return "redirect:/modifyLectureForm?lectureNo=" + lectureNo;
		}
	}
	
	// deleteLectureAction
	@GetMapping("/deleteLecture")
	public String deleteLecture(LectureVO lecture) {
		
		int lectureNo = lecture.getLectureNo();
		
		int deleteLectureRow = lectureMapper.deleteLecture(lecture);
		
		if(deleteLectureRow == 1) {
			System.out.println("강의 삭제 성공");
			return "redirect:/lectureList";
		}else {
			System.out.println("강의 삭제 실패");
			return "redirect:/lectureOne?lectureNo=" + lectureNo;
		}
	}
	
}
