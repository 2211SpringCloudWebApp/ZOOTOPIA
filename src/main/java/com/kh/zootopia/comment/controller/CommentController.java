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
	 * : JSP에서 boardId, postNo, 댓글작성자, 내용을 보내주면 그걸 modelattribute시켜서 가져옴
	 */
	@RequestMapping(value = "/comment/insert.ztp", method = RequestMethod.POST)
	public ModelAndView insertComment(@ModelAttribute Comment comment, @RequestParam("url") String url, ModelAndView mv) {
		
		try {
			
			int result = commentService.insertComment(comment);
			
			if (result > 0) {
				
				mv.setViewName("redirect:"+url+comment.getPostNo());
				
			} else {
				
				mv.addObject("message", "오류").setViewName("common/error");
				
			}
			
		} catch (Exception e) {
			
			mv.addObject("message", e.getMessage()).setViewName("common/error");
			
		}
		
		return mv;

	}
	
	/**
	 * 댓글 수정 창 띄우기
	 * @return 
	 */
	@RequestMapping(value = "/comment/modifyView.ztp", method = RequestMethod.GET)
	public ModelAndView modifyCommentView(@ModelAttribute Comment comment, @RequestParam("url") String url, ModelAndView mv) {
		
		Comment commentResult = commentService.selectComment(comment);
		
		mv.addObject("comment", commentResult);
		mv.addObject("url", url);
		mv.setViewName("common/modifyComment");
		
		return mv;
		
	}
	
	/**
	 * 댓글 수정
	 */
	@RequestMapping(value = "/comment/modify.ztp", method = RequestMethod.POST)
	public ModelAndView modifyComment(@ModelAttribute Comment comment, @RequestParam("url") String url, ModelAndView mv) {
		
		try {
			
			int result = commentService.modifyComment(comment);
			
			if (result > 0) {
				
				mv.setViewName("redirect:"+url+comment.getPostNo());
				
			} else {
				
				mv.addObject("message", "오류").setViewName("common/error");
				
			}
			
		} catch (Exception e) {
			
			mv.addObject("message", e.getMessage()).setViewName("common/error");
			
		}
		
		return mv;

	}
	
	/**
	 * 댓글 삭제
	 */
	@RequestMapping(value = "/comment/delete.ztp", method = RequestMethod.POST)
	public ModelAndView deleteComment(@ModelAttribute Comment comment, @RequestParam("url") String url, ModelAndView mv) {
		
		try {
			
			int result = commentService.deleteComment(comment);
			
			if (result > 0) {
				
				mv.setViewName("redirect:"+url+comment.getPostNo());
				
			} else {
				
				mv.addObject("message", "오류").setViewName("common/error");
				
			}
			
		} catch (Exception e) {
			
			mv.addObject("message", e.getMessage()).setViewName("common/error");
			
		}
		
		return mv;
		
	}
	
}
