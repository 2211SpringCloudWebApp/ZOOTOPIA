package com.kh.zootopia.manager.service;

import java.util.List;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptAnimalPost;
import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.manager.domain.DateDTO;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.review.domain.PageInfo;

public interface ManagerService {

	List<Member> selectMembers(PageInfo pi);

	Member selectOneById(String memberId);

	int deleteMember(String memberId);

	List<Member> searchMember(Search search, PageInfo pi);

	void deleteCheckedMembers(String memberId);

	List<AdoptPost> selectAdopt(PageInfo pi);

	void approveAdopts(int adoptPostNo);

	void deleteAdopts(int adoptPostNo);
	
	AdoptAnimalPost detailAdopt(Integer animalNo);

//	예약페이지
	List<AdoptPost> viewReservation(DateDTO dateDTO);

	int approveReserv(int reservationNo);

//	페이징처리
	int getMemberListCount();

	int getAdoptListCount();

	void deleteCheckedReviews(int reviewPostNo);

//	댓글리스트
	List<Comment> selectComments(PageInfo pi);

	int getCommentListCount();

	void deleteCheckedComments(int commentNo);

	Comment detailComment(int commentNo);

	int deleteComment(int commentNo);

	


}
