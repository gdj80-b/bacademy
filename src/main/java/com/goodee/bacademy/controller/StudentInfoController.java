package com.goodee.bacademy.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodee.bacademy.mapper.MemberInfoMapper;
import com.goodee.bacademy.vo.LectureVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentInfoController {
	
	private final String yellow = "\u001B[33m"; // 디버깅 색 변경용
	private final String reset = "\u001B[0m";
	
	@Autowired
	private MemberInfoMapper memberInfoMapper; //  mapper bean 의존성 주입
	
	@GetMapping("/studentMyPage")
	public String studentMainPage(@RequestParam(value = "lectureStatus", required = false) String lectureStatus, HttpSession session, RedirectAttributes rattr, Model model) {
		// 세션 로그인 여부 확인
		Map<String, String> loginInfo =(Map<String, String>) session.getAttribute("loginInfo");
		if (loginInfo == null) {
			rattr.addFlashAttribute("msgType", "잘못된 접근");
			rattr.addFlashAttribute("msg", "로그인을 먼저 해주세요.");
			return "redirect:/loginForm"; // 비로그인이면 로그인 url로 redirect
		}
		// studentMainPage 첫 방문시 setting
		if (lectureStatus == null || lectureStatus.isBlank()) {
			lectureStatus = "수강중";
		}
		loginInfo.put("lectureStatus", lectureStatus);
		List<LectureVO> lectureList = memberInfoMapper.getCurrentLectureList(loginInfo);
		model.addAttribute("lectureList", lectureList);

		return "studentInfo/studentMyPage"; // 학생전용 메인 페이지로 이동
	}
}

