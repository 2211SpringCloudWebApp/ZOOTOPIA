package com.kh.zootopia.member.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zootopia.AdoptAnimalPost.domain.Animal;
import com.kh.zootopia.like.domain.Like;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.member.service.MemberService;
import com.kh.zootopia.member.store.MemberStore;
import com.kh.zootopia.review.domain.PageInfo;
import com.kh.zootopia.review.domain.Review;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	SqlSession session;
	@Autowired
	MemberStore mStore;

	
	// 등록
	@Override
	public int insertMember(Member member) {
		int result=mStore.intsertMember(session, member);
		return result;
	}


	// 수정
	@Override
	public int updateMember(Member member) {
		int result = mStore.updateMember(session, member);
		return result;
	}


	// 삭제
	@Override
	public int deleteMember(String memberId) {
		int result = mStore.deleteMember(session, memberId);
		return result;
	}


	// 로그인
	@Override
	public Member checkMemberLogin(Member mParam) {
		Member member = mStore.checkMemberLogin(session, mParam);
		return member;
	}


	// 아이디 찾기
	@Override
	public Member findId(Member mParam) {
		Member member = mStore.findId(session, mParam);
		return member;
	}

	// 비밀번호 찾기
	@Override
	public Member findPw(Member mParam) {
		Member member = mStore.findPw(session, mParam);
		return member;
	}


//-----------------------------------------------------------------------------------------------------------------------------------------
	// -- 여기 아래부터 마이페이지 관련
	
	
	
	
	// 마이페이지 좋아요 누른 게시글 개수
	@Override
	public int getReviewLikeCount(String memberId) {
		int result = mStore.getReviewLikeCount(session, memberId);
		return result;
	}

	// 마이페이지 좋아요 누른 후기 게시글 개수
	@Override
	public List<Review> mypageSelectReviewLikeList(PageInfo pageInfo, int postNo) {
		List<Review> reviewLikeList = mStore.mypageSelectReviewLikeList(session, pageInfo ,postNo);
		return reviewLikeList;
	}

	// 후기 게시판 좋아요 전체 목록 조회
	@Override
	public List<Like> getReviewLikeList() {
		List<Like> likeList = mStore.getReviewLikeList(session);
		return likeList;
	}

	/* ================== 수정부분 ================== */
	@Override
	public List<Animal> selectAnimalbyAnimalAdopterId(String memberId) {
		
		List<Animal> animalList = mStore.selectAnimalbyAnimalAdopterId(session, memberId);
		
		return animalList;
	}
	/* ============================================== */

}
