package com.goodee.bacademy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LectureController {
	
	// 강의 등록 폼
	@GetMapping("/addLectureForm")
	public String addLectureForm() {
		return "addLectureForm";
	}
}
