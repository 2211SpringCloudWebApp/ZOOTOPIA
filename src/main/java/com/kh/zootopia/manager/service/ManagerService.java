package com.kh.zootopia.manager.service;

import java.util.List;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.manager.domain.DateDTO;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.reservation.domain.Reservation;
import com.kh.zootopia.review.domain.PageInfo;

public interface ManagerService {
	
	// **회원관리
	// 멤버리스트 Controller
	List<Member> selectMembers(PageInfo pi);

	// 멤버리스트 페이징처리
	int getMemberListCount();

	// 멤버검색 Controller
	List<Member> searchMember(Search search, PageInfo pi);

	// 멤버검색 페이징처리
	int getSearchMemberCount(Search search);

	// 멤버디테일 Controller
	Member selectOneById(String memberId);

	// 멤버삭제 Controller
	int deleteMember(String memberId);

	// 체크된멤버삭제 Controller
	void deleteCheckedMembers(String memberId);

	
	// ** 입양공고관리
	// 미승인 입양공고리스트 Controller
	List<AdoptAnimalPost> selectAdopt(PageInfo pi);

	// 미승인 입양공고리스트 페이징처리
	int getAdoptListCount();

	// 미승인 입양공고리스트에서 승인 Controller
	void approveAdopts(int adoptPostNo);

	// 입양공고리스트 내 여러개 삭제 Controller
	void deleteAdopts(int adoptPostNo);
	
	// 미승인 입양공고디테일 Controller
	AdoptAnimalPost detailAdopt(Integer animalNo);


	// ** 예약관리
	// 예약페이지 Detail Controller
	List<AdoptPost> viewReservation(DateDTO dateDTO);

	// 예약승인 Controller
	int approveReserv(Reservation rParam);
	Reservation selectOneByReservationNo(int reservationNo);


	// ** 리뷰관리
	// 체크된 리뷰삭제 Controller
	void deleteCheckedReviews(int reviewPostNo);


	// **댓글관리
	// 댓글리스트 Controller
	List<Comment> selectComments(PageInfo pi);

	// 댓글리스트 페이징처리
	int getCommentListCount();

	// 체크된댓글삭제 Controller
	void deleteCheckedComments(int commentNo);

	// 댓글디테일 Controller
	Comment detailComment(int commentNo);

	// 댓글삭제 Controller
	int deleteComment(int commentNo);


}
