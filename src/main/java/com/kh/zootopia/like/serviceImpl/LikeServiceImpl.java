package com.kh.zootopia.like.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.like.service.LikeService;
import com.kh.zootopia.like.store.LikeStore;

public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeStore likeStore;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int checkLike(Like like) {
		
		int result = likeStore.findLike(session, like);
		
		return result;

	}

	@Override
	public int insertLike(Like like) {
		
		int result = likeStore.insertLike(session, like);
		
		return result;
	}

}
