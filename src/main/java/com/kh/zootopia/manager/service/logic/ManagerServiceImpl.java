package com.kh.zootopia.manager.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.manager.domain.DateDTO;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.manager.service.ManagerService;
import com.kh.zootopia.manager.store.ManagerStore;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.reservation.domain.Reservation;
import com.kh.zootopia.review.domain.PageInfo;


@Service
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private SqlSession session;
	@Autowired
	private ManagerStore mStore;

	// **회원관리
	// 멤버리스트 Controller
	@Override
	public List<Member> selectMembers(PageInfo pi) {
		List<Member> mList = mStore.selectMembers(session, pi);
		return mList;
	}

	// 멤버리스트 페이징처리
	@Override
	public int getMemberListCount() {
		int result = mStore.getMemberListCount(session);
		return result;
	}
	
	// 멤버검색 Controller
	@Override
	public List<Member> searchMember(Search search, PageInfo pi) {
		List<Member> mList = mStore.searchMember(session, search, pi);
		return mList;
	}

	// 멤버검색 페이징처리
	@Override
	public int getSearchMemberCount(Search search) {
		int result = mStore.getSearchMemberCount(session, search);
		return result;
	}

	// 멤버디테일 Controller
	@Override
	public Member selectOneById(String memberId) {
		Member mOne = mStore.selectOneById(session, memberId);
		return mOne;
	}

	// 멤버삭제 Controller
	@Override
	public int deleteMember(String memberId) {
		int result = mStore.deleteMember(session, memberId);
		return result;
	}

	// 체크된멤버삭제 Controller
	@Override
	public void deleteCheckedMembers(String memberId) {
		mStore.deleteCheckedMembers(session, memberId);
	}

	
	// ** 입양공고관리
	// 미승인 입양공고리스트 Controller
	@Override
	public List<AdoptAnimalPost> selectAdopt(PageInfo pi) {
		List<AdoptAnimalPost> aList = mStore.selectAdopt(session, pi);
		return aList;
	}

	// 미승인 입양공고리스트 페이징처리
	@Override
	public int getAdoptListCount() {
		int result = mStore.getAdoptListCount(session);
		return result;
	}
	
	// 미승인 입양공고리스트에서 승인 Controller
	@Override
	public void approveAdopts(int adoptPostNo) {
		mStore.approveAdopts(session, adoptPostNo);
	}

	// 입양공고리스트 내 여러개 삭제 Controller
	@Override
	public void deleteAdopts(int adoptPostNo) {
		mStore.deleteAdopts(session, adoptPostNo);
	}
	
	// 미승인 입양공고디테일 Controller
	@Override
	public AdoptAnimalPost detailAdopt(Integer animalNo) {
		AdoptAnimalPost aPost = mStore.detailAdopt(session, animalNo);
		return aPost;
	}


	// ** 예약관리
	// 예약페이지 Detail Controller
	@Override
	public List<AdoptPost> viewReservation(DateDTO dateDTO) {
		List<AdoptPost> aList = mStore.viewReservation(session, dateDTO);
		return aList;
	}

	// 예약승인 Controller
	@Override
	public int approveReserv(Reservation rParam) {
		int result = mStore.approveReserv(session, rParam);
		return result;
	}
	@Override
	public Reservation selectOneByReservationNo(int reservationNo) {
		Reservation rParam = mStore.selectOneByReservationNo(session,reservationNo);
		return rParam;
	}

	// ** 리뷰관리
	// 체크된 리뷰삭제 Controller
	@Override
	public void deleteCheckedReviews(int reviewPostNo) {
		mStore.deleteCheckedReviews(session, reviewPostNo);
		
	}
	

	// **댓글관리
	// 댓글리스트 Controller
	@Override
	public List<Comment> selectComments(PageInfo pi) {
		List<Comment> cList = mStore.selectComments(session, pi);
		return cList;
	}

	// 댓글리스트 페이징처리
	@Override
	public int getCommentListCount() {
		int result = mStore.getCommentListCount(session);
		return result;
	}

	// 체크된댓글삭제 Controller
	@Override
	public void deleteCheckedComments(int commentNo) {
		mStore.deleteCheckedComments(session, commentNo);
	}

	// 댓글디테일 Controller
	@Override
	public Comment detailComment(int commentNo) {
		Comment comment = mStore.detailComment(session, commentNo);
		return comment;
	}

	// 댓글삭제 Controller
	@Override
	public int deleteComment(int commentNo) {
		int result = mStore.deleteComment(session, commentNo);
		return result;
	}


}
