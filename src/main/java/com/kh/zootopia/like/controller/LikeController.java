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
	 * jsp에서 게시판ID, 게시글NO, 회원ID의 정보를 받아온 후 해당 글에 좋아요가 있는지 확인 후 출력
	 */
	public void checkLike(@ModelAttribute Like like, Model model) {
		
		// like 안에는 게시판ID(동물/후기), 게시글NO, 회원ID의 정보가 저장됨
		
		int result = likeService.checkLike(like);

		if (result > 0) {
		
			model.addAttribute("result", result);
			
		} else {
			
			model.addAttribute(model);
			
		}
		
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
