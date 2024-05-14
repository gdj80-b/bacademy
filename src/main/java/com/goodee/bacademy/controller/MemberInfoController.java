package com.goodee.bacademy.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodee.bacademy.mapper.MemberInfoMapper;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberInfoController {
	
	private final String yellow = "\u001B[33m"; // 디버깅 색 변경용
	private final String reset = "\u001B[0m";
	
	@Autowired
	private MemberInfoMapper memberInfoMapper; //  mapper bean 의존성 주입
	
	@GetMapping("/studentMainPage")
	public String memberJoinForm(HttpSession session, RedirectAttributes rattr, Model model) {
		// 세션 로그인 여부 확인
		Map<String, Object> loginInfo =(Map<String, Object>) session.getAttribute("loginInfo");
		if (loginInfo == null) {
			rattr.addFlashAttribute("msgType", "잘못된 접근");
			rattr.addFlashAttribute("msg", "로그인을 먼저 해주세요.");
			return "redirect:/loginForm"; // 비로그인이면 로그인 url로 redirect
		}
		model.addAttribute("msgType", "로그인 성공 메시지");
		model.addAttribute("msg", loginInfo.get("name") + "님, 환영합니다.");
		
		return "memberInfo/studentMainPage"; // 학생전용 메인 페이지로 이동
	}
	
	@GetMapping("/empOne/{id}")
	public String getEmpOne(@PathVariable("id") String id) {
		return "memberinfo/empOne";
	}
	
	@GetMapping("/empList")
	public String getEmpList() {
		return "empList";
	}
}
