package com.kh.zootopia.like.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.like.store.LikeStore;

@Repository
public class LikeStoreLogic implements LikeStore {

	@Override
	public int checkLike(SqlSession session, Like like) {
		
		int result = session.selectOne("LikeMapper.checkLike", like); // select count(*)를 이용해 결과 도출 후 정수형으로 바꿔서 int result에 저장 
		
		return result;
		
	}

	@Override
	public int insertLike(SqlSession session, Like like) {
		
		int result = session.insert("LikeMapper.insertLike", like); 
		
		return result;
		
	}

	@Override
	public int cancelLike(SqlSession session, Like like) {
		
		int result = session.delete("LikeMapper.cancelLike", like);
		
		return result;
	}
	
	@Override
	public int getLikeCount(SqlSession session, Like like) {
		
		int result = session.selectOne("LikeMapper.likeCount", like);
		
		return result;
	}

	/**
	 * 유정 좋아요
	 */
	@Override
	public int like(SqlSession session, Like like) {
		
		// 해당 회원이 해당 게시판, 게시글에 좋아요를 누른 상태인지 확인하기
		int checkLike = session.selectOne("LikeMapper.checkLikeYJ", like);
		if (checkLike == 0) {
			// 좋아요를 안 누른 상태라면 버튼을 눌렀을 때 좋아요
			session.insert("LikeMapper.insertLikeYJ", like);
		} else {
			// 좋아요를 이미 누른 상태라면 버튼을 눌렀을 때 좋아요 취소
			session.delete("LikeMapper.deleteLikeYJ", like);
		}
		
		// 작업 수행 후 좋아요 총 좋아요 개수
		int likeCount = session.selectOne("LikeMapper.likeCount", like);
		return likeCount;
	}
	
}
