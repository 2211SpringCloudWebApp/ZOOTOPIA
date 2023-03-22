package com.kh.zootopia.reservation.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.reservation.domain.Reservation;
import com.kh.zootopia.reservation.store.ReservationStore;

@Repository
public class ReservationStoreLogic implements ReservationStore {

	/**
	 * 입양 상담 신청자 목록 출력 StoreLogic(임보자 = 게시글 작성자만 볼 수 있음)
	 */
	@Override
	public List<Reservation> selectAllapplicantByAnimalNo(SqlSession session, int animalNo) {
		List<Reservation> rList = session.selectList("ReservationMapper.selectAllapplicantByAnimalNo", animalNo);
		return rList;
	}

	/**
	 * 입양 상담 예약 등록 StoreLogic
	 */
	@Override
	public int insertReservation(SqlSession session, Reservation reservation) {
		int result = session.insert("ReservationMapper.insertReservation", reservation);
		return result;
	}

	/**
	 * 입양 상담 예약 취소 StoreLogic
	 */
	@Override
	public int deleteReservation(SqlSession session, int reservationNo) {
		int result = session.delete("ReservationMapper.deleteReservation", reservationNo);
		return result;
	}

}
