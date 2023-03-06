package com.onlineLearning.model;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "member")
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MemberId")
	private Integer memberId;

	@Column(name = "MemberAccount", columnDefinition = "nvarchar(100)")
	private String memberAccount;

	@Column(name = "MemberPassword", columnDefinition = "nvarchar(500)")
	private String memberPassword;

	@Column(name = "MemberName", columnDefinition = "nvarchar(50)")
	private String memberName;

	@Column(name = "MemberEmail", columnDefinition = "nvarchar(100)")
	private String memberEmail;

	@Column(name = "MemberPhoto", columnDefinition = "nvarchar(MAX)")
	private String memberPhoto;

	@Column(name = "MemberAddress", columnDefinition = "nvarchar(100)")
	private String memberAddress;

	@Column(name = "MemberLoginTime", columnDefinition = "nvarchar(50)")
	private String memberLoginTime;

	@Column(name = "MemberTelephone", columnDefinition = "nvarchar(50)")
	private String memberTelephone;

	@Column(name = "MemberGender", columnDefinition = "nvarchar(20)")
	private String memberGender;

	@Column(name = "MemberAge", columnDefinition = "nvarchar(10)")
	private String memberAge;

	@Column(name = "IdentityNumber", columnDefinition = "nvarchar(20)")
	private String identityNumber;

	@Column(name = "MemberEducated", columnDefinition = "nvarchar(20)")
	private String memberEducated;

	@Column(name = "MemberLastPassword", columnDefinition = "nvarchar(500)")
	private String memberLastPassword;

	@Column(name = "NickName", columnDefinition = "nvarchar(50)")
	private String nickName;

	@Column(name = "VerifyCode", columnDefinition = "int")
	private Integer verifyCode;

	@Column(name = "MemberStatus", columnDefinition = "nvarchar(10)")
	private String memberStatus;

	@Column(name = "MailVerifyStatus", columnDefinition = "nvarchar(10)")
	private String mailVerifyStatus;

	@Column(name = "MemberSkill1", columnDefinition = "nvarchar(20)")
	private String memberSkill1;

	@Column(name = "MemberSkill2", columnDefinition = "nvarchar(20)")
	private String memberSkill2;

	@Column(name = "MemberSkill3", columnDefinition = "nvarchar(20)")
	private String memberSkill3;

	@Column(name = "MemberFavorite1", columnDefinition = "nvarchar(20)")
	private String memberFavorite1;

	@Column(name = "MemberFavorite2", columnDefinition = "nvarchar(20)")
	private String memberFavorite2;

	@Column(name = "MemberFavorite3", columnDefinition = "nvarchar(20)")
	private String memberFavorite3;

	@Column(name = "CookieStatus", columnDefinition = "int")
	private Integer cookieStatus;

	@OrderBy("LoginTime DESC")
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "member", targetEntity = LoginRecord.class)
	private Set<LoginRecord> loginRecords = new LinkedHashSet<LoginRecord>();
	
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "member", targetEntity = MemberExperience.class)
	private List<MemberExperience> MemberExperience = new ArrayList<>();

	@JsonManagedReference
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "member")
	private List<Note> noteList = new ArrayList<>();

	@JsonManagedReference(value = "shopcar")
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "member")
	private List<ShopCar> shoppingDetail = new ArrayList<>();

//	@JsonManagedReference
//	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "member")
//	private List<Order> order = new ArrayList<>();

	@JsonManagedReference
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "member")
	private List<BlogPost> postList = new ArrayList<>();

	public Member() {

	}

	public Integer getMemberId() {
		return memberId;
	}

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhoto() {
		return memberPhoto;
	}

	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberLoginTime() {
		return memberLoginTime;
	}

	public void setMemberLoginTime(String memberLoginTime) {
		this.memberLoginTime = memberLoginTime;
	}

	public String getMemberTelephone() {
		return memberTelephone;
	}

	public void setMemberTelephone(String memberTelephone) {
		this.memberTelephone = memberTelephone;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberAge() {
		return memberAge;
	}

	public void setMemberAge(String memberAge) {
		this.memberAge = memberAge;
	}

	public String getIdentityNumber() {
		return identityNumber;
	}

	public void setIdentityNumber(String identityNumber) {
		this.identityNumber = identityNumber;
	}

	public String getMemberEducated() {
		return memberEducated;
	}

	public void setMemberEducated(String memberEducated) {
		this.memberEducated = memberEducated;
	}

	public String getMemberLastPassword() {
		return memberLastPassword;
	}

	public void setMemberLastPassword(String memberLastPassword) {
		this.memberLastPassword = memberLastPassword;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Integer getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(Integer verifyCode) {
		this.verifyCode = verifyCode;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMailVerifyStatus() {
		return mailVerifyStatus;
	}

	public void setMailVerifyStatus(String mailVerifyStatus) {
		this.mailVerifyStatus = mailVerifyStatus;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}


	public String getMemberSkill1() {
		return memberSkill1;
	}

	public void setMemberSkill1(String memberSkill1) {
		this.memberSkill1 = memberSkill1;
	}

	public String getMemberSkill2() {
		return memberSkill2;
	}

	public void setMemberSkill2(String memberSkill2) {
		this.memberSkill2 = memberSkill2;
	}

	public String getMemberSkill3() {
		return memberSkill3;
	}

	public void setMemberSkill3(String memberSkill3) {
		this.memberSkill3 = memberSkill3;
	}

	public String getMemberFavorite1() {
		return memberFavorite1;
	}

	public void setMemberFavorite1(String memberFavorite1) {
		this.memberFavorite1 = memberFavorite1;
	}

	public String getMemberFavorite2() {
		return memberFavorite2;
	}

	public void setMemberFavorite2(String memberFavorite2) {
		this.memberFavorite2 = memberFavorite2;
	}

	public String getMemberFavorite3() {
		return memberFavorite3;
	}

	public void setMemberFavorite3(String memberFavorite3) {
		this.memberFavorite3 = memberFavorite3;
	}

	public Integer getCookieStatus() {
		return cookieStatus;
	}

	public void setCookieStatus(Integer cookieStatus) {
		this.cookieStatus = cookieStatus;
	}
	
	public Set<LoginRecord> getLoginRecords() {
		return loginRecords;
	}
	
	public void setLoginRecords(Set<LoginRecord> loginRecords) {
		this.loginRecords = loginRecords;
	}

//	public List<ShopCar> getShoppingDetail() {
//		return shoppingDetail;
//	}
//
//	public void setShoppingDetail(List<ShopCar> shoppingDetail) {
//		this.shoppingDetail = shoppingDetail;
//	}

	public List<MemberExperience> getMemberExperience() {
		return MemberExperience;
	}

	public void setMemberExperience(List<MemberExperience> memberExperience) {
		MemberExperience = memberExperience;
	}
}
