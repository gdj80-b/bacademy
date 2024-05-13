package com.goodee.bacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.goodee.bacademy.mapper.StudentPaymentMapper;
import com.goodee.bacademy.vo.PaymentVO;

@Controller
public class StudentPaymentController {

	
	@Autowired
	private StudentPaymentMapper mapper;
	
	@GetMapping("/myCashList")
	public String myCashList(Model model) {
		List<PaymentVO> list = mapper.getMyCashList();
		model.addAttribute("myCashList", list);
		return "myCashList";
	}
	
}
