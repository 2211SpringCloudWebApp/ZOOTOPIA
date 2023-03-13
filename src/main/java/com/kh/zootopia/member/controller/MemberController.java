package com.kh.zootopia.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	/**
	 * 관리자페이지(멤버리스트)
	 * @param model
	 * @return String
	 */
//	@RequestMapping(value="/member/list.ztp", method= RequestMethod.GET)
//	public String selectMembers(Model model) {
//		try {
//			List<Member> mList = mService.selectMembers();
//			model.addAttribute("mList", mList);
//			return "manager/memberList";
//		} catch (Exception e) {
//			model.addAttribute("message", e.getMessage());
//			return "common/error";
//		}
//	}

}
