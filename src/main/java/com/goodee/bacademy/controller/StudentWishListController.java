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

import com.goodee.bacademy.mapper.CashMapper;
import com.goodee.bacademy.mapper.StudentWishListMapper;
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
	public String myWishList(HttpSession session, Model model) {
		Map<String, Object> loginInfo =(Map<String, Object>) session.getAttribute("loginInfo");	
		String id = (String)(loginInfo.get("id"));
		List<WishListVO> list = mapper.getMyWishList(id);
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
	
	// 내찜 삭재
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
		@PostMapping("/addApplication")
		public String addApplication(
					@RequestParam(name="id") String id,
					@RequestParam(name="lectureNo", required=false) String[] lectureNo,
					@RequestParam(name="cash") String cash
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
		        System.out.println("수강신청성공");
		        return "redirect:/myWishList";
		        
		    } else {
		        System.out.println("선택된 항목이 없습니다");
		        return "redirect:/myWishList";
		    }						
			
		}
}
