package com.kh.zootopia.manager.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.AdoptAnimalPost.domain.AdoptPost;
import com.kh.zootopia.comment.domain.Comment;
import com.kh.zootopia.manager.domain.DateDTO;
import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.member.domain.Member;
import com.kh.zootopia.review.domain.PageInfo;

public interface ManagerStore {

	List<Member> selectMembers(SqlSession session, PageInfo pi);

	Member selectOneById(SqlSession session, String memberId);

	int deleteMember(SqlSession session, String memberId);

	List<Member> searchMember(SqlSession session, Search search, PageInfo pi);

	void deleteCheckedMembers(SqlSession session, String memberId);

	List<AdoptPost> selectAdopt(SqlSession session, PageInfo pi);

	void approveAdopts(SqlSession session, int adoptPostNo);

	void deleteAdopts(SqlSession session, int adoptPostNo);

	//예약페이지
	List<AdoptPost> viewReservation(SqlSession session, DateDTO dateDTO);

	int approveReserv(SqlSession session, int reservationNo);

	int getMemberListCount(SqlSession session);

	int getAdoptListCount(SqlSession session);

	void deleteCheckedReviews(SqlSession session, int reviewPostNo);

	// 댓글리스트
	List<Comment> selectComments(SqlSession session, PageInfo pi);

	int getCommentListCount(SqlSession session);

	void deleteCheckedComments(SqlSession session, int commentNo);

	Comment detailComment(SqlSession session, int commentNo);

	int deleteComment(SqlSession session, int commentNo);


}
