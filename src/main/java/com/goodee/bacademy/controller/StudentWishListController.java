package com.goodee.bacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.goodee.bacademy.mapper.StudentWishListMapper;
import com.goodee.bacademy.vo.WishList;

@Controller
public class StudentWishListController {
	
	@Autowired
	private StudentWishListMapper mapper;
	
	@GetMapping("/myWishList")
	public String myWishList(Model model) {
		List<WishList> list = mapper.getMyWishList();
		model.addAttribute("myWishList", list);
		return "myWishList";
	}
}
