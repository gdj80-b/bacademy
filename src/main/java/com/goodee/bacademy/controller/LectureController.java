package com.goodee.bacademy.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.bacademy.mapper.LectureMapper;
import com.goodee.bacademy.vo.Lecture;

@Controller
public class LectureController {
	
	@Autowired
	private LectureMapper lectureMapper;
	
	// addLectureForm.jsp
	@GetMapping("/addLectureForm")
	public String addLectureForm() {
		return "addLectureForm";
	}
	
	//lectureList.jsp
	@GetMapping("/lectureList")
	public String lectureList(Model model) {
		List<Lecture> lectureList = lectureMapper.getLectureList();
		model.addAttribute("lectureList", lectureList);
		return "lectureList";
	}
	
	//lectureOne.jsp
	@GetMapping("/lectureOne")
	public String lectureOne(Model model, @RequestParam int lectureNo) {
		List<Lecture> lectureOneList = lectureMapper.getLectureList();
		model.addAttribute("lectureOneList", lectureOneList);
		return "lectureOne";
	}
}
