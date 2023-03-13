package com.kh.zootopia.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zootopia.notice.domain.Notice;
import com.kh.zootopia.notice.service.NoticeService;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	// 공지사항 등록화면
	@RequestMapping(value="/notice/registerView.ztp", method=RequestMethod.GET)
	public String noticeRegisterView() {
		try {
			return "notice/register";
		} catch (Exception e) {
			return "common/error";
		}
	}
	
	// 공지사항 등록
	@RequestMapping(value="/notice/register.ztp", method=RequestMethod.POST)
	public String noticeRegister(
			HttpServletRequest request
			, @ModelAttribute Notice notice
			, Model model) {
		try {
			request.setCharacterEncoding("UTF-8");
			int result = nService.insertNotice(notice);
			if(result > 0) {
				return "redirect:/notice/list.ztp";
			}else {
				model.addAttribute("message", "");
				return "";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// 공지사항 수정
	@RequestMapping(value="/notice/modify.ztp", method=RequestMethod.POST)
	public String noticeModify(@ModelAttribute Notice notice, Model model) {
		try {
			int result = nService.updateNotice(notice);
			if(result > 0) {
				return "redirect:/notice/list.ztp";
			}else {
				model.addAttribute("message", "");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}
	
	// 공지사항 삭제
	@RequestMapping(value="/notice/remove.ztp", method=RequestMethod.GET)
	public String noticeRemove(@RequestParam("noticeNo") int noticeNo, Model model) {
		try {
			int result = nService.deleteNotice(noticeNo);
			if(result > 0) {
				return "redirect:/notice/list.ztp";
			}else {
				model.addAttribute("message", "");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}

	// 공지사항 목록 조회
	@RequestMapping(value="/notice/list.ztp", method=RequestMethod.GET)
	public String noticeListView(Model model) {
		List<Notice> nList = nService.selectNoticeList();
		model.addAttribute("nList", nList);
		return "notice/list";
	}
	
	// 공지사항 상세 조회
	@RequestMapping(value="/notice/detail.ztp", method={RequestMethod.GET, RequestMethod.POST})
	public String noticeDetailView(
			@RequestParam("noticeNo") int noticeNo, Model model) {
		try {
			Notice notice = nService.selectOneByNo(noticeNo);
			model.addAttribute("notice", notice);
			return "notice/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", e.getMessage());
			return "common/error";
		}
	}	
}
