package com.goodee.bacademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	private StudentPaymentMapper studentPaymentMapper;
	@GetMapping("/myCashRefundForm")
	public String myCashRefundForm(HttpSession session,Model model) {
		Map<String, String> id = new HashMap<String, String>(); 
		String loginId = (String) session.getAttribute("loginId");
		List<RefundVO> list = studentPaymentMapper.getMyRefundHistory(loginId);
		model.addAttribute("myRefundList", list);
		return "myCashRefundForm";
	}
	
	// 학생 캐쉬 충전	
	@Autowired
	private CashMapper cashMapper;	
	@PostMapping("/cashCharge")
	public String cashCharge(
				@RequestParam(name="id") String id,
				@RequestParam(name="cash") String cash
			) 
	{
		Map<String,Object>cashMap = new HashMap<>();
		cashMap.put("id", id);
		cashMap.put("cash", cash);
		// 수납 내역에 충전내역 기록
		int insertCashResult = cashMapper.insertCashHistoryToCharge(cashMap);
		// 학생 개인 캐쉬 수정
		int updateStudentResult = cashMapper.updateStudentCash(cashMap);
		
		if(insertCashResult == 1 && updateStudentResult == 1) {
			System.out.println("캐쉬충전성공");
			return "redirect:myCashList";
		} else {
			System.out.println("캐쉬충전실패");
			return "redirect:myCashList";
		}
	}
		
	
	// 학생 환불요청
	@PostMapping("/refundRequest")
	public String refundRequest(
				@RequestParam(name="id") String id,
				@RequestParam(name="refundCash") String refundCash
			)
	{
		Map<String,Object>refundMap = new HashMap<>();
		refundMap.put("id", id);
		refundMap.put("refundCash", refundCash);
		
		int insertRefundResult = studentPaymentMapper.insertRefundRequest(refundMap);
		
		 if (insertRefundResult == 1) {
			System.out.println("환불요청성공");
			return "redirect:myCashRefundForm";
		 } else {
			System.out.println("환불요청실패");
			return "redirect:myCashRefundForm";
		}
		
	}
	
}
