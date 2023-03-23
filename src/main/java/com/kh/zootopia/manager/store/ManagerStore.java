package com.kh.zootopia.manager.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.manager.domain.DateDTO;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.reservation.domain.Reservation;
import com.kh.zootopia.review.domain.PageInfo;

public interface ManagerStore {

	// **회원관리
	// 멤버리스트 Controller
	List<Member> selectMembers(SqlSession session, PageInfo pi);
	
	// 멤버리스트 페이징처리
	int getMemberListCount(SqlSession session);

	// 멤버검색 Controller
	List<Member> searchMember(SqlSession session, Search search, PageInfo pi);

	// 멤버검색 페이징처리
	int getSearchMemberCount(SqlSession session, Search search);
	
	// 멤버디테일 Controller
	Member selectOneById(SqlSession session, String memberId);

	// 멤버삭제 Controller
	int deleteMember(SqlSession session, String memberId);

	// 체크된멤버삭제 Controller
	void deleteCheckedMembers(SqlSession session, String memberId);

	
	// ** 입양공고관리
	// 미승인 입양공고리스트 Controller
	List<AdoptAnimalPost> selectAdopt(SqlSession session, PageInfo pi);

	// 미승인 입양공고리스트 페이징처리
	int getAdoptListCount(SqlSession session);
	
	// 미승인 입양공고리스트에서 승인 Controller
	void approveAdopts(SqlSession session, int adoptPostNo);

	// 입양공고리스트 내 여러개 삭제 Controller
	void deleteAdopts(SqlSession session, int adoptPostNo);

	// 미승인 입양공고디테일 Controller
	AdoptAnimalPost detailAdopt(SqlSession session, Integer animalNo);


	// ** 예약관리
	// 예약페이지 Detail Controller
	List<AdoptPost> viewReservation(SqlSession session, DateDTO dateDTO);

	// 예약승인 Controller
	int approveReserv(SqlSession session, Reservation rParam);
	Reservation selectOneByReservationNo(SqlSession session, int reservationNo);


	// ** 리뷰관리
	// 체크된 리뷰삭제 Controller
	void deleteCheckedReviews(SqlSession session, int reviewPostNo);

 
	// **댓글관리
	// 댓글리스트 Controller
	List<Comment> selectComments(SqlSession session, PageInfo pi);

	// 댓글리스트 페이징처리
	int getCommentListCount(SqlSession session);

	// 체크된댓글삭제 Controller
	void deleteCheckedComments(SqlSession session, int commentNo);

	// 댓글디테일 Controller
	Comment detailComment(SqlSession session, int commentNo);

	// 댓글삭제 Controller
	int deleteComment(SqlSession session, int commentNo);


}
