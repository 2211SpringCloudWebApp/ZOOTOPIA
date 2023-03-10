package com.kh.zootopia.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.manager.service.ManagerService;
import com.kh.zootopia.member.domain.Member;


@Controller
public class ManagerController {

	@Autowired
	private ManagerService mService;
	
	/**
	 * 멤버리스트 Controller
	 * @param model
	 * @return String
	 */
	@RequestMapping(value="/member/list.ztp", method= RequestMethod.GET)
	public String selectMembers(Model model) {
		try {
			List<Member> mList = mService.selectMembers();
			model.addAttribute("mList", mList);
			return "manager/memberList";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	/**
	 * 멤버검색 Controller
	 * @param search
	 * @param model
	 * @return String
	 */
	@RequestMapping(value="/member/search.ztp", method=RequestMethod.GET)
	public String searchMember(@ModelAttribute Search search, Model model) {
		try {
			List<Member> mList = mService.searchMember(search);
			
			if(!mList.isEmpty()) {
				model.addAttribute("condition", search.getCondition());
				model.addAttribute("keyword", search.getKeyword());
				model.addAttribute("mList", mList);
				return "manager/memberList";
			}else {
				model.addAttribute("message", "회원정보를 찾을 수 없습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}

	/**
	 * 멤버디테일 Controller
	 * @param memberId
	 * @param model
	 * @return String
	 */
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
	
	/**
	 * 멤버삭제 Controller
	 * @param memberId
	 * @param model
	 * @return
	 */
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
	
	/**
	 * 체크된멤버삭제 Controller
	 * @param memberIds
	 * @return String
	 */
	@RequestMapping(value="/member/deleteMembers.ztp", method=RequestMethod.POST)
	public String deleteCheckedMembers(@RequestParam("rowcheck") List<String> memberIds) {
		for(String memberId : memberIds) mService.deleteCheckedMembers(memberId);
		return "redirect:/member/list.ztp";
	}
	
	/**
	 * 미승인 입양공고리스트 Controller
	 * @param model
	 * @return String
	 */
	@RequestMapping(value="/manager/selectAdopt.ztp", method=RequestMethod.GET)
	public String selectAdopt(Model model) {
		try {
			List<AdoptPost> aList = mService.selectAdopt();
			model.addAttribute("aList", aList);
			return "manager/adoptList";			
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
}
