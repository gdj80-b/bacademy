package com.goodee.bacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodee.bacademy.mapper.CashMapper;
import com.goodee.bacademy.vo.CashHistory;
import com.goodee.bacademy.vo.Refund;

@Transactional
@Controller
public class CashController {
	
	@Autowired
	private CashMapper cashMapper;

	// 수납이력 조회
	@GetMapping("/cashHistory")
	public String getCashHistory(Model model) {
		List<CashHistory> cashHistory = cashMapper.getCashHistory();
		model.addAttribute("cashHistory", cashHistory);
		return "cashHistory";
	}
	
	// 환불이력 조회
	@GetMapping("/refundHistory")
	public String getRefundHistory(Model model) {
		List<Refund> refundHistory = cashMapper.getRefundHistory();
		model.addAttribute("refundHistory", refundHistory);
		return "refundHistory";
	}
	
	// 환불상태 승인
	@PostMapping("/refundConfirm")
	public String updateRefundAction(
			@RequestParam int refund_no, @RequestParam String state, @RequestParam String id, @RequestParam int refund_cash,
			RedirectAttributes rttr
			) {
		// System.out.println("updateRefundAction refund_no = " + refund_no);
		// System.out.println("updateRefundAction state = " + state);
		// System.out.println("updateRefundAction id = " + id);
		// System.out.println("updateRefundA=ction refund_cash = " + refund_cash);
		
		int updateRefundResult = cashMapper.updateRefundState(refund_no, state);
		int updateStudentResult = cashMapper.updateStudentCash(id, refund_cash);
		int insertCashResult = cashMapper.insertCashHistory(id, refund_cash);
		
		if (updateRefundResult == 1 && updateStudentResult == 1 && insertCashResult == 1) {
			System.out.println("성공");
			return "redirect:refundHistory";
		} else {
			System.out.println("실패");
			return "redirect:refundHistory";
		}
	}
}
