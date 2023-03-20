package com.kh.zootopia.member.controller;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.member.service.MemberService;
import com.kh.zootopia.review.controller.ReviewController;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;
import com.kh.zootopia.review.service.ReviewService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
//	@Autowired
//	private AdoptAnimalService aService;
//	
	@Autowired
	private ReviewController reviewController;
	@Autowired
	private ReviewService reviewService;

	// 로그인 페이지 출력
	@RequestMapping(value = "/member/loginView.ztp", method = RequestMethod.GET)
	public String loginView() {
		return "member/login";
		
	}
	

	// 회원가입 페이지 출력
	@RequestMapping(value = "/member/registerView" , method = RequestMethod.GET)
	public String RegisterView() {
		return "member/register";
	}
	
	// 회원탈퇴 페이지 출력
	@RequestMapping(value= "/member/removeView.ztp" , method = RequestMethod.GET)
	public String memberRemoveView(Model model, String memberId) {
		System.out.println(memberId);
		model.addAttribute("memberId" , memberId);
		return "member/mypageRemove";
	}
	

	// 멤버 회원가입
	@RequestMapping(value = "/member/register.ztp" , method = RequestMethod.POST)
	public String memberRegister(
			HttpServletRequest request
			, @ModelAttribute Member member
			, String year
			, String month
			, String day
			, Model model
			) {
			try {
				String birthDay = year + "-" + month + "-" + day;
				Date birthDate = Date.valueOf(birthDay);
				member.setMemberBirthday(birthDate);
				System.out.println(member);
				request.setCharacterEncoding("UTF-8");
				int result = mService.insertMember(member);
				if(result> 0) {
					return "redirect:/index.jsp";
				}else {
					model.addAttribute("message" , "회원가입이 완료되지 않았습니다");
					return "common/error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("message", e.getMessage());
				return "common/error";
			}
		
	}
	
	// 멤버 수정
	@RequestMapping(value = "/member/modify.ztp" , method = RequestMethod.POST)
	public String memberModify(
			@ModelAttribute Member member
			,HttpServletRequest request
			,String memberId
			,String memberPw
			,Model model
			) {
			try {
				System.out.println(member);
				int result = mService.updateMember(member);
				if(result > 0 ) {
					Member mParam = new Member(memberId, memberPw);
					member = mService.checkMemberLogin(mParam);
					HttpSession session = request.getSession();
					session.setAttribute("loginUser", member);
					return "redirect:/index.jsp";
				}else {
					model.addAttribute("message" , "회원 정보 수정에 실패");
					return "common/error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("message", e.getMessage());
				return "common/error";
			}
	}
	
	// 멤버 삭제
	@RequestMapping(value = "/member/Remove.ztp" , method = RequestMethod.POST)
	public String memberRemove(
			String memberId
			,Model model
			) {
		System.out.println(memberId);
			try {
				int result = mService.deleteMember(memberId);
				if(result > 0) {
					return "redirect:/member/logout.ztp";
				}else {
					model.addAttribute("message" , "회원탈퇴에 실패");
					return "common/error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("message", e.getMessage());
				return "common/error";
			}
	} 
	
	// 멤버 로그인
	@RequestMapping(value = "/member/login.ztp", method= RequestMethod.POST)
	public String memberLogin(
			HttpServletRequest request
			,String memberId
			,String memberPw
			,Model model
			) {
			try {
				Member mParam = new Member(memberId, memberPw);
				Member member = mService.checkMemberLogin(mParam);
				HttpSession session = request.getSession();
				if(member!= null) {
					session.setAttribute("loginUser", member);
					return "redirect:/index.jsp";
				}else {
					model.addAttribute("message", "로그인 실패");
					return "common/error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
	}
	
	// 멤버 로그아웃
	@RequestMapping(value = "/member/logout.ztp" , method = RequestMethod.GET)
	public String memberLogout(HttpSession session, Model model) {
		if(session != null) {
			session.invalidate();
			return "redirect:/index.jsp";
		}else {
			model.addAttribute("message" ,"로그아웃을 완료 못함");
			return "common/error";
		}	
	}
	
	// 멤버 아이디 찾기 페이지 이동
	@RequestMapping(value= "/member/findIdPage.ztp",method= RequestMethod.GET)
	public String memberFindIdPage() {
		return "member/findId";
	}
	
	// 멤버 아이디 찾기
	@RequestMapping(value = "/member/findId.ztp", method = RequestMethod.GET)
	public String memberFindId(
			String memberName
			,String memberEmail
			, Model model
			) {
		try {
			Member mParam = new Member();
			mParam.setMemberName(memberName);
			mParam.setMemberEmail(memberEmail);
			Member member = mService.findId(mParam);
			model.addAttribute("member" , member);
				return "member/findIdAfter";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message",e.getMessage());
			return "common/error";
		}
	}
	// 멤버 비밀번호 찾기 페이지 이동
	@RequestMapping(value= "/member/findPwPage.ztp" , method = RequestMethod.GET)
	public String memberFindPwPage() {
		return "member/findPw";
	}
	// 멤버 비밀번호 찾기
	@RequestMapping(value = "/member/findPw.ztp" , method = RequestMethod.POST)
	public String memberFindPw(
			String memberName
			,String memberId
			,String memberEmail
			, Model model
			) {
		try {
			Member mParam = new Member(memberId, memberName, memberEmail);
			System.out.println(mParam);
			Member member = mService.findPw(mParam);
			//System.out.println(member);
			model.addAttribute("member", member);
				return "member/findPwAfter";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message" ,e.getMessage());
			return "common/error";
		}
	}
	
	// 마이페이지로 이동
	@RequestMapping(value="/member/mypage.ztp" , method = RequestMethod.GET)
	public String MypageInfo(HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("loginUser");
		System.out.println(member);
		model.addAttribute("member", member);
		return "member/mypageInfo";
	}
	
	// 마이페이지 입양공고 게시판
	@RequestMapping(value = "/member/mypageAdoptPost.ztp" , method = RequestMethod.GET)
	public String mypageAdoptPostList(
			HttpSession session
			,@RequestParam(value = "page", required = false, defaultValue = "1") Integer page
			,Model model
			) {
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		int totalCount = mService.getAdoptPostCount();
		PageInfo pageInfo = reviewController.getPageInfo(page, totalCount);
		List<AdoptPost> adoptPostList = mService.mypageSelectAdoptPostList(pageInfo, memberId);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("adoptPostList", adoptPostList);
		return "/member/mypageAdoptPostList";
	}
	
	// 마이페이지 입양공고 게시판 검색
	@RequestMapping(value= "/member/adoptPostSearch.ztp", method = RequestMethod.POST)
		public String mypageadoptPostSearch(
				@ModelAttribute Search search
				,@RequestParam(value = "page", required = false, defaultValue = "1") Integer page
				,Model model
				) {
			int totalCount = mService.mypageGetAdoptPostListCount(search);
			PageInfo pageInfo = reviewController.getPageInfo(page, totalCount);
			List<Review> reviewList = reviewService.mypageSearchReview(pageInfo, search);
			model.addAttribute("reviewList",reviewList);
			return "m";
		}
	
	// 마이페이지 입양공고  게시판 작성한 댓글
	@RequestMapping(value ="/member/mypageAdoptPostComment.ztp" , method = RequestMethod.GET)
	public String mypageAdoptPostComment() {
		
		return "/member/mypageAdoptPostComment";
	}
	
	// 마이페이지 입양공고 게시판 좋아요
	@RequestMapping(value ="/member/mypageAdoptPostLike.ztp" , method = RequestMethod.GET)
	public String mypageAdoptPostLike() {
		
		return "/member/mypageAdoptPostLike";
	}
	
	
	// 마이페이지 "입양후기 게시판
	@RequestMapping(value = "/member/mypageReview.ztp" , method = RequestMethod.GET)
	public String mypageReviewList(
			HttpSession session
			,@RequestParam(value = "page", required = false, defaultValue = "1") Integer page
			,Model model
			) {
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		int totalCount = reviewService.getListCount();
		PageInfo pageInfo = reviewController.getPageInfo(page, totalCount);
		List<Review> reviewList = reviewService.mypageSelectReviewList(pageInfo, memberId);
		System.out.println(reviewList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("reviewList", reviewList);
		return "member/mypageReviewList";
	}
	

	
	// 마이페이지 입양후기 검색
	@RequestMapping(value="/member/reviewSearch.ztp" , method = RequestMethod.POST)
	public String mypageReviewSearch(
			@ModelAttribute Search search
			,@RequestParam(value = "page", required = false, defaultValue = "1") Integer page
			,@RequestParam(value = "category") String category
			,Model model
			) {
		int totalCount = reviewService.mypageGetListCount(search);
		PageInfo pageInfo = reviewController.getPageInfo(page, totalCount);
		List<Review> reviewList = reviewService.mypageSearchReview(pageInfo, search);
		model.addAttribute("reviewList",reviewList);
		
		return "member/mypageReview";
		
	}
	

	
		
	// 마이페이지 후기 게시판 작성한 댓글
	@RequestMapping(value = "/member/mypageReviewComment.ztp" , method = RequestMethod.GET)
	public String mypageReviewComment(
			HttpSession session
			,@ModelAttribute Comment comment
			,@RequestParam(value = "page", required = false, defaultValue = "1") Integer page
			,Model model
			) {
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		int totalCount = mService.getReviewCommentCount(memberId);
		PageInfo pageInfo = reviewController.getPageInfo(page, totalCount);
		List<Comment> reviewCommentList= mService.selectReviewCommentList(pageInfo, memberId);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("reviewCommentList", reviewCommentList);
		return "member/mypageReviewComment";
	}
	
	//마이페이지 후기 게시판 좋아요 누른 글
	@RequestMapping(value = "/member/mypageReviewLike.ztp" , method = RequestMethod.GET)
	public String MypageLike(
			HttpSession session
			,@ModelAttribute Like like
			,@RequestParam(value = "page", required = false, defaultValue = "1") Integer page
			,Model model
			) {
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		int totalCount = mService.getReviewLikeCount(memberId);
		PageInfo pageInfo = reviewController.getPageInfo(page, totalCount);
		List<Review> reviewLikeList =  mService.selectReviewLikeList(pageInfo ,memberId);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("reviewLikeList", reviewLikeList);
		return "member/mypageReviewLike";
	}
	
	// 마이페이지 후기 상세페이지 
	@RequestMapping(value = "/member/reviewDetail.ztp" , method= RequestMethod.GET)
	public String mypageReviewDetail(
			@ModelAttribute Review review
			) {
		return "review/detail";
	}
	
	
	// 마이페이지 후기 게시글  댓글 삭제
	@RequestMapping(value="/member/deleteComment.ztp" , method = RequestMethod.POST)
	public String MypageDelete(
			@RequestParam("reviewComment") Review review

			) {
		int result = mService.deleteReviewComment(review);
		
		return "";
	}
	
	
	 //마이페이지 본인이 입양한 동물들 출력 (return형식과 return값 추가해주세요)
	@RequestMapping(value = "/member/animalList.ztp", method = RequestMethod.GET)
	public String selectAnimalbyAnimalAdopterId(HttpSession session, Model model) {
		
		Member member = (Member)session.getAttribute("loginUser");
		String memberId = member.getMemberId();
		
		List<Animal> animalList = mService.selectAnimalbyAnimalAdopterId(memberId);
		
		model.addAttribute("animalList", animalList);
		return "member/animalList";
		
	}

}