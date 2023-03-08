package com.kh.zootopia.like.service;

import org.springframework.stereotype.Service;

import com.kh.zootopia.like.domain.Like;

@Service
public interface LikeService {

	public int checkLike(Like like);

}
