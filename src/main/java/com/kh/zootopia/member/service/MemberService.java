package com.kh.zootopia.member.service;

import java.util.List;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.member.domain.MyComment;
import com.kh.zootopia.member.domain.MyLike;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;

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
	 * 마이페이지 후기 게시판 댓글 삭제 Service
	 * @param memberId
	 * @param reviewPostNo
	 * @return
	 */
	int deleteReviewComment(Review review);

	/**
	 * 마이페이지 입양공고 게시글 전체개수 Service
	 * @return
	 */
	int getAdoptPostCount(String memberId);

	/**
	 * 마이페이지 입양공고 게시글 목록 조회 Service
	 * @param pageInfo
	 * @param memberId
	 * @return
	 */
	List<AdoptPost> mypageSelectAdoptPostList(PageInfo pageInfo, String memberId);

	/**
	 * 마이페이지 검색한 입양공고 게시글 전체 개수 조회 Service
	 * @param search
	 * @return
	 */
	int mypageGetAdoptPostListCount(Search search);

	/**
	 * 입양한 동물들 목록 Service
	 * @param memberId
	 * @return List<Animal>
	 */
	public List<Animal> selectAnimalbyAnimalAdopterId(String memberId);

	/**
	 * 마이페이지 후기 게시판 전체 개수 Service
	 * @param memberId
	 * @return
	 */
	int getReviewCount(String memberId);

	/**
	 * 마이페이지 검색한 입양공고 전체 목록 조회 Service
	 * @param pageInfo
	 * @param search
	 * @return
	 */
	List<AdoptPost> mypageSearchAdoptPost(PageInfo pageInfo, Search search);

	/**
	 * 마이페이지 입양공고 작성한 댓글 전체 개수 Service 
	 * @param memberId
	 * @return
	 */
	int getAdoptPostCommentCount(String memberId);

	/**
	 * 마이페이지 입양공고 작성한 댓글 전체 목록
	 * @param pageInfo
	 * @param memberId
	 * @return
	 */
	List<Comment> selectAdoptPostCommentList(PageInfo pageInfo, String memberId);

	/**
	 * 마이페이지 좋아요 누른 입양공고 전체 개수 Service
	 * @param memberId
	 * @return
	 */
	int getAdoptPostLikeCount(String memberId);

	/**
	 * 마이페이지 좋아요 누른 입양공고 전체 목록 조회 Service
	 * @param pageInfo
	 * @param memberId
	 * @return
	 */
	List<AdoptPost> selectAdoptPostLikeList(PageInfo pageInfo, String memberId);

	/**
	 * 마이페이지 작성한 댓글 상세 페이지
	 * @param memberId
	 * @return
	 */
	int mypageSelectAdoptPost(int postNo);

	
	/**
	 * 마이페이지 후기 게시글 삭제
	 * @param reviewPostNo
	 * @return
	 */
	int deleteCheckedReviewList(String reviewPostNo);

	/**
	 * 마이페이지 입양공고 게시글 삭제
	 * @param adoptPostNo
	 * @return
	 */
	int deleteCheckedAdoptPost(String adoptPostNo);

	/**
	 * 마이페이지 입양공고 댓글 삭제
	 * @param postNo
	 * @return
	 */
	int deleteCheckedAdoptPostComment(MyComment myComment);


	/**
	 * 마이페이지 입양공고 좋아요 삭제
	 * @param adoptPostNo
	 * @return
	 */
	int deleteCheckedAdoptPostLike(MyLike myLike);

	/**
	 * 마이페이지 후기 댓글 삭제
	 * @param postNo
	 * @return
	 */
	int deleteCheckedReviewComment(MyComment myComment);

	/**
	 * 마이페이지 후기 좋아요 삭제
	 * @param reviewPostNo
	 * @return
	 */
	int deleteCheckedReviewLike(MyLike myLike);


	

}




