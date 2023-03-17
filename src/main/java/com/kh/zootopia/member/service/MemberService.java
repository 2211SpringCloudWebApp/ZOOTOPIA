package com.kh.zootopia.member.service;

import java.util.List;

import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;

public interface MemberService {

	
	/**
	 * 멤버 등록 Service
	 * @param member
	 * @return
	 */
	int insertMember(Member member);

	
	/**
	 * 멤버 수정 Service
	 * @param member
	 * @return
	 */
	int updateMember(Member member);


	/**
	 * 멤버 삭제 Service
	 * @param memberId
	 * @return
	 */
	int deleteMember(String memberId);

	/**
	 * 멤버 로그인 Service
	 * @param mParam
	 * @return
	 */
	Member checkMemberLogin(Member mParam);


	/**
	 * 멤버 아이디 찾기 Service
	 * @param mParam
	 * @return
	 */
	Member findId(Member mParam);

	/**
	 * 멤버 비밀번호 찾기 Service
	 * @param mParam
	 * @return
	 */
	Member findPw(Member mParam);


	
	

	/**
	 * 
	 *  ------------------------------- 여기 부터 마이페이지 관련임----------------------------------------------------
	 * 
	 */
	
	
	
	
	
	
	/**
	 * 마이페이지 좋아요 누른 게시글 전체 개수 Service
	 * @param memberId
	 * @return
	 */
	int getReviewLikeCount(String memberId);


	/**
	 * 마이페이지 좋아요 누른 후기 게시글 전체 조회 Service
	 * @param pageInfo
	 * @return
	 */
	List<Review> selectReviewLikeList(PageInfo pageInfo, String memberId);


	


	/**
	 * 마이페이지 후기 게시판 댓글 개수
	 * @return
	 */
	int getReviewCommentCount(String memberId);

	
	/**
	 * 마이페이지 후기 게시판 댓글 목록 조회 Service
	 * @param memberId
	 * @return
	 */
	List<Comment> selectReviewCommentList(PageInfo pageInfo, String memberId);
	

	/**
	 * 마이페이지 후기 게시판 댓글 삭제
	 * @param memberId
	 * @param reviewPostNo
	 * @return
	 */
	int deleteReviewComment(Review review);

}


/**
 * 입양한 동물들 목록 Service
 * @param memberId
 * @return List<Animal>
 */
//public List<Animal> selectAnimalbyAnimalAdopterId(String memberId);


