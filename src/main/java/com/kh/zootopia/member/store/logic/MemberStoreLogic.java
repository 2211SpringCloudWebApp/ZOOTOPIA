package com.kh.zootopia.member.store.logic;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.member.store.MemberStore;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;

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

	// 후기 게시판 좋아요 전체 목록 조회
	@Override
	public List<Like> getReviewLikeList(SqlSession session) {
		List<Like> likeList = session.selectList("LikeMapper.getReviewLikeList");
		return likeList;
	}
	
	
	// 마이페이지 좋아요 누른 후기 게시글 전체 조회
	@Override
	public List<Review> mypageSelectReviewLikeList(SqlSession session, PageInfo pageInfo, int postNo) {
		int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> reviewLikeList = session.selectList("ReviewMapper.mypageSelectReviewLikeList", postNo ,rowBounds);
		return reviewLikeList;
	}

	@Override
	public List<Animal> selectAnimalbyAnimalAdopterId(SqlSession session, String memberId) {
		
		System.out.println(memberId);
		List<Animal> animalList = session.selectList("AnimalMapper.selectAllAnimalsbyAnimalAdopterId", memberId);
		
		return animalList;
	}

	
}
