package com.kh.zootopia.like.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.like.service.LikeService;

@Controller
public class LikeController {

	@Autowired
	private LikeService likeService;
	
	/**
	 * 좋아요 확인
	 * : Controller에서 게시판ID, 게시글NO, 회원ID의 정보를 받아온 후 해당 글에 좋아요가 있는지 확인 후 출력.
	 * result값이 0일 경우 좋아요를 클릭할 수 있고, 1일 경우에는 좋아요 클릭이 된 상태로 표시 (JSP에서 수행)
	 */
	public int checkLike(Like like) {
		
			// like 안에는 게시판ID(동물=A/후기=R), 게시글NO, 회원ID의 정보가 저장됨
			
			int result = likeService.checkLike(like);
			
			if (result > 0) {
				
				return 1; // 1이 들어가면 좋아요가 클릭된 상태로 표시, 좋아요 한 번 더 클릭 시 취소
				
			} else {
				
				return 0; // 0이 들어가면 좋아요 버튼을 클릭할 수 있도록 활성화 
				
			}
			
	}
	
	/**
	 * 좋아요 등록
	 * : jsp에서 좋아요를 클릭하면 hidden input을 통해 게시판ID, 게시글NO, 회원ID가 넘어오고,
	 * JSP의 주소를 hidden값으로 가져와서(viewAddress), 메소드 수행 후 그 주소로 이동.
	 * 그걸 이용해 LIKE_TBL에 INSERT INTO LIKE_TBL 클릭한 회원ID WHERE 게시판ID AND 게시글NO; 수행.
	 */
	@RequestMapping(value = "/like/insertLike.ztp", method = RequestMethod.POST)
	public String insertLike(@ModelAttribute Like like, String viewAddress, Model model) {
		
		System.out.println("좋아요 : " + like);
		
		try {
			
			int result = likeService.insertLike(like);
			
			if (result > 0) {
				
				return "";
				
			} else {
				
				return "";
				
			}
			
		} catch (Exception e) {

			model.addAttribute("message", e.getMessage());
			return "common/error";
			
		}
		
	}
	
	/**
	 * 좋아요 취소
	 * : jsp에서 좋아요가 이미 클릭된 상태에서 한 번 더 클릭할 경우 마찬가지로 hidden input을 통해 게시판ID, 게시글NO, 회원ID가 넘어오고,
	 * JSP의 주소를 hidden값으로 가져와서(viewAddress), 메소드 수행 후 그 주소로 이동.
	 * LIKE_TBL에서 DELETE 회원ID FROM LIKE_TBL WHERE 게시판ID AND 게시판NO; 수행.
	 */
	@RequestMapping(value = "/like/cancelLike.ztp", method = RequestMethod.POST)
	public String cancelLike(@ModelAttribute Like like, String viewAddress, Model model) {
	
		System.out.println("좋아요 취소 : " + like);
		
		try {
			
			int result = likeService.cancelLike(like);
			
			if (result > 0) {
				
				return "";
				
			} else {
				
				return "";
				
			}
			
		} catch (Exception e) {

			model.addAttribute("message", e.getMessage());
			return "common/error";
			
		}

	}
	
}
