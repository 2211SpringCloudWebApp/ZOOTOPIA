package com.kh.zootopia.reservation.service;

import java.util.List;


import com.kh.zootopia.reservation.domain.Reservation;

public interface ReservationService {

	
	/**
	 * 입양 상담 신청자 목록 출력(임보자 = 게시글 작성자만 볼 수 있음)
	 * @param animalNo
	 * @return
	 */
	List<Reservation> selectAllapplicantByAnimalNo(int animalNo);

	/**
	 * 입양 상담 예약 등록 Service
	 * @param reservation
	 * @return
	 */
	int insertReservation(Reservation reservation);

	/**
	 * 입양 상담 예약 취소 Service
	 * @param reservationNo
	 * @return
	 */
	int deleteReservation(int reservationNo);

}
