package com.kh.zootopia.reservation.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.zootopia.reservation.domain.Reservation;
import com.kh.zootopia.reservation.service.ReservationService;

import oracle.net.aso.p;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rService;
	
	/**
	 * 입양 상담 예약 신청 폼
	 * @return
	 */
	@RequestMapping(value = "/reservation/registerView.ztp", method = RequestMethod.GET)
	public ModelAndView reservationRegisterView(
			@RequestParam("animalNo") String animalNo
			, @RequestParam("animalFosterId") String animalFosterId
			, ModelAndView mv) {
		
		try {
			mv.addObject("animalNo", animalNo).addObject("animalFosterId", animalFosterId).setViewName("reservation/register");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}
		return mv;
		
	}
	
	/**
	 * 입양 상담 예약 등록
	 * @param request
	 * @param animalNo
	 * @param fosterId
	 * @param adopterId
	 * @param reservationTimeStr
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "/reservation/register.ztp", method = RequestMethod.POST)
	public ModelAndView reservationRegister(
			HttpServletRequest request
			, int animalNo
			, String fosterId
			, String adopterId
//			, @RequestParam("reservationTime") String reservationTimeStr
			, String rDate
			, String rTime
			, ModelAndView mv) {
		try {
			request.setCharacterEncoding("UTF-8");
			

			
			// 받은 값을 timestamp타입으로 바꿔주기
//			Timestamp reservationTime = Timestamp.valueOf(reservationTimeStr.replace('T', ' ').concat(":00"));
			Timestamp reservationTime = Timestamp.valueOf(rDate.concat(" " + rTime).concat(":00"));
			
			// Reservation 객체에 넣어주기
			Reservation reservation = new Reservation(animalNo, fosterId, adopterId, reservationTime);
			
			int result = rService.insertReservation(reservation);
			if (result > 0) {
				// 예약 성공 시
				mv.setViewName("reservation/success");
			} else {
				mv.addObject("message", "예약 실패").setViewName("common/error");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}
		return mv;
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
				mv.setViewName("reservation/noApplicant");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}
		
		return mv;
	}

	@RequestMapping(value = "/reservation/delete.ztp", method = RequestMethod.GET)
	public ModelAndView deleteReservation(
			int reservationNo
			, int animalNo
			, ModelAndView mv) {
		
		try {
			int result = rService.deleteReservation(reservationNo);
			if (result > 0) {
				mv.setViewName("redirect:/adoptAnimal/detailView.ztp?animalNo=" + animalNo);
			} else {
				mv.addObject("message", "예약 취소 실패").setViewName("common/error");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("message", e.getMessage()).setViewName("common/error");
		}
		return mv;
	}
}
