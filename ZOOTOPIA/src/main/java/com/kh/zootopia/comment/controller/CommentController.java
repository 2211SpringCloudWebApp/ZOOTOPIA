package com.kh.zootopia.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.comment.service.CommentService;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	
//	public String commentList(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Comment comment) {
//		
//		int totalCount = commentService.getListCount(comment);
//		PageInfo pageInfo = this.getPageInfo(page, totalCount);
//		
//		List<Comment> commentList = commentService.selectCommentList(pageInfo, comment);
//		
//		model.addAttribute("pageInfo", pageInfo);
//		model.addAttribute("reviewList", commentList);
//		return "review/list";
//		
//	}
//	
//	/**
//	 * Navigator Start/End값 설정
//	 */
//	private PageInfo getPageInfo(int currentPage, int totalCount) {
//		
//		int boardLimit = 10;
//		int navLimit = 10;
//		int maxPage = (int) Math.ceil((double) totalCount / boardLimit);	// navTotalCount
//		int startNav = (((int)((double) currentPage / navLimit + 0.9)) - 1) * navLimit + 1;
//		int endNav = startNav + navLimit - 1;
//		if(endNav > maxPage) {
//			endNav = maxPage;
//		}
//		
//		PageInfo pageInfo = new PageInfo(currentPage, boardLimit, totalCount, navLimit, startNav, endNav, maxPage);
//		
//		return pageInfo;
//		
//	}
	
	/**
	 * 댓글 목록 출력
	 * : Comment안에 있는 boardId, postNo에 따라 출력되는 댓글이 달라짐
	 */
	public List<Comment> commentList(Comment comment) {
		
		List<Comment> commentList = commentService.selectCommentList(comment);
		
		return commentList;
		
	}
	
	/**
	 * 댓글 입력
	 * : JSP에서 Input hidden형태로 boardId, postNo, 댓글작성자, 내용을 보내주면 그걸 modelattribute시켜서 가져옴
	 */
	@RequestMapping(value = "/comment/insert.ztp", method = RequestMethod.POST)
	public void insertComment(@ModelAttribute Comment comment) {
		
		commentService.insertComment(comment);

	}
	
	/**
	 * 댓글 삭제
	 */
	@RequestMapping(value = "/comment/delete.ztp", method = RequestMethod.POST)
	public ModelAndView deleteComment(@ModelAttribute Comment comment, @RequestParam("url") String url, ModelAndView mv) {
		
		try {
			
			int result = commentService.deleteComment(comment);
			
			mv.setViewName(url);
			
		} catch (Exception e) {

			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}
		
		return mv;
		
	}
	
}
