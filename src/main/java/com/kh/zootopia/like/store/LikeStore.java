package com.kh.zootopia.like.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.like.domain.Like;

public interface LikeStore {

	/**
	 * 좋아요 확인
	 * @param session
	 * @param like
	 * @return int
	 */
	public int checkLike(SqlSession session, Like like);

	/**
	 * 좋아요 입력
	 * @param session
	 * @param like
	 * @return int
	 */
	public int insertLike(SqlSession session, Like like);
	
	/**
	 * 좋아요 취소
	 * @param session
	 * @param like
	 * @return int
	 */
	public int cancelLike(SqlSession session, Like like);
}
