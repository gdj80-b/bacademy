package com.goodee.bacademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.goodee.bacademy.mapper.StudentWishListMapper;
import com.goodee.bacademy.vo.WishListVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentWishListController {
	
	@Autowired
	private StudentWishListMapper mapper;
	
	@GetMapping("/myWishList")
	public String myWishList(HttpSession session, Model model) {
		Map<String, String> id = new HashMap<String, String>(); 
		String loginId = (String) session.getAttribute("loginId");
		List<WishListVO> list = mapper.getMyWishList(loginId);
		model.addAttribute("myWishList", list);
		return "myWishList";
	}
}
