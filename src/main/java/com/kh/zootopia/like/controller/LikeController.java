package com.kh.zootopia.like.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.like.service.LikeService;

@Controller
public class LikeController {

	@Autowired
	private LikeService likeService;
	
	/**
	 * 좋아요 확인
	 * : jsp에서 게시판ID, 게시글NO, 회원ID의 정보를 받아온 후 해당 글에 좋아요가 있는지 확인 후 출력.
	 * result값이 0일 경우 좋아요를 클릭할 수 있고, 1일 경우에는 좋아요 클릭이 된 상태로 표시 (JSP에서 수행)
	 */
	public String checkLike(@ModelAttribute Like like, Model model) {
		
		try {
			// like 안에는 게시판ID(동물/후기), 게시글NO, 회원ID의 정보가 저장됨
			
			int result = likeService.checkLike(like);
			
			if (result > 0) {
				
				model.addAttribute("like", 1);
				return ""; // XXX.jsp의 XXX에 1이 들어가면 좋아요가 클릭된 상태로 표시 
				
			} else {
				
				model.addAttribute("like", 0);
				return ""; // XXX.jsp의 xxx에 0이 들어가면 좋아요 버튼 활성화
				
			}
			
		} catch (Exception e) {

			model.addAttribute("message", e.getMessage());
			return "common/error";
			
		}
		
	}
	
	/**
	 * 좋아요 등록
	 * : jsp에서 좋아요를 클릭하면 hidden input을 통해 게시판ID, 게시글NO, 회원ID가 넘어오고,
	 * 그걸 이용해 LIKE_TBL에 INSERT INTO LIKE_TBL 클릭한 회원ID WHERE 게시판ID AND 게시글NO; 수행
	 * @return 
	 */
	public String insertLike(@ModelAttribute Like like, Model model) {
		
		try {
			
			int result = likeService.insertLike(like);
			
			return "";
			
		} catch (Exception e) {

			model.addAttribute("message", e.getMessage());
			return "common/error";
			
		}
		
		
	}
	
}
