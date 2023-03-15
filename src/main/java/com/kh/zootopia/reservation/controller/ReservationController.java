package com.kh.zootopia.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.zootopia.reservation.domain.Reservation;
import com.kh.zootopia.reservation.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rService;
	
	/**
	 * 입양 상담 예약 신청 폼
	 * @return
	 */
	@RequestMapping(value = "/reservation/registerView.ztp", method = RequestMethod.GET)
	public String reservationRegisterView() {
		return "reservation/register";
	}
	
	/**
	 * 입양 상담 신청자 목록 출력(임보자 = 게시글 작성자만 볼 수 있음)
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/reservation/applicantList.ztp", method = RequestMethod.GET)
	public ModelAndView applicantListView(
			int animalNo
			, ModelAndView mv) {
		
		try {
			List<Reservation> rList = rService.selectAllapplicantByAnimalNo(animalNo);
			if (!rList.isEmpty()) {
				mv.addObject("rList", rList).setViewName("reservation/applicantList");
			} else {
				mv.addObject("message", "신청자 없음").setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}
		
		return mv;
	}

}
