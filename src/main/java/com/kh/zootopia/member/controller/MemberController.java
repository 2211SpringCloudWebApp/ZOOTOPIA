package com.kh.zootopia.member.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;

	// 로그인 페이지 출력
	@RequestMapping(value = "/member/loginView.ztp", method = RequestMethod.GET)
	public String loginView() {
		
		return "member/login";
		
	}
	
//	@RequestMapping(value = "", method = RequestMethod.POST)
//	public String registerView() {
//		
//		return "";
//	}
	// 멤버 회원가입
	@RequestMapping(value = "/member/register.ztp" , method = RequestMethod.POST)
	public String memberRegister(
			HttpServletRequest request
			, @ModelAttribute Member member
			, Model model
			) {
			try {
				request.setCharacterEncoding("UTF-8");
				int result = mService.insertMember(member);
				if(result> 0) {
					return "redirect:/index.jsp";
				}else {
					model.addAttribute("msg" , "회원가입이 완료되지 않았습니다");
					return "common/error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
		
	}
	
	// 멤버 수정
	@RequestMapping(value = "/member/modify.ztp" , method = RequestMethod.POST)
	public String memberModify(
			@ModelAttribute Member member
			,Model model
			) {
			try {
				int result = mService.updateMember(member);
				if(result > 0 ) {
					return "redirect:/index.jsp";
				}else {
					model.addAttribute("msg" , "회원 정보 수정에 실패");
					return "common/error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
	}
	
	// 멤버 삭제
	@RequestMapping(value = "/member/Remove.ztp" , method = RequestMethod.POST)
	public String memberRemove(
			String memberId
			,Model model
			) {
			try {
				int result = mService.deleteMember(memberId);
				if(result > 0) {
					return "redirect:/member/logout.ztp";
				}else {
					model.addAttribute("msg" , "회원탈퇴에 실패");
					return "common/error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
	} 
	
	// 멤버 로그인
	@RequestMapping(value = "/member/login.ztp", method= RequestMethod.GET)
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
					session.setAttribute("longinUser", member);
					return "redirect:/메인페이지";
				}else {
					model.addAttribute("msg", "로그인 실패");
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
			return "redirect:/메인페이지";
		}else {
			model.addAttribute("msg" ,"로그아웃을 완료 못함");
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
	
	//
	public String showMypage() {
		
		return "";
	}
	
	public String showMembers() {
		
		return "";
	}

}








