package com.goodee.bacademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.goodee.bacademy.mapper.CashMapper;
import com.goodee.bacademy.mapper.StudentPaymentMapper;
import com.goodee.bacademy.vo.PaymentVO;
import com.goodee.bacademy.vo.RefundVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentPaymentController {

	// 조인환 - 내 캐쉬내역 조회
	@Autowired
	private StudentPaymentMapper StudentPaymentmapper;	
	@GetMapping("/myCashList")
	public String myCashList(HttpSession session,Model model) {
		Map<String, String> id = new HashMap<String, String>(); 
		String loginId = (String) session.getAttribute("loginId");
		List<PaymentVO> list = StudentPaymentmapper.getMyCashList(loginId);
		model.addAttribute("myCashList", list);
		return "myCashList";
	}
	
	// 조인환 - 내 환불내역 조회
	@Autowired
	private CashMapper cashMapper;
	@GetMapping("/myCashRefundForm")
	public String myCashRefundForm(HttpSession session,Model model) {
		Map<String, String> id = new HashMap<String, String>(); 
		String loginId = (String) session.getAttribute("loginId");
		List<RefundVO> list = cashMapper.getMyRefundHistory(loginId);
		model.addAttribute("myRefundList", list);
		return "myCashRefundForm";
	}
	
}
