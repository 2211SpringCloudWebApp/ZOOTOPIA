package com.kh.zootopia.like.store;

import org.springframework.stereotype.Repository;

import com.kh.zootopia.like.domain.Like;

@Repository
public interface LikeStore {

	/**
	 * 좋아요 확인
	 * @param 
	 */
	public int checkLike(SqlSession session, Like like);

}
