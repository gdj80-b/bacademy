package com.goodee.bacademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodee.bacademy.mapper.LectureMapper;
import com.goodee.bacademy.mapper.MemberInfoMapper;
import com.goodee.bacademy.vo.LectureVO;
import com.goodee.bacademy.vo.PagingVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class MemberInfoController {
	
	private final String yellow = "\u001B[33m"; // 디버깅 색 변경용
	private final String reset = "\u001B[0m";
	
	@Autowired
	private MemberInfoMapper memberInfoMapper; //  mapper bean 의존성 주입
	
	@Autowired
	private LectureMapper lectureMapper;
	
	@GetMapping("/studentMainPage")
	public String studentMainPage(@ModelAttribute("paging") PagingVO paging,HttpSession session, RedirectAttributes rattr, Model model) {
		// 세션 로그인 여부 확인
		Map<String, String> loginInfo =(Map<String, String>) session.getAttribute("loginInfo");
		if (loginInfo == null) {
			rattr.addFlashAttribute("msgType", "잘못된 접근");
			rattr.addFlashAttribute("msg", "로그인을 먼저 해주세요.");
			return "redirect:/loginForm"; // 비로그인이면 로그인 url로 redirect
		}
		// 첫 방문인지 체크해서 메시지 한 번만 표시
		int visitCount = (int)session.getAttribute("visitCount");
		if (visitCount  == 0) {
			model.addAttribute("msgType", "로그인 성공 메시지");
			model.addAttribute("msg", loginInfo.get("name") + "님, 환영합니다.");
			visitCount++;
			session.setAttribute("visitCount", visitCount);
		}
		
		int totalRow = lectureMapper.getTotalRow(paging);
		
		paging.setTotalRow(totalRow);
		paging.pageSetting();
		
		List<LectureVO> lectureList = lectureMapper.getLectureList(paging);
		model.addAttribute("lectureList", lectureList);

		
		return "memberInfo/studentMainPage"; // 학생전용 메인 페이지로 이동
	}
	
	@GetMapping("/teacherMainPage")
	public String teacherMainPage(HttpSession session, RedirectAttributes rattr, Model model) {
		// 세션 로그인 여부 확인
		Map<String, Object> loginInfo =(Map<String, Object>) session.getAttribute("loginInfo");
		if (loginInfo == null) {
			rattr.addFlashAttribute("msgType", "잘못된 접근");
			rattr.addFlashAttribute("msg", "로그인을 먼저 해주세요.");
			return "redirect:/loginForm"; // 비로그인이면 로그인 url로 redirect
		}
		// 첫 방문인지 체크해서 메시지 한 번만 표시
		int visitCount = (int)session.getAttribute("visitCount");
		if (visitCount  == 0) {
			model.addAttribute("msgType", "로그인 성공 메시지");
			model.addAttribute("msg", loginInfo.get("name") + "님, 환영합니다.");
			visitCount++;
			session.setAttribute("visitCount", visitCount);
		}
		
		return "memberInfo/teacherMainPage"; // 학생전용 메인 페이지로 이동
	}
	
	@GetMapping("/adminMainPage")
	public String adminrMainPage(HttpSession session, RedirectAttributes rattr, Model model) {
		// 세션 로그인 여부 확인
		Map<String, Object> loginInfo =(Map<String, Object>) session.getAttribute("loginInfo");
		if (loginInfo == null) {
			rattr.addFlashAttribute("msgType", "잘못된 접근");
			rattr.addFlashAttribute("msg", "로그인을 먼저 해주세요.");
			return "redirect:/loginForm"; // 비로그인이면 로그인 url로 redirect
		}
		// 첫 방문인지 체크해서 메시지 한 번만 표시
		int visitCount = (int)session.getAttribute("visitCount");
		if (visitCount  == 0) {
			model.addAttribute("msgType", "로그인 성공 메시지");
			model.addAttribute("msg", loginInfo.get("name") + "님, 환영합니다.");
			visitCount++;
			session.setAttribute("visitCount", visitCount);
		}
		
		return "memberInfo/adminMainPage"; // 학생전용 메인 페이지로 이동
	}
	
	// 차성호, 정건희 : 직원 상세보기
	// @RequestParam("id") String id
	@GetMapping("/empOne")
	public String getEmpOne(
			@RequestParam(name = "id") String id,
			Model model,
			RedirectAttributes rattr
			) {
		// String id = "blue"; 임시 아이디 blue
		if (id == null || id.isBlank()) {
			rattr.addFlashAttribute("msgType","잘못된 접근");
			rattr.addFlashAttribute("msg","ID 정보가 없습니다.");
			return "redirect:/empList";
		}
		
		List<LectureVO>	lectureList = memberInfoMapper.getMyLectureList(id);
		Map<String, Object> empOneInfo = memberInfoMapper.getEmpOne(id);
		
		// mapperResult 디버깅
		lectureList
				.stream()
				.forEach(value -> log.debug(yellow + "[getEmpOne] 강의명 : {}" + reset, value.getLectureName()));
		empOneInfo
			.entrySet()
			.stream()
			.forEach(entry -> log.debug(yellow + "[getEmpOne] Key : {}, Value : {}" + reset, entry.getKey(), entry.getValue()));
		
		model.addAttribute("lectureList", lectureList);
		model.addAttribute("empOneInfo", empOneInfo);
		return "memberInfo/empOne";
	}
	
	// 정건희 : 직원 전체 조회
	@GetMapping("/empList")
	public String getEmpList(
		@RequestParam(name = "currentPage", value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		List<HashMap<String, Object>> empInfo = memberInfoMapper.getEmpList(currentPage);
		model.addAttribute("empInfo", empInfo);
		return "empList";
	}
}
