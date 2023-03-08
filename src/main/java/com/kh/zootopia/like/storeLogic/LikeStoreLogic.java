package com.kh.zootopia.like.storeLogic;

import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.like.store.LikeStore;

public class LikeStoreLogic implements LikeStore {

	@Override
	public int checkLike(SqlSession session, Like like) {
		
		int result = Integer.parseInt(session.selectOne("Like.checkLike", like));
		
		return result;
		
	}
	
	

}
