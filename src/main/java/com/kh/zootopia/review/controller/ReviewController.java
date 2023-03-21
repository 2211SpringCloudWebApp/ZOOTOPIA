package com.kh.zootopia.review.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.comment.controller.CommentController;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.like.controller.LikeController;
import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;
import com.kh.zootopia.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	@Autowired
	private LikeController likeController;
	@Autowired
	private CommentController commentController;
	
	/**
	 * 후기 등록 페이지
	 */
	@RequestMapping(value = "/review/writeView.ztp", method = RequestMethod.POST)
	public String reviewWriteView(@ModelAttribute Animal animal, Model model) {
		
		model.addAttribute("animal", animal);
		return "review/write";
		
	}

//	/**
//	 * 후기 등록 : write.jsp에서 각각의 name에 해당하는 값을 가져와 객체화 시킴, 파일이 있을 경우 파일을 업로드, 후기 작성일은
//	 * mapper에서 default(sysdate)로 해줌. 후기는 session이 있는 사용자만 입력가능.
//	 */
//	@RequestMapping(value = "/review/write.ztp", method = RequestMethod.POST)
//	public ModelAndView reviewWrite(String reviewTitle, String reviewContent, HttpSession session,
//			@RequestParam("reviewImagesName") List<MultipartFile> uploadImageFiles
////			, @RequestParam("reviewVideoName") MultipartFile uploadVideoFile
//			, HttpServletRequest request, ModelAndView mv, int animalNo) {
//
//		try {
//
//			request.setCharacterEncoding("UTF-8");
//
//			Member member = (Member) session.getAttribute("loginUser");
//			String reviewWriterId = member.getMemberId();
//
//			Review review = new Review();
//			review.setReviewTitle(reviewTitle);
//			review.setReviewContent(reviewContent);
//			review.setReviewWriterId(reviewWriterId);
//			review.setAnimalNo(animalNo);
//
//			// 파일 업로드 부분
//			System.out.println(uploadImageFiles);
//
//			// path 설정
//			String root = request.getSession().getServletContext().getRealPath("resources");
//			String savePath = root + "\\uploadFiles\\review";
//			
//			// 폴더가 없으면 생성
//			File folder = new File(savePath);
//			if (!folder.exists())
//				folder.mkdir();
//
//			List<Map<String, String>> uploadImageList = new ArrayList<>();
//
//			if (uploadImageFiles != null) {
//				
//				for (int i = 0; i < uploadImageFiles.size(); i++) {
//	
//					String originalFileName = uploadImageFiles.get(i).getOriginalFilename();
//					String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
//					String changedFileName = UUID.randomUUID().toString() + ext;
//	
//					Map<String, String> map = new HashMap<>();
//					map.put("originalFileName", originalFileName);
//					map.put("changedFileName", changedFileName);
//	
//					uploadImageList.add(map);
//	
//				}
//				
//				try {
//					
//					for (int i = 0; i < uploadImageFiles.size(); i++) {
//						
//						String filePath = savePath + "\\" + uploadImageList.get(i).get("changedFileName");
//						File file = new File(filePath);
//						uploadImageFiles.get(i).transferTo(file);
//						
//					}
//						
//				} catch (Exception e) {
//	
//					for (int i = 0; i < uploadImageFiles.size(); i++) {
//						
//						String filePath = savePath + "\\" + uploadImageList.get(i).get("changedFileName");
//						new File(filePath).delete();
//						
//					}
//				
//				}
//			}
//
//			int result = reviewService.insertReview(review);
//
//			if (result > 0) {
//
//				mv.setViewName("redirect: /review/list.ztp");
//
//			} else {
//
//				mv.addObject("message", "등록 오류");
//				mv.setViewName("common/error");
//
//			}
//
//		} catch (Exception e) {
//
//			mv.addObject("message", e.getMessage());
//			mv.setViewName("common/error");
//
//		}
//
//		return mv;
//
//	}
	
	/**
	 * 후기 등록
	 * : write.jsp에서 각각의 name에 해당하는 값을 가져와 객체화 시킴,
	 * 파일이 있을 경우 파일을 업로드,
	 * 후기 작성일은 mapper에서 default(sysdate)로 해줌.
	 * 후기는 session이 있는 사용자만 입력가능.
	 */
	@RequestMapping(value = "/review/write.ztp", method = RequestMethod.POST)
	public ModelAndView reviewWrite(
			String reviewTitle, String reviewContent
			, HttpSession session
			, @RequestParam("reviewImageName") MultipartFile uploadImageFile
//			, @RequestParam("reviewVideoName") MultipartFile uploadVideoFile
			, HttpServletRequest request, ModelAndView mv, int animalNo
			) {
		
		try {
			
			request.setCharacterEncoding("UTF-8");
			
			Member member = (Member) session.getAttribute("loginUser");
			String reviewWriterId = member.getMemberId();
			
			Review review = new Review();
			review.setReviewTitle(reviewTitle);
			review.setReviewContent(reviewContent);
			review.setReviewWriterId(reviewWriterId);
			review.setAnimalNo(animalNo);
			
			if (!uploadImageFile.getOriginalFilename().equals("")) {
				
				String filePath = saveFile(uploadImageFile, request);
				review.setReviewImageName(uploadImageFile.getOriginalFilename());
				review.setReviewImagePath(filePath);
				
			}
			
			int result = reviewService.insertReview(review);
			
			if (result > 0) {
				
				mv.setViewName("redirect: /review/list.ztp");
				
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
	 */
	public String saveFile(MultipartFile reviewImageName, HttpServletRequest request) {
		
		try {
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\uploadFiles\\review";
			
			File folder = new File(savePath);
			if (!folder.exists()) {
				
				folder.mkdir();
				
			}
			
			String filePath = savePath + "\\" + reviewImageName.getOriginalFilename();
			File file = new File(filePath);
			
			reviewImageName.transferTo(file);
			
			return filePath;
			
		} catch (Exception e) {

			e.printStackTrace();
			
			return null;
			
		}
		
	}
	
//	/**
//	 * 파일 삭제
//	 */
//	private void deleteFile(String filename, HttpServletRequest request) throws Exception {
//		
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		String deletePath = root + "\\uploadFiles\\review";
//		String deleteFilepath = deletePath + "\\" + filename;
//		File deleteFile = new File(deleteFilepath);
//		
//		if(deleteFile.exists()) {
//			
//			deleteFile.delete();
//			
//		}
//	}	
	
	/**
	 * 후기 목록
	 */
	@RequestMapping(value = "/review/list.ztp", method = RequestMethod.GET)
	public String reviewList(Model model, HttpSession session, @RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		
		int totalCount = reviewService.getListCount();
		PageInfo pageInfo = this.getPageInfo(page, totalCount);
		
		List<Review> reviewList = reviewService.selectReviewList(pageInfo);
		
		Member member = (Member) session.getAttribute("loginUser");
		
		model.addAttribute("member", member);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("reviewList", reviewList);
		return "review/list";
		
	}
	
	/**
	 * Navigator Start/End값 설정
	 */
	public PageInfo getPageInfo(int currentPage, int totalCount) {
		
		int boardLimit = 10;
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
	 * : 후기 리스트에서 게시물을 클릭할 경우 해당 게시물에 대한 like VO(게시판ID, 게시글NO, 회원ID)정보를 LikeController의 checkLike로 보낸 후 나온 값으로 좋아요 유/무 확인.
	 * 또한 게시물을 클릭할 경우 해당 게시물에 대한 조회수 1 증가
	 */
	@RequestMapping(value = "/review/detail.ztp", method = RequestMethod.GET)
	public ModelAndView reviewDetail(
			@RequestParam("reviewPostNo") int reviewPostNo
			, HttpSession session
			, ModelAndView mv) {
		
		try {
			
			Member member;
			String memberId;

			if (session.getAttribute("loginUser") == null) {
				memberId = null;
			} else {
				member = (Member) session.getAttribute("loginUser");
				memberId = member.getMemberId();
			}
			
			Review review = reviewService.selectReview(reviewPostNo); // 해당 review게시물 내용 가져오기
			int animalNo = review.getReviewPostNo(); // 
			Animal animal = reviewService.selectAnimalByAnimalNo(animalNo);
			
			Like like = new Like("R", reviewPostNo, memberId);
			int likeResult = likeController.checkLike(like); // 해당 게시물의 like 유/무 가져오기
			
			String boardId = "R";
			Comment comment = new Comment();
			comment.setBoardId(boardId);
			comment.setPostNo(reviewPostNo);
			List<Comment> commentList = commentController.commentList(comment); // 해당 게시물의 댓글 가져오기
			
			reviewService.viewCount(reviewPostNo); // 조회수 1 증가
			
			mv.addObject("boardId", boardId); // 현재 게시판 ID
			mv.addObject("like", likeResult); // 좋아요 유무
			mv.addObject("review", review); // 게시물 정보 
			mv.addObject("commentList", commentList); // 댓글 정보
			mv.addObject("Animal", animal); // 동물 정보
			mv.setViewName("review/detail");
			
		} catch (Exception e) {
			
			mv.addObject("message", e.getMessage()).setViewName("common/error");
			
		}
		
		return mv;
		
	}
	
	/**
	 * 후기 수정 (미완성)
	 */
	@RequestMapping(value = "/review/modify.ztp", method = RequestMethod.POST)
	public ModelAndView reviewModify (@ModelAttribute Review review
			, HttpSession session, HttpServletRequest request, ModelAndView mv) {
		
		System.out.println(review);
		
		
		return mv;
		
	}
	
	/**
	 * 후기 삭제
	 */
	@RequestMapping(value = "/review/delete.ztp", method = RequestMethod.GET)
	public String reviewDelete(int reviewPostNo, Model model, HttpServletRequest request) {
		
		try {
			
			// 파일을 먼저 삭제하기 위한 부분
			Review review = reviewService.selectReview(reviewPostNo);
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String deletePath = root + "\\uploadFiles\\review";
			String deleteFilepath = deletePath + "\\" + review.getReviewImageName();
			File deleteFile = new File(deleteFilepath);
			
			if(deleteFile.exists()) {
				
				deleteFile.delete();
				
			}
			
			// 파일 삭제 후 정보 삭제
			int result = reviewService.deleteReview(reviewPostNo);
			
			if (result > 0) {
				
				return "redirect:/review/list.ztp";
				
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
