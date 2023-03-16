package com.kh.zootopia.reservation.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.reservation.domain.Reservation;

public interface ReservationStore {

	/**
	 * 입양 상담 신청자 목록 출력 Store(임보자 = 게시글 작성자만 볼 수 있음) 
	 * @param session
	 * @param animalNo
	 * @return
	 */
	List<Reservation> selectAllapplicantByAnimalNo(SqlSession session, int animalNo);

	/**
	 * 입양 상담 예약 등록 Store
	 * @param session
	 * @param reservation
	 * @return
	 */
	int insertReservation(SqlSession session, Reservation reservation);

}
