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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String myCashList(HttpSession session,Model model, RedirectAttributes rattr) {
		Map<String, Object> loginInfo =(Map<String, Object>) session.getAttribute("loginInfo");
		// 로그인 성공 여부에 따른 분기
		if (loginInfo == null || loginInfo.isEmpty()) {
			rattr.addFlashAttribute("msgType", "로그인 실패 메시지");
			rattr.addFlashAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			return "redirect:/loginForm"; // 로그인 실패 시 로그인 페이지로 이동
		}
		String id = (String)(loginInfo.get("id"));
		List<PaymentVO> list = StudentPaymentmapper.getMyCashList(id);
		model.addAttribute("myCashList", list);
		model.addAttribute("loginId", id);
		return "myCashList";
	}
	
	// 조인환 - 내 환불내역 조회
	@Autowired
	private StudentPaymentMapper studentPaymentMapper;
	@GetMapping("/myCashRefundForm")
	public String myCashRefundForm(HttpSession session,Model model, RedirectAttributes rattr) {
		Map<String, Object> loginInfo =(Map<String, Object>) session.getAttribute("loginInfo");	
		// 로그인 성공 여부에 따른 분기
		if (loginInfo == null || loginInfo.isEmpty()) {
			rattr.addFlashAttribute("msgType", "로그인 실패 메시지");
			rattr.addFlashAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			return "redirect:/loginForm"; // 로그인 실패 시 로그인 페이지로 이동
		}
		String id = (String)(loginInfo.get("id"));
		List<RefundVO> list = studentPaymentMapper.getMyRefundHistory(id);
		model.addAttribute("myRefundList", list);
		return "myCashRefundForm";
	}
	
	// 학생 캐쉬 충전	
	@Autowired
	private CashMapper cashMapper;	
	@Autowired
	private StudentPaymentMapper StudentPaymentMapper;	
	@PostMapping("/cashCharge")
	public String cashCharge(
				@RequestParam(name="id") String id,
				@RequestParam(name="cash") String cash,
				HttpSession session				
			) 
	{
		Map<String,Object>cashMap = new HashMap<>();
		cashMap.put("id", id);
		cashMap.put("cash", cash);
		// 수납 내역에 충전내역 기록
		int insertCashResult = cashMapper.insertCashHistoryToCharge(cashMap);
		// 학생 개인 캐쉬 수정
		int updateStudentResult = cashMapper.updateStudentCash(cashMap);
		
		// 세션의 cash값 업데이트
		int myCash = StudentPaymentMapper.getMyCash(id);				
		Map<String, Object> loginInfo =(Map<String, Object>) session.getAttribute("loginInfo");
		loginInfo.put("cash", myCash);
		session.setAttribute("loginInfo", loginInfo);
		
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
