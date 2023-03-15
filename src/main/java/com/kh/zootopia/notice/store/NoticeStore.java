package com.kh.zootopia.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.manager.domain.Search;
import com.kh.zootopia.notice.domain.Notice;
import com.kh.zootopia.review.domain.PageInfo;


public interface NoticeStore {


	/**
	 * 공지사항 등록 Store
	 * @param session
	 * @param notice
	 * @return int
	 */
	public int insertNotice(SqlSession session, Notice notice);

	/**
	 * 공지사항 수정 Store
	 * @param session
	 * @param notice
	 * @return int
	 */
	public int updateNotice(SqlSession session, Notice notice);

	/**
	 * 조회수 증가 Store
	 * @param session
	 * @param noticeNo
	 * @return int
	 */
	public int updateNoticeView(SqlSession session, int noticeNo);

	/**
	 * 공지사항 삭제 Store
	 * @param session
	 * @param noticeNo
	 * @return int
	 */
	public int deleteNotice(SqlSession session, int noticeNo);

	/**
	 * 공지사항 목록 조회 Store
	 * @param session
	 * @param pi 
	 * @return List<Notice>
	 */
	public List<Notice> selectNoticeList(SqlSession session, PageInfo pi);

	/**
	 * 공지사항 상세 조회 Store
	 * @param session
	 * @param noticeNo
	 * @return Notice
	 */
	public Notice selectOneByNo(SqlSession session, int noticeNo);

	/**
	 * 공지사항 검색 Service
	 * @param session
	 * @param pi
	 * @param search
	 * @return List<Notice>
	 */
	public List<Notice> selectListByKeyword(SqlSession session, PageInfo pi, Search search);

	/**
	 * 공지사항 게시물 전체 개수 Store
	 * @param session
	 * @return int
	 */
	public int getListCount(SqlSession session);

	/**
	 * 공지사항 검색 게시물 전체 개수 Store
	 * @param session
	 * @param search
	 * @return int
	 */
	public int getListCount(SqlSession session, Search search);
	
}
