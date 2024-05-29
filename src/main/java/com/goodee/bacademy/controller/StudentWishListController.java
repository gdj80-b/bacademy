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
import com.goodee.bacademy.mapper.StudentWishListMapper;
import com.goodee.bacademy.mapper.StudentPaymentMapper;
import com.goodee.bacademy.vo.WishListVO;

import jakarta.servlet.http.HttpSession;

@Transactional
@Controller
public class StudentWishListController {
	// 내찜 리스트 출력
	@Autowired
	private StudentWishListMapper mapper;
	// 내 찜 리스트 조회
	@GetMapping("/myWishList")
	public String myWishList(HttpSession session, Model model, RedirectAttributes rattr) {
		Map<String, Object> loginInfo =(Map<String, Object>) session.getAttribute("loginInfo");
		// 로그인 성공 여부에 따른 분기
		if (loginInfo == null || loginInfo.isEmpty()) {
			rattr.addFlashAttribute("msgType", "로그인 실패 메시지");
			rattr.addFlashAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			return "redirect:/loginForm"; // 로그인 실패 시 로그인 페이지로 이동
		}
		String id = (String)(loginInfo.get("id"));
		System.out.println(id + "<-id@@@@@@@@@@");
		//System.out.println((String)(loginInfo.get("cash")) + "<-cash@@@@@@@@@@");
		List<WishListVO> list = mapper.getMyWishList(id);
		
		//int myCash = Integer.parseInt("temp");
		
		//String myCash = (String)(loginInfo.get("cash"));
		int myCash = (int)(loginInfo.get("cash"));
		
		model.addAttribute("myWishList", list);
		model.addAttribute("myCash", myCash);
		model.addAttribute("loginId", id);
		return "myWishList";
	}
	
	// 내찜 추가
	@Autowired
	private StudentWishListMapper addWishMapper;
	
	@GetMapping("/addWishList")
	public String addWishList(
				@RequestParam(name="id") String id,
				@RequestParam(name="lectureNo") String lectureNo
			)
	{
		Map<String,Object>wishMap = new HashMap<>();
		wishMap.put("id", id);
		wishMap.put("lectureNo", lectureNo);
		
		int addWishResult = addWishMapper.addWishList(wishMap);
		
		 if (addWishResult == 1) {
			System.out.println("찜 추가 성공");
			return "redirect:myWishList";
		 } else {
			System.out.println("찜 추가 실패");
			return "redirect:myWishList";
		}
		
	}
	
	// 내찜 삭제
		@Autowired
		private StudentWishListMapper deleteWishMapper;
		
		@PostMapping("/wishListDelete")
		public String wishListDelete(
					@RequestParam(name="id") String id,
					@RequestParam(name="lectureNo", required=false) String[] lectureNo
				)
		{	
			Map<String,Object>wishMap = new HashMap<>();
			System.out.println(id + "<-id");			
			
			if (lectureNo != null) {
		        for (String no : lectureNo) {
		            System.out.println(no + "<-lectureNo");
		            wishMap.put("id", id);
		            wishMap.put("lectureNo", no);
		            System.out.println(wishMap);
		            System.out.println(wishMap.get("lectureNo"));
		            int deleteWishResult = deleteWishMapper.wishListDelete(wishMap);
		        }
		        System.out.println("찜삭제성공");
		        return "redirect:/myWishList";
		        
		    } else {
		        System.out.println("선택된 항목이 없습니다");
		        return "redirect:/myWishList";
		    }						
			
		}
	
	// 수강 등록(결제)
		@Autowired
		private StudentWishListMapper addApplicationMapper;
		@Autowired
		private CashMapper cashMapper;
		@Autowired
		private StudentPaymentMapper studentPaymentMapper;
		@PostMapping("/addApplication")
		public String addApplication(
					@RequestParam(name="id") String id,
					@RequestParam(name="lectureNo", required=false) String[] lectureNo,
					@RequestParam(name="cash") String cash,
					HttpSession session
				)
		{	
			Map<String,Object>wishMap = new HashMap<>();
			
			System.out.println(id + "<-id");			
			System.out.println(cash + "<-cash");			
			
			if (lectureNo != null) {
		        for (String no : lectureNo) {
		            System.out.println(no + "<-lectureNo");
		            wishMap.put("id", id);
		            wishMap.put("lectureNo", no);
		            System.out.println(wishMap);
		            System.out.println(wishMap.get("lectureNo"));
		            int deleteWishResult = deleteWishMapper.wishListDelete(wishMap);	// 찜 리스트에서 삭제
		            int addApplicationResult = addApplicationMapper.addApplication(wishMap); // 수강신청 리스트에 추가
		            
		        }
		        Map<String,Object>refundMap = new HashMap<>(); // 학생 캐쉬업데이트(차감)		        
		        refundMap.put("id", id);
		        refundMap.put("cash", cash);
		        int updateStudentResult = cashMapper.updateStudentCash(refundMap);	
		        // 바뀐 금액 세션값에 다시저장
		        int myCash = studentPaymentMapper.getMyCash(id);				
				Map<String, Object> loginInfo =(Map<String, Object>) session.getAttribute("loginInfo");
				loginInfo.put("cash", myCash);
				session.setAttribute("loginInfo", loginInfo);
				
		        System.out.println("수강신청성공");
		        return "redirect:/myWishList";
		        
		    } else {
		        System.out.println("선택된 항목이 없습니다");
		        return "redirect:/myWishList";
		    }						
			
		}
}
