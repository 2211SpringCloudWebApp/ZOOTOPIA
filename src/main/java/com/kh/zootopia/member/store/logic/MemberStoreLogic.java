package com.kh.zootopia.member.store.logic;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.member.store.MemberStore;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;
import com.kh.zootopia.review.domain.Search;

@Repository
public class MemberStoreLogic implements MemberStore{

	// 멤버 등록
	@Override
	public int intsertMember(SqlSession session, Member member) {
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}

	// 멤버 수정
	@Override
	public int updateMember(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateMember", member);
		return result;
	}

	// 멤버 삭제 
	@Override
	public int deleteMember(SqlSession session, String memberId) {
		int result = session.delete("MemberMapper.deleteMember", memberId);
		return result;
	}

	// 멤버 로그인 
	@Override
	public Member checkMemberLogin(SqlSession session, Member mParam) {
		Member member = session.selectOne("MemberMapper.checkMemberLogin", mParam);
		return member;
	}

	// 멤버 아이디 찾기
	@Override
	public Member findId(SqlSession session, Member mParam) {
		Member member = session.selectOne("MemberMapper.findId" , mParam);
		return member;
	}

	// 멤버 비밀번호 찾기
	@Override
	public Member findPw(SqlSession session, Member mParam) {
		Member member = session.selectOne("MemberMapper.findPw" , mParam);
		return member;
	}
	
	// 여기 부터 마이페이지 관련 -------------------------------------------------------------------
	
	// 마이페이지 좋아요 누른 후기 게시글 전체 개수
	@Override
	public int getReviewLikeCount(SqlSession session, String memberId) {
		int result = session.selectOne("LikeMapper.getReviewLikeCount", memberId);
		return result;
	}

	
	
	
	// 마이페이지 좋아요 누른 후기 게시글 전체 조회
	@Override
	public List<Review> selectReviewLikeList(SqlSession session, PageInfo pageInfo ,String memberId) {
		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> reviewLikeList = session.selectList("ReviewMapper.selectReviewLikeList", memberId ,rowBounds );
		return reviewLikeList;
	}

	// 마이페이지 후기 게시판 댓글 전체 개수
	@Override
	public int getReviewCommentCount(SqlSession session, String memberId) {
		int result = session.selectOne("CommentMapper.getReviewCommentCount", memberId);
		return result;
	}

	// 마이페이지 후기 게시판 작성한 댓글 목록 조회
	@Override
	public List<Comment> selectReviewCommentList(SqlSession session, PageInfo pageInfo, String memberId) {
		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Comment> commentList = session.selectList("CommentMapper.selectReviewCommentList", memberId ,rowBounds);
		return commentList;
	}
	
	
	// 마이페이지 후기 게시판 댓글 삭제
	@Override
	public int deleteReviewComment(SqlSession session, Review review) {
		int result = session.delete("CommentMapper.deleteReviewComment", review);
		return result;
	}

	// 마이페이지 입양공고 전체 개수
	@Override
	public int getAdoptPostCount(SqlSession session, String memberId) {
		int result = session.selectOne("AdoptPostMapper.getAdoptPostCount", memberId);
		return result;
	}
	
	// 마이페이지 입양공고 전체 목록 조회
	@Override
	public List<AdoptPost> mypageSelectAdoptPostList(SqlSession session, PageInfo pageInfo, String memberId) {
		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AdoptPost> adoptPostList = session.selectList("AdoptPostMapper.mypageSelectAdoptPostList", memberId , rowBounds);
		return adoptPostList;
	}

	// 마이페이지 검색한 입양공고 전체 개수 조회
	@Override
	public int mypageGetAdoptPostListCount(SqlSession session, Search search) {
		int result = session.selectOne("AdoptPostMapper.mypageGetAdoptPostListCount", search);
		return result;
	}

	@Override
	public List<Animal> selectAnimalbyAnimalAdopterId(SqlSession session, String memberId) {
		System.out.println(memberId);
		List<Animal> animalList = session.selectList("AnimalMapper.selectAllAnimalsbyAnimalAdopterId", memberId);
		return animalList;
	}
	
	// 마이페이지 후기 게시판 전채 개수
	@Override
	public int getReviewCount(SqlSession session, String memberId) {
		int result = session.selectOne("ReviewMapper.getReviewCount", memberId);
		return result;
	}
	
	// 마이페이지 
	@Override
	public List<AdoptPost> mypageSearchAdoptPost(SqlSession session, PageInfo pageInfo, Search search) {
		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AdoptPost> adoptPostList = session.selectList("AdoptPostMapper.mypageSearchAdoptPost", search , rowBounds);
		return adoptPostList;
	}
	
	// 마이페이지 입양공고 게시판 전체 댓글 개수 조회
	@Override
	public int getAdoptPostCommentCount(SqlSession session, String memberId) {
		int result = session.selectOne("CommentMapper.getAdoptPostCommentCount", memberId);
		return result;
	}
	
	// 마이페이지 입양공고 게시판 댓글 작성한 전체 목록 조회
	@Override
	public List<Comment> selectAdoptPostCommentList(SqlSession session, PageInfo pageInfo, String memberId) {
		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Comment> adoptPostCommentList = session.selectList("CommentMapper.selectAdoptPostCommentList", memberId , rowBounds);
		return adoptPostCommentList;
	}

	// 마이페이지 좋아요 누른 입양공고 전체 개수 조회
	@Override
	public int getAdoptPostLikeCount(SqlSession session, String memberId) {
		int result = session.selectOne("LikeMapper.getAdoptPostLikeCount", memberId);
		return result;
	}
	
	// 마이페이지 좋아요 누른 입양공고 전체 목록 조회
	@Override
	public List<AdoptPost> selectAdoptPostLikeList(SqlSession session, PageInfo pageInfo, String memberId) {
		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<AdoptPost> adoptPostLikeList = session.selectList("AdoptPostMapper.selectAdoptPostLikeList", memberId, rowBounds);
		return adoptPostLikeList;
	}
	
	// 마이페이지 작성한 댓글 상세페이지
	@Override
	public int mypageSelectAdoptPost(SqlSession session, int postNo) {
		int animalNo = session.selectOne("AdoptPostMapper.mypageSelectAdoptPost", postNo);
		return animalNo;
	}
	
	// 마이페이지 후기 게시글 삭제
	@Override
	public int deleteCheckedReviewList(SqlSession session, String reviewPostNo) {
		int result = session.delete("ReviewMapper.deleteReview",reviewPostNo);
		return result;
	}

	// 마이페이지 입양공고 게시글 삭제
	@Override
	public int deleteCheckedAdoptPost(SqlSession session, String adoptPostNo) {
		int result = session.delete("AdoptPostMapper.deleteAdoptPostList", adoptPostNo);
		return result;
	}
	
}
