package com.goodee.bacademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodee.bacademy.mapper.CashMapper;
import com.goodee.bacademy.vo.CashHistoryVO;
import com.goodee.bacademy.vo.RefundVO;

import lombok.extern.slf4j.Slf4j;


@Transactional
@Controller
public class CashController {
	
	private final String yellow = "\u001B[33m";
	private final String reset = "\u001B[0m";
	
	@Autowired
	private CashMapper cashMapper;

	// 정건희 : 수납이력 조회
	@GetMapping("/cashHistory")
	public String getCashHistory(Model model) {
		List<CashHistoryVO> cashHistory = cashMapper.getCashHistory();
		model.addAttribute("cashHistory", cashHistory);
		return "cashHistory";
	}
	
	// 정건희 : 환불이력 조회
	@GetMapping("/refundHistory")
	public String getRefundHistory(Model model) {
		List<RefundVO> refundHistory = cashMapper.getRefundHistory();
		model.addAttribute("refundHistory", refundHistory);
		return "refundHistory";
	}
	
	// 정건희 : 환불상태 승인
	@PostMapping("/refundConfirm")
	public String updateRefundAction(
				@RequestParam(name = "refundNo") int refundNo,
				@RequestParam(name = "state") String state,
				@RequestParam(name = "id") String id,
				@RequestParam(name = "cash") int cash
			) 
	{
		Map<String, Object> refundMap = new HashMap<>();
		refundMap.put("refundNo", refundNo);
		refundMap.put("state", state);
		refundMap.put("id", id);
		refundMap.put("cash", cash);
		
		int updateRefundResult = cashMapper.updateRefundState(refundMap);
		int updateStudentResult = cashMapper.updateStudentCash(refundMap);
		int insertCashResult = cashMapper.insertCashHistory(refundMap);
		
		if (updateRefundResult == 1 && updateStudentResult == 1 && insertCashResult == 1) {
			System.out.println("환불 요청 대기 -> 승인 성공");
			return "redirect:refundHistory";
		} else {
			System.out.println("환불 요청 대기 -> 승인 실패");
			return "redirect:refundHistory";
		}
	}	
	
	
	
	
}
