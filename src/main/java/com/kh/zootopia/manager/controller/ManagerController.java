package com.kh.zootopia.manager.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.comment.controller.CommentController;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.manager.domain.DateDTO;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.manager.service.ManagerService;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.reservation.domain.Reservation;
import com.kh.zootopia.review.controller.ReviewController;
import com.kh.zootopia.review.domain.PageInfo;


@Controller
public class ManagerController {

	@Autowired
	private ManagerService mService;
	@Autowired
	private ReviewController reviewController;
	@Autowired
	private CommentController commentController;
	
	// 관리자여부체크 Controller
	public String checkAdmin(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("loginUser");
		if(member!=null) { // member 객체 유/무 (로그인 유/무)
			String mAdminYN = member.getmAdminYN(); 
			if(mAdminYN.equals("N")) {
				return "/member/loginView.ztp";
			}else {
				return "Y";
			}			
		}else {
			model.addAttribute("message", "잘못된 접근입니다.");
			return "common/error";
		}
	}
	
	// ** 관리자페이지
	// 관리자페이지 View Controller
	@RequestMapping(value="/manager/viewManager.ztp", method=RequestMethod.GET)
	public ModelAndView viewManagerPage(HttpSession session, ModelAndView mv, Model model) {
		String adminYN = checkAdmin(session, model);
		if (adminYN.equals("Y")) {
			mv.setViewName("manager/manager-home");
		} else {
			mv.addObject("message", "관리자권한이 없습니다.").setViewName("common/error");
		}
		return mv;
	}
	
	// **회원관리
	// 멤버리스트 Controller
	@RequestMapping(value="/member/list.ztp", method= RequestMethod.GET)
	public String selectMembers(Model model, HttpSession session, @RequestParam(value="page",required=false, defaultValue="1") Integer page) {
		try {
			String adminYN = checkAdmin(session, model);
			if(adminYN.equals("Y")) {
				int totalCount = mService.getMemberListCount(); 
				PageInfo pi = reviewController.getPageInfo(page, totalCount);
				List<Member> mList = mService.selectMembers(pi);
				model.addAttribute("pi", pi);
				model.addAttribute("mList", mList);
				return "manager/memberList";				
			}else {
				model.addAttribute("message", "관리자권한이 없습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// 멤버검색 Controller
	@RequestMapping(value="/member/search.ztp", method=RequestMethod.GET)
	public String searchMember(@ModelAttribute Search search,HttpSession session, Model model, @RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		try {
			String adminYN = checkAdmin(session, model);
			if(adminYN.equals("Y")) {
				int totalCount = mService.getSearchMemberCount(search);
				PageInfo pi = reviewController.getPageInfo(page, totalCount);
				
				List<Member> mList = mService.searchMember(search, pi);
				
				if(!mList.isEmpty()) {
					model.addAttribute("pi", pi);
					model.addAttribute("condition", search.getCondition());
					model.addAttribute("keyword", search.getKeyword());
					model.addAttribute("mList", mList);
					return "manager/memberSearch";
				}else {
					model.addAttribute("message", "회원정보를 찾을 수 없습니다.");
					return "common/error";
				}
			}else {
				model.addAttribute("message", "관리자권한이 없습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}

	// 멤버디테일 Controller
	@RequestMapping(value="member/detail.ztp", method=RequestMethod.GET)
	public String detailMember(@RequestParam("memberId") String memberId, Model model) {
		try {
			Member mOne = mService.selectOneById(memberId);
			model.addAttribute("mOne", mOne);
			return "manager/memberDetail";			
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// 멤버삭제 Controller
	@RequestMapping(value="/member/delete.ztp", method=RequestMethod.GET)
	public String deleteMember(@RequestParam("memberId") String memberId, Model model) {
		try {
			int result = mService.deleteMember(memberId);
			if(result > 0) {
				return "redirect:/member/list.ztp";
			}else {
				model.addAttribute("message", "회원삭제가 이루어지지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// 체크된멤버삭제 Controller
	@RequestMapping(value="/member/deleteMembers.ztp", method=RequestMethod.GET)
	public String deleteCheckedMembers(@RequestParam("memberId") List<String> memberIds) {
		for(String memberId : memberIds) mService.deleteCheckedMembers(memberId);
		return "redirect:/member/list.ztp";
	}
	
	
	// ** 입양공고관리
	// 미승인 입양공고리스트 Controller
	@RequestMapping(value="/manager/selectAdopt.ztp", method=RequestMethod.GET)
	public String selectAdopt(HttpSession session, Model model, @RequestParam(value="page",required=false, defaultValue="1") Integer page) {
		try {
			String adminYN = checkAdmin(session, model);
			if(adminYN.equals("Y")) {
				int totalCount = mService.getAdoptListCount();
				PageInfo pi = reviewController.getPageInfo(page, totalCount);
				List<AdoptAnimalPost> aList = mService.selectAdopt(pi);
				model.addAttribute("pi", pi);
				model.addAttribute("aList", aList);
				return "manager/adoptList";	
			}else {
				model.addAttribute("message", "관리자권한이 없습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}

	// 미승인 입양공고리스트에서 승인 Controller
	@RequestMapping(value="/manager/approveAdopt.ztp", method=RequestMethod.GET)
	public String approveAdopts(@RequestParam("adoptPostNo") List<Integer> adoptPostNos) {
		for(int adoptPostNo : adoptPostNos) mService.approveAdopts(adoptPostNo);
		return "redirect:/manager/selectAdopt.ztp";
	}

	// 입양공고리스트 내 여러개 삭제 Controller
	@RequestMapping(value="/manager/deleteAdopts.ztp", method=RequestMethod.POST)
	public String deleteAdopts(@RequestParam("adoptPostNo") List<Integer> adoptPostNos) {
		for(int adoptPostNo : adoptPostNos) mService.deleteAdopts(adoptPostNo);
		return "redirect:/adoptAnimal/list.ztp";
	}
	
	// 미승인 입양공고디테일 Controller
	@RequestMapping(value="/manager/detailAdopt.ztp", method=RequestMethod.GET)
	public String detailAdopt(@RequestParam("animalNo") Integer animalNo, Model model) {
		try {
			AdoptAnimalPost aPost = mService.detailAdopt(animalNo);
			model.addAttribute("aPost", aPost);
			return "manager/adoptDetail";			
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	
	// ** 예약관리
	// 예약페이지 View Controller
	@RequestMapping(value="/manager/viewReservation.ztp", method=RequestMethod.GET)
	public String viewReservation(HttpSession session, Model model) {
		String adminYN = checkAdmin(session, model);
		if(adminYN.equals("Y")) {
			return "manager/reservation";
		}else {
			model.addAttribute("message", "관리자권한이 없습니다.");
			return "common/error";
		}
	}
	
	// 예약페이지 Detail Controller
	@RequestMapping(value="/manager/viewReservation.ztp", method=RequestMethod.POST)
	public String viewReservation(Model model,
			@RequestParam("yearParam") String year,
			@RequestParam("monthParam") String month,
			@RequestParam("dateParam") String date
			) {
		try {
//			String dateString = year + "-" + month + "-" + date;
			System.out.println(year + month + date);
			DateDTO dateDTO = new DateDTO(year, month, date);
			List<AdoptPost> aList = mService.viewReservation(dateDTO);
			model.addAttribute("aList", aList);
			return "manager/reservation";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// 예약승인 Controller
	@RequestMapping(value="/manager/approveReserv.ztp", method=RequestMethod.POST)
	public String approveReserv(@RequestParam("reservationNo") int reservationNo, Model model) {
		try {
			// 예약 번호에 맞는 reservation객체 가져오기
			Reservation rParam = mService.selectOneByReservationNo(reservationNo);
			//SELECT * FROM ADOPT_RESERVATION_TBL WHERE ANIMAL_NO = #{aniamlNo }
			int result = mService.approveReserv(rParam);
			if(result > 0) {
				return "redirect:/manager/viewReservation.ztp";
			}else {
				model.addAttribute("message", "예약승인이 이루어지지않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// ** 리뷰관리
	// 체크된 리뷰삭제 Controller
	@RequestMapping(value="/manager/deleteReviews.ztp", method=RequestMethod.GET)
	public String deleteCheckedReviews(@RequestParam("reviewPostNo") List<Integer> reviewPostNos) {
		System.out.println(reviewPostNos);
		for(int reviewPostNo : reviewPostNos) mService.deleteCheckedReviews(reviewPostNo);
		return "redirect:/review/list.ztp";
	}
	

	// **댓글관리
	// 댓글리스트 Controller
	@RequestMapping(value="/manager/commentList.ztp", method= RequestMethod.GET)
	public String selectComments(Model model, HttpSession session, @RequestParam(value="page",required=false, defaultValue="1") Integer page) {
		try {
			String adminYN = checkAdmin(session, model);
			if(adminYN.equals("Y")) {
				int totalCount = mService.getCommentListCount(); 
				PageInfo pi = commentController.getPageInfo(page, totalCount);
				List<Comment> cList = mService.selectComments(pi);
				model.addAttribute("pi", pi);
				model.addAttribute("cList", cList);
				return "manager/commentList";				
			}else {
				model.addAttribute("message", "관리자권한이 없습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// 체크된댓글삭제 Controller
	@RequestMapping(value="/manager/deleteComments.ztp", method=RequestMethod.GET)
	public String deleteCheckedComments(@RequestParam("commentNo") List<Integer> commentNos) {
		System.out.println(commentNos);
		for(int commentNo : commentNos) mService.deleteCheckedComments(commentNo);
		return "redirect:/manager/commentList.ztp";
	}
	
	// 댓글디테일 Controller
	@RequestMapping(value="manager/detailComment.ztp", method=RequestMethod.GET)
	public String detailComment(@RequestParam("commentNo") int commentNo, Model model) {
		try {
			Comment comment = mService.detailComment(commentNo);
			model.addAttribute("comment", comment);
			return "manager/commentDetail";			
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// 댓글삭제 Controller
	@RequestMapping(value="/manager/deleteComment.ztp", method=RequestMethod.GET)
	public String deleteComment(@RequestParam("commentNo") int commentNo, Model model) {
		try {
			int result = mService.deleteComment(commentNo);
			if(result > 0) {
				return "redirect:/manager/commentList.ztp";
			}else {
				model.addAttribute("message", "댓글삭제가 이루어지지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
}
