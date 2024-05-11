package com.goodee.bacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.goodee.bacademy.mapper.CashMapper;
import com.goodee.bacademy.vo.CashHistory;
import com.goodee.bacademy.vo.Refund;

@Controller
public class CashController {
	
	@Autowired
	private CashMapper cashMapper;

	@GetMapping("/cashHistory")
	public String getCashHistory(Model model) {
		List<CashHistory> cashHistory = cashMapper.getCashHistory();
		model.addAttribute("cashHistory", cashHistory);
		return "cashHistory";
	}
	
	@GetMapping("/refundHistory")
	public String getRefundHistory(Model model) {
		List<Refund> refundHistory = cashMapper.getRefundHistory();
		model.addAttribute("refundHistory", refundHistory);
		return "refundHistory";
	}
}
