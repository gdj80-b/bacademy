package com.goodee.bacademy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberInfoController {
	
	@GetMapping("/empList")
	public String getEmpList() {
		return "empList";
	}
}
