package com.kh.zootopia.member.store;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;

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
	 * 마이페이 좋아요 누른 후기 게시글 전체 조회 Store
	 * @param session
	 * @param pageInfo
	 * @return
	 */
	List<Review> selectReviewLikeList(SqlSession session, PageInfo pageInfo ,String memberId);



	/**
	 * 후기 게시판 댓글 전체 개수 Store
	 * @param session
	 * @param memberId
	 * @return
	 */
	int getReviewCommentCount(SqlSession session, String memberId);

	/**
	 * 후기 게시판 댓글 목록 전체 개수 Store
	 * @param session
	 * @param memberId
	 * @return
	 */
	List<Comment> selectReviewCommentList(SqlSession session, PageInfo pageInfo, String memberId);


	/**
	 * 후기 게시판 댓글 삭제 Store
	 * @param session
	 * @param review
	 * @return
	 */
	int deleteReviewComment(SqlSession session, Review review);


	/**
	 * 마이페이지 입양공고 게시글 전체 개수 Store
	 * @param session
	 * @return
	 */
	int getAdoptPostCount(SqlSession session, String memberId);

	/**
	 * 마이페이지 입양공고 게시글 전체 목록 조회 Store
	 * @param session
	 * @param pageInfo
	 * @param memberId
	 * @return
	 */
	List<AdoptPost> mypageSelectAdoptPostList(SqlSession session, PageInfo pageInfo, String memberId);

	/**
	 * 마이페이지 검색한 입양공고 게시글 전체 개수 Store
	 * @param session
	 * @param search
	 * @return
	 */
	int mypageGetAdoptPostListCount(SqlSession session, Search search);

	/* ================== 수정부분 ================== */
	/**
	 * 입양한 동물들 목록 Store
	 * @param session
	 * @param memberId
	 * @return List<Animal>
	 */
	public List<Animal> selectAnimalbyAnimalAdopterId(SqlSession session, String memberId);
	/* ============================================== */

	/**
	 * 마이페이지 후기 게시판 전체 개수 Store
	 * @param session
	 * @param memberId
	 * @return
	 */
	int getReviewCount(SqlSession session, String memberId);

	/**
	 * 마이페이지 검색한 입양공고 게시글 전체 목록 조회 Store
	 * @param session
	 * @param pageInfo
	 * @param search
	 * @return
	 */
	List<AdoptPost> mypageSearchAdoptPost(SqlSession session, PageInfo pageInfo, Search search);

	/**
	 * 마이페이지 입양공고 게시판 댓글 전체 개수 Store
	 * @param session
	 * @param memberId
	 * @return
	 */
	int getAdoptPostCommentCount(SqlSession session, String memberId);

	/**
	 * 마이페이지 입양공고 게시판 댓글 전체 목록 조회 Store
	 * @param session
	 * @param pageInfo
	 * @param memberId
	 * @return
	 */
	List<Comment> selectAdoptPostCommentList(SqlSession session, PageInfo pageInfo, String memberId);

	/**
	 * 마이페이지 좋아요 누른 입양공고 게시글 전체 개수 Store
	 * @param session
	 * @param memberId
	 * @return
	 */
	int getAdoptPostLikeCount(SqlSession session, String memberId);

	/**
	 * 마이페이지 좋아요 누른 입양공고 게시글 전체 목록 조회 Store
	 * @param session
	 * @param pageInfo
	 * @param memberId
	 * @return
	 */
	List<AdoptPost> selectAdoptPostLikeList(SqlSession session, PageInfo pageInfo, String memberId);

	/**
	 * 마이페이지 작성한 댓글 상세페이지
	 * @param session
	 * @param memberId
	 * @return
	 */
	int mypageSelectAdoptPost(SqlSession session, int postNo);

	
	/**
	 * 마이페이지 후기 게시글 삭제
	 * @param session
	 * @param reviewPostNo
	 * @return
	 */
	int deleteCheckedReviewList(SqlSession session, String reviewPostNo);

	/**
	 * 마이페이지 입양공고 게시글 삭제
	 * @param session
	 * @param adoptPostNo
	 * @return
	 */
	int deleteCheckedAdoptPost(SqlSession session, String adoptPostNo);

}
