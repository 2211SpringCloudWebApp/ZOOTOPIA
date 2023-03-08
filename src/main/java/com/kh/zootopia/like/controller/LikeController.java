package com.kh.zootopia.like.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.like.service.LikeService;

@Controller
public class LikeController {

	@Autowired
	private LikeService likeService;
	
	/**
	 * 좋아요 확인
	 */
	public void checkLike(
			@ModelAttribute Like like,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			Model model) {
		
		int result = likeService.checkLike(like);
		model.addAttribute("result", result);
		
		return null;
		
	}
	
	/**
	 * 좋아요 등록
	 */
	public void insertLike() {
		
		int result = likeService.insertLike();
		
		return null;
		
	}
	
}
