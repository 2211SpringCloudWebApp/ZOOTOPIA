package com.kh.zootopia.reservation.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zootopia.reservation.domain.Reservation;
import com.kh.zootopia.reservation.service.ReservationService;
import com.kh.zootopia.reservation.store.ReservationStore;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationStore rStore;
	@Autowired
	private SqlSession session;

	/**
	 * 입양 상담 신청자 목록 출력(임보자 = 게시글 작성자만 볼 수 있음)
	 */
	@Override
	public List<Reservation> selectAllapplicantByAnimalNo(int animalNo) {
		List<Reservation> rList = rStore.selectAllapplicantByAnimalNo(session, animalNo);
		return rList;
	}

	/**
	 * 입양 상담 예약 등록 ServiceImpl
	 */
	@Override
	public int insertReservation(Reservation reservation) {
		int result = rStore.insertReservation(session, reservation);
		return result;
	}

	/**
	 * 입양 상담 예약 취소 ServiceImpl
	 */
	@Override
	public int deleteReservation(int reservationNo) {
		int result = rStore.deleteReservation(session, reservationNo);
		return result;
	}

}
