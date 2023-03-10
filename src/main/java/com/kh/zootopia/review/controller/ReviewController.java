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
import org.springframework.web.servlet.ModelAndView;

import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;
import com.kh.zootopia.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	/**
	 * 후기 redirect
	 */
	public void reviewViewPage() {
		
		
		
	}
	
	/**
	 * 후기 등록 페이지
	 */
	@RequestMapping(value = "/review/writeView.ztp", method = RequestMethod.GET)
	public String reviewWriteView() {
	
		return "review/write";
		
	}
	
	/**
	 * 후기 등록
	 * : write.jsp에서 각각의 name에 해당하는 값을 가져와 객체화 시킴,
	 * 파일이 있을 경우 파일을 업로드,
	 * 후기 작성일은 mapper에서 default(sysdate)로 해줌.
	 */
	@RequestMapping(value = "/review/write.ztp", method = RequestMethod.POST)
	public ModelAndView reviewWrite(
			int reviewPostNo, String animalNo, String reviewTitle, String reviewContent, String reviewWriterId, String reviewImageName, String reviewVideoName
			, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
			, HttpServletRequest request, ModelAndView mv
			) {
		
		try {
			
			Review review = new Review();
			review.setAnimalNo(animalNo);
			review.setReviewPostNo(reviewPostNo);
			review.setReviewTitle(reviewTitle);
			review.setReviewContent(reviewContent);
			review.setReviewWriterId(reviewWriterId);
			review.setReviewImageName(reviewImageName);
			review.setReviewVideoName(reviewVideoName);
			
			if (!uploadFile.getOriginalFilename().equals("")) {
				
				String filePath = saveFile(uploadFile, request);
				review.setReviewImageName(uploadFile.getOriginalFilename());
				review.setReviewImagePath(filePath);
				
			}
			
			int result = reviewService.insertReview(review);
			
			if (result > 0) {
				
				mv.setViewName("redirect:/review/list");
				
			} else {
				
				mv.addObject("message", "등록 오류");
				mv.setViewName("common/error");
				
			}
			
		} catch (Exception e) {

			mv.addObject("message", e.getMessage());
			mv.setViewName("common/error");
			
		}
		
		return mv;
		
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
	 *
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
	public ModelAndView reviewDetail(@RequestParam("reviewNo") int reviewNo, ModelAndView mv) {
		
		try {
			
			Review review = reviewService.selectReview(reviewNo);
			
			mv.addObject("review", review).setViewName("review/detail");
			
		} catch (Exception e) {
			
			mv.addObject("message", e.getMessage()).setViewName("common/error");
			
		}
		
		return mv;
		
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
