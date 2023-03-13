package com.kh.zootopia.notice.service;

import java.util.List;

import com.kh.zootopia.notice.domain.Notice;


public interface NoticeService {


	/**
	 * 공지사항 등록 Service
	 * @param notice
	 * @return int
	 */
	public int insertNotice(Notice notice);

	/**
	 * 공지사항 수정 Service
	 * @param notice
	 * @return int
	 */
	public int updateNotice(Notice notice);

	/**
	 * 공지사항 삭제 Service
	 * @param noticeNo
	 * @return int
	 */
	public int deleteNotice(int noticeNo);

	/**
	 * 공지사항 목록 조회 Service
	 * @return List<Notice>
	 */
	public List<Notice> selectNoticeList();

	/**
	 * 공지사항 상세 조회 Service
	 * @param noticeNo
	 * @return Notice
	 */
	public Notice selectOneByNo(int noticeNo);
	
}
