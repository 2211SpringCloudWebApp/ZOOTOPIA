package com.kh.zootopia.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.zootopia.notice.domain.Notice;


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
	 * 공지사항 삭제 Store
	 * @param session
	 * @param noticeNo
	 * @return int
	 */
	public int deleteNotice(SqlSession session, int noticeNo);

	/**
	 * 공지사항 목록 조회 Store
	 * @param session
	 * @return List<Notice>
	 */
	public List<Notice> selectNoticeList(SqlSession session);

	/**
	 * 공지사항 상세 조회 Store
	 * @param session
	 * @param noticeNo
	 * @return Notice
	 */
	public Notice selectOneByNo(SqlSession session, int noticeNo);
	
}
