package com.kh.zootopia.like.controller;

import org.springframework.stereotype.Controller;

import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.like.service.LikeService;

@Controller
public class LikeController {

	private LikeService likeService;
	
	public void likelike() {
		
		Like like = new Like();
		
	}
	
}
