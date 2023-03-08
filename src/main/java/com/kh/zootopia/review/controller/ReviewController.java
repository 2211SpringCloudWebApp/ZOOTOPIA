package com.kh.zootopia.review.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;
import com.kh.zootopia.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	/**
	 * 후기 등록 페이지
	 */
	@RequestMapping(value = "/review/writeView", method = RequestMethod.GET)
	public String reviewWriteView() {
	
		return "review/write";
		
	}
	
	/**
	 * 후기 등록
	 * @param review
	 * @param uploadFile
	 * @param request
	 * @param model
	 * @return String
	 */
	@RequestMapping(value = "/review/write.ztp", method = RequestMethod.POST)
	public String reviewWrite(
			@ModelAttribute Review review,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
			HttpServletRequest request,
			Model model) {
		
		try {
			
			if (!uploadFile.getOriginalFilename().equals("")) {
				
				String filePath = saveFile(uploadFile, request);
				review.setReviewFileName(uploadFile.getOriginalFilename());
				review.setReviewFilePath(filePath);
				
			}
			
			int result = reviewService.insertReview(review);
			
			if (result > 0) {
				
				return "redirect:/review/list";
				
			} else {
				
				model.addAttribute("message", "등록 오류");
				return "common/error";
			}
			
		} catch (Exception e) {

			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
		
	}
	
	/**
	 * 파일 저장
	 * @param uploadFile
	 * @param request
	 * @return 
	 */
	public String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		
		try {
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\uploadFiles";
			
			File folder = new File(savePath);
			if (!folder.exists()) {
				
				folder.mkdir();
				
			}
			
			String filePath = savePath + "\\" + uploadFile.getOriginalFilename();
			File file = new File(filePath);
			
			uploadFile.transferTo(file);
			
			return filePath;
			
		} catch (Exception e) {

			e.printStackTrace();
			
			return null;
			
		}
		
	}
	
	/**
	 * 후기 목록
	 * @param model
	 * @param page
	 * @return 
	 */
	@RequestMapping(value = "/review/list.ztp", method = RequestMethod.GET)
	public String reviewList(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		
		int totalCount = reviewService.getListCount();
		PageInfo pageInfo = this.getPageInfo(page, totalCount);
		
		List<Review> reviewList = reviewService.selectReviewList(pageInfo);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("reviewList", reviewList);
		return "review/list";
		
	}
	
	/**
	 * Navigator Start/End값 설정
	 * @param currentPage
	 * @param totalCount
	 * @return PageInfo
	 */
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		
		int boardLimit = 20;
		int navLimit = 10;
		int maxPage = (int) Math.ceil((double) totalCount / boardLimit);	// navTotalCount
		int startNav = (((int)((double) currentPage / navLimit + 0.9)) - 1) * navLimit + 1;
		int endNav = startNav + navLimit - 1;
		if(endNav > maxPage) {
			endNav = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(currentPage, boardLimit, totalCount, navLimit, startNav, endNav, maxPage);
		
		return pageInfo;
		
	}
	
	/**
	 * 후기 상세 페이지
	 * @param reviewNo
	 * @param model
	 * @return 
	 */
	@RequestMapping(value = "/review/detail.ztp", method = RequestMethod.GET)
	public String reviewDetail(@RequestParam("reviewNo") int reviewNo, Model model) {
		
		try {
			
			Review review = reviewService.selectReview(reviewNo);
			
			model.addAttribute("review", review);
			
			return "review/detail";
			
		} catch (Exception e) {
			
			model.addAttribute("message", e.getMessage());
			return "common/error";
			
		}
	}
	
	/**
	 * 후기 삭제
	 * @param reviewNo
	 * @param model
	 * @return 
	 */
	@RequestMapping(value = "/review/delete.ztp", method = RequestMethod.GET)
	public String reviewDelete(@RequestParam("reviewNo") int reviewNo, Model model) {
		
		try {
			
			int result = reviewService.deleteReview(reviewNo);
			
			if (result > 0) {
				
				return "redirect:/review/list";
				
			} else {
				
				model.addAttribute("message", "삭제 오류");
				return "common/error";
			}
			
		} catch (Exception e) {

			model.addAttribute("message", e.getMessage());
			return "common/error";
			
		}
	}
	
	/**
	 * 후기 검색
	 * @param review
	 * @param page
	 * @param model
	 * @return 
	 */
	@RequestMapping(value = "/review/search.ztp", method = RequestMethod.GET)
	public String reviewSearch(
			@ModelAttribute Search search,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			Model model
			) {
		
		try {
			
			int totalCount = reviewService.getListCount(search);
			PageInfo pageInfo = this.getPageInfo(page, totalCount);
			
			List<Review> reviewList = reviewService.searchReview(pageInfo, search);
			
			if(!reviewList.isEmpty()) {
				
				model.addAttribute("pageInfo", pageInfo);
				model.addAttribute("condition", search.getCondition());
				model.addAttribute("keyword", search.getKeyword());
				model.addAttribute("reviewList", reviewList);
				return "review/search";
				
			} else {
				
				model.addAttribute("message", "정보를 찾을 수 없습니다.");
				return "common/error";
				
			}
			
		} catch (Exception e) {

			model.addAttribute("message", e.getMessage());
			return "common/error";
			
		}
	}
	
}
