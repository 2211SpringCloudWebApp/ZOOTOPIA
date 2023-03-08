package com.kh.zootopia.member.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Member {

	private String memberId;
	private String memberPw;
	private String memberName;
	private Date memberBirthday;
	private String memberGender;
	private String memberEmail;
	private String memberPhone;
	private String memberAddr1;
	private String memberAddr2;
	private String memberAddr3;
	private String mAdminYN;
	private Timestamp mEnrollDate;
	private Timestamp mUpdateDate;
	private String mWithdrawalYN;
	private Timestamp mWithdrawalDate;
	
	public Member() {}
	
	public Member(String memberId, String memberName, Timestamp mEnrollDate) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.mEnrollDate = mEnrollDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Date getMemberBirthday() {
		return memberBirthday;
	}

	public void setMemberBirthday(Date memberBirthday) {
		this.memberBirthday = memberBirthday;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddr1() {
		return memberAddr1;
	}

	public void setMemberAddr1(String memberAddr1) {
		this.memberAddr1 = memberAddr1;
	}

	public String getMemberAddr2() {
		return memberAddr2;
	}

	public void setMemberAddr2(String memberAddr2) {
		this.memberAddr2 = memberAddr2;
	}

	public String getMemberAddr3() {
		return memberAddr3;
	}

	public void setMemberAddr3(String memberAddr3) {
		this.memberAddr3 = memberAddr3;
	}

	public String getmAdminYN() {
		return mAdminYN;
	}

	public void setmAdminYN(String mAdminYN) {
		this.mAdminYN = mAdminYN;
	}

	public Timestamp getmEnrollDate() {
		return mEnrollDate;
	}

	public void setmEnrollDate(Timestamp mEnrollDate) {
		this.mEnrollDate = mEnrollDate;
	}

	public Timestamp getmUpdateDate() {
		return mUpdateDate;
	}

	public void setmUpdateDate(Timestamp mUpdateDate) {
		this.mUpdateDate = mUpdateDate;
	}

	public String getmWithdrawalYN() {
		return mWithdrawalYN;
	}

	public void setmWithdrawalYN(String mWithdrawalYN) {
		this.mWithdrawalYN = mWithdrawalYN;
	}

	public Timestamp getmWithdrawalDate() {
		return mWithdrawalDate;
	}

	public void setmWithdrawalDate(Timestamp mWithdrawalDate) {
		this.mWithdrawalDate = mWithdrawalDate;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberBirthday=" + memberBirthday + ", memberGender=" + memberGender + ", memberEmail="
				+ memberEmail + ", memberPhone=" + memberPhone + ", memberAddr1=" + memberAddr1 + ", memberAddr2="
				+ memberAddr2 + ", memberAddr3=" + memberAddr3 + ", mAdminYN=" + mAdminYN + ", mEnrollDate="
				+ mEnrollDate + ", mUpdateDate=" + mUpdateDate + ", mWithdrawalYN=" + mWithdrawalYN
				+ ", mWithdrawalDate=" + mWithdrawalDate + "]";
	}
	
	
}
