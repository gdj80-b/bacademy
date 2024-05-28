package com.goodee.bacademy.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	// 강의 등록 페이지 이동
	@GetMapping("/addLectureForm")
	public String addLectureForm() {
		return "lecture/addLectureForm";
	}
	
	// addLectureAction
	// 강의 등록 액션
	@PostMapping("/lecture/addLecture")
	public String addLecture(LectureVO lecture) {
		int addLectureRow = lectureMapper.addLecture(lecture);
		
		if(addLectureRow == 1) {
			System.out.println("강의 등록 성공");
			return "redirect:/lectureList";		// 강의 등록 성공한 경우 강의목록으로 이동
		}else {
			System.out.println("강의 등록 실패");
			return "redirect:/addLectureForm";	// 강의 등록 실패한 경우 강의추가 페이지로 재요청
		}
	}
	
	// lectureList.jsp
	// 강의 목록 페이지
	@GetMapping("/lectureList")
	public String lectureList(Model model, @ModelAttribute("paging")PagingVO paging) {
		
		int totalRow = lectureMapper.getTotalRow(paging);	// 페이징을 위한 전체 강의 목록 수
		
		paging.setTotalRow(totalRow);
		paging.pageSetting();
		
		List<LectureVO> lectureList = lectureMapper.getLectureList(paging);
		model.addAttribute("lectureList", lectureList);
		return "lecture/lectureList";
	}
	
	// lectureOne.jsp
	// 강의 상세 페이지
	@GetMapping("/lectureOne")
	public String lectureOne(Model model, @RequestParam(value="lectureNo") int lectureNo) {
		List<LectureVO> lectureOneList = lectureMapper.getLectureOne(lectureNo);
		model.addAttribute("lectureOneList", lectureOneList);
		return "lecture/lectureOne";
	}
	
	// modifyLectureForm.jsp
	// 강의 수정 페이지 이동
	@GetMapping("/modifyLectureForm")
	public String modifyLectureForm(Model model, @RequestParam(value="lectureNo") int lectureNo) {
		List<LectureVO> lectureOneList = lectureMapper.getLectureOne(lectureNo);
		model.addAttribute("lectureOneList", lectureOneList);
		return "lecture/modifyLectureForm";
	}
	
	// modifyLectureAction
	// 강의 수정 액션
	@PostMapping("/lecture/modifyLecture")
	public String modifyLecture(LectureVO lecture) {
		
		int lectureNo = lecture.getLectureNo();
		
		int modifyLectureRow = lectureMapper.modifyLecture(lecture);
		
		if(modifyLectureRow == 1) {
			System.out.println("강의 수정 성공");
			return "redirect:/lectureOne?lectureNo=" + lectureNo;			// 강의 수정 성공 시 해당 강의상세 재요청
		}else {
			System.out.println("강의 수정 실패");
			return "redirect:/modifyLectureForm?lectureNo=" + lectureNo;	// 강의 수정 실패 시 강의 수정 폼으로 재요청
		}
	}
	
	// deleteLectureAction
	// 강의 삭제 액션
	@GetMapping("/deleteLecture")
	public String deleteLecture(LectureVO lecture) {
		
		int lectureNo = lecture.getLectureNo();
		
		int deleteLectureRow = lectureMapper.deleteLecture(lecture);
		
		if(deleteLectureRow == 1) {
			System.out.println("강의 삭제 성공");
			return "redirect:/lectureList";							// 강의 삭제 성공 시 강의목록 재요청
		}else {
			System.out.println("강의 삭제 실패");
			return "redirect:/lectureOne?lectureNo=" + lectureNo;	// 강의 삭제 실패 시 해당 강의상세 재요청
		}
	}
	
	// addLectureConfirm
	// 등록 가능한 강의 유효성 검사
	@ResponseBody // ajax에 data 전달하는 용도로 String 반환
	@GetMapping("/lectureConfirm")
	public int lectureConfirm(
			@RequestParam(value="startDate") String startDate, 
			@RequestParam(value="endDate") String endDate, 
			@RequestParam(value="lectureDay") String lectureDay, 
			@RequestParam(value="roomNum") String roomNum, 
			@RequestParam(value="id") String id) {
		
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);
		System.out.println("id : " + id);
		System.out.println("lectureDay : " + lectureDay);
		System.out.println("roomNum : " + roomNum);
		
		// 강의시작일, 강의종료일, 강의요일, 강의실, 강사 유효성 체크
		List<LectureVO> lecture = lectureMapper.lectureConfirm(startDate, endDate, lectureDay, roomNum, id);

		if(lecture.size() > 0) {
			return 0;	// 이미 존재하는 강의 정보, 등록 불가
		}
		return 1;	// 등록 가능한 강의
	}
	
}
