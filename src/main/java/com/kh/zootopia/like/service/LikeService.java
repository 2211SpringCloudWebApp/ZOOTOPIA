package com.kh.zootopia.like.service;

import com.kh.zootopia.like.domain.Like;

public interface LikeService {

	/**
	 * 좋아요 확인
	 * @param like
	 * @return int
	 */
	public int checkLike(Like like);

	/**
	 * 좋아요 입력
	 * @param like
	 * @return int
	 */
	public int insertLike(Like like);

	/**
	 * 좋아요 취소
	 * @param like
	 * @return int
	 */
	public int cancelLike(Like like);
	
	/**
	 * 좋아요수
	 * @param like
	 * @return int
	 */
	public int getLikeCount(Like like);

	/**
	 * 유정 좋아요
	 * @param like
	 * @return
	 */
	public int like(Like like);

}
