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

import com.goodee.bacademy.mapper.StudentWishListMapper;
import com.goodee.bacademy.vo.WishListVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentWishListController {
	// 내찜 리스트 출력
	@Autowired
	private StudentWishListMapper mapper;
	// 내 찜 리스트 조회
	@GetMapping("/myWishList")
	public String myWishList(HttpSession session, Model model) {
		String loginId = (String) session.getAttribute("loginId");
		List<WishListVO> list = mapper.getMyWishList(loginId);
		model.addAttribute("myWishList", list);
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
	
}
