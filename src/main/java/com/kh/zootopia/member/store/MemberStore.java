package com.kh.zootopia.member.store;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;

public interface MemberStore {

	
	/** 
	 * 멤버 등록 Store
	 * @param session
	 * @param member
	 * @return
	 */
	int intsertMember(SqlSession session, Member member);

	
	/**
	 * 멤버 수정 Store
	 * @param session
	 * @param member
	 * @return
	 */
	int updateMember(SqlSession session, Member member);


	/**
	 * 멤버 삭제 Store
	 * @param session
	 * @param memberId
	 * @return
	 */
	int deleteMember(SqlSession session, String memberId);


	/**
	 * 멤버 로그인 Store
	 * @param session
	 * @param mParam
	 * @return
	 */
	Member checkMemberLogin(SqlSession session, Member mParam);


	/**
	 * 멤버 아이디 찾기 Store
	 * @param session
	 * @param mParam
	 * @return
	 */
	Member findId(SqlSession session, Member mParam);


	/**
	 * 멤버 비밀번호 찾기 Store
	 * @param session
	 * @param mParam
	 * @return
	 */
	Member findPw(SqlSession session, Member mParam);
	
	/**
	 * 
	 *  ------------------------------- 여기 부터 마이페이지 관련임----------------------------------------------------
	 * 
	 */
	
	/**
	 * 마이페이지 좋아요 누른 게시글 전체 개수 Store
	 * @param session
	 * @param memberId
	 * @return
	 */
	int getReviewLikeCount(SqlSession session, String memberId);


	/**
	 * 마이페이 좋아요 누른 후기 게시글 전체 조회
	 * @param session
	 * @param pageInfo
	 * @return
	 */
	List<Review> mypageSelectReviewLikeList(SqlSession session, PageInfo pageInfo, int postNo);

	/**
	 * 후기 게시판 좋아요 전체 목록 조회
	 * @param session
	 * @return
	 */
	List<Like> getReviewLikeList(SqlSession session);

	/* ================== 수정부분 ================== */
	/**
	 * 입양한 동물들 목록 Store
	 * @param session
	 * @param memberId
	 * @return List<Animal>
	 */
	public List<Animal> selectAnimalbyAnimalAdopterId(SqlSession session, String memberId);
	/* ============================================== */


}
