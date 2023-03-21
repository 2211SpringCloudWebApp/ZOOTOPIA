package com.kh.zootopia.manager.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.manager.domain.DateDTO;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.manager.service.ManagerService;
import com.kh.zootopia.manager.store.ManagerStore;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.review.domain.PageInfo;


@Service
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private ManagerStore mStore;

	@Override
	public List<Member> selectMembers(PageInfo pi) {
		List<Member> mList = mStore.selectMembers(session, pi);
		return mList;
	}

	@Override
	public Member selectOneById(String memberId) {
		Member mOne = mStore.selectOneById(session, memberId);
		return mOne;
	}

	@Override
	public int deleteMember(String memberId) {
		int result = mStore.deleteMember(session, memberId);
		return result;
	}

	@Override
	public List<Member> searchMember(Search search, PageInfo pi) {
		List<Member> mList = mStore.searchMember(session, search, pi);
		return mList;
	}

	@Override
	public void deleteCheckedMembers(String memberId) {
		mStore.deleteCheckedMembers(session, memberId);
	}

	@Override
	public List<AdoptPost> selectAdopt(PageInfo pi) {
		List<AdoptPost> aList = mStore.selectAdopt(session, pi);
		return aList;
	}

	@Override
	public void approveAdopts(int adoptPostNo) {
		mStore.approveAdopts(session, adoptPostNo);
	}

	@Override
	public void deleteAdopts(int adoptPostNo) {
		mStore.deleteAdopts(session, adoptPostNo);
	}

	//예약페이지
	@Override
	public List<AdoptPost> viewReservation(DateDTO dateDTO) {
		List<AdoptPost> aList = mStore.viewReservation(session, dateDTO);
		return aList;
	}

	@Override
	public int approveReserv(int reservationNo) {
		int result = mStore.approveReserv(session, reservationNo);
		return result;
	}

	// 페이징처리
	@Override
	public int getMemberListCount() {
		int result = mStore.getMemberListCount(session);
		return result;
	}

	@Override
	public int getAdoptListCount() {
		int result = mStore.getAdoptListCount(session);
		return result;
	}

	@Override
	public void deleteCheckedReviews(int reviewPostNo) {
		mStore.deleteCheckedReviews(session, reviewPostNo);
		
	}

//	댓글리스트
	@Override
	public List<Comment> selectComments(PageInfo pi) {
		List<Comment> cList = mStore.selectComments(session, pi);
		return cList;
	}

	@Override
	public int getCommentListCount() {
		int result = mStore.getCommentListCount(session);
		return result;
	}

	@Override
	public void deleteCheckedComments(int commentNo) {
		mStore.deleteCheckedComments(session, commentNo);
	}

	@Override
	public Comment detailComment(int commentNo) {
		Comment comment = mStore.detailComment(session, commentNo);
		return comment;
	}

	@Override
	public int deleteComment(int commentNo) {
		int result = mStore.deleteComment(session, commentNo);
		return result;
	}

}
