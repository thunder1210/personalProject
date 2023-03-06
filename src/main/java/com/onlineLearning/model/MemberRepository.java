package com.onlineLearning.model;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

@Transactional
public interface MemberRepository extends JpaRepository<Member, Integer> {

	@Query(value = "from Member where memberAccount = :ac")
	public Member loginCheck(@Param("ac") String ac);
	
	@Query(value = "from Member where memberAccount = :ac")
	public Member memberMailVerifyStatusCheck(@Param("ac") String ac);
	
	@Modifying
	@Transactional
	@Query(value = "update Member set cookieStatus = 1 where memberAccount = :ac")
	public void setCookieStatus(@Param("ac") String ac);
	
	@Modifying
	@Transactional
	@Query(value = "update Member set cookieStatus = 0 where memberAccount = :ac")
	public void setLogoutCookieStatus(@Param("ac") String ac);
	
	@Modifying
	@Transactional
	@Query(value = "if exists (select * from Member where (memberAccount = 'test1234')) UPDATE member set MemberStatus = '啟用' ELSE INSERT INTO Member (memberAccount, memberPassword, memberName, memberLoginTime, memberStatus, mailVerifyStatus, memberPhoto, nickName, memberAge, memberEmail, memberTelephone, memberAddress, memberEducated, memberGender) values ('test1234', '2BBE0C48B91A7D1B8A6753A8B9CBE1DB16B84379F3F91FE115621284DF7A48F1CD71E9BEB90EA614C7BD924250AA9E446A866725E685A65DF5D139A5CD180DC9', '洪子敬', 0, '啟用', '已驗證', 'https://www.greencrossvets.com.au/wp-content/uploads/2022/07/Shiba-Inu-Breed-Guide-1-e1657502016242.jpg', '小子敬', '28', 'Allen0615@yahoo.com.tw', '0981652248', '台北市大安區復興南路一段390號2樓', '博士', '男性')", nativeQuery = true, countProjection = "Member")
	public void createTestAccount();

	@Modifying
	@Transactional
	@Query(value = "if exists (select * from Member where (memberAccount = :sub)) UPDATE member set MemberName = :name, MemberPhoto = :photo, MemberEmail = :email where MemberAccount = :sub ELSE INSERT INTO Member (MemberAccount, MemberPhoto, MemberEmail ,MemberName, MemberLoginTime, MemberStatus,  MailVerifyStatus) values (:sub, :photo, :email, :name, 0, '啟用', '未驗證')", nativeQuery = true, countProjection = "Member")
	public void newGreenMember(@Param("sub") String sub, @Param("name") String name, @Param("photo") String photo,
			@Param("email") String email);
	
	@Modifying
	@Transactional
	@Query(value = "update Member set memberPassword = :pw where memberAccount = :ac")
	public void resetPassword(@Param("ac") String ac, @Param("pw") String pw);

	@Modifying
	@Transactional
	@Query(value = "update Member set memberLoginTime=0 where memberAccount = :ac")
	public void resetLoginTimes(@Param("ac") String ac);

	@Modifying
	@Transactional
	@Query(value = "update Member set memberStatus = :status where memberAccount = :ac")
	public void unfreezeTheAccount(@Param("status") String stauts, @Param("ac") String ac);

	@Modifying
	@Transactional
	@Query(value = "update Member set memberStatus = :status where memberAccount = :ac")
	public void setMemeberStatus(@Param("status") String stauts, @Param("ac") String ac);

	@Modifying
	@Transactional
	@Query(value = "update Member set memberLoginTime = MemberLoginTime+1 where memberAccount = :ac")
	public void setLoginTimes(@Param("ac") String ac);

	@Modifying
	@Transactional
	@Query(value = "update Member set VerifyCode = :verifyCode where memberAccount = :ac")
	public void generateVerifyCode(@Param("verifyCode") Integer verifycode, @Param("ac") String ac);

	@Modifying
	@Transactional
	@Query(value = "update Member set MailVerifyStatus = :veirfyPass where memberAccount = :ac")
	public void verifyPass(@Param("veirfyPass") String veirfyPass, @Param("ac") String ac);
	
	@Query(value = "from Member where memberAccount = :ac")
	public Member findMemberByMemberAccount(@Param("ac") String ac);

	@Modifying
	@Transactional
	@Query(value = "update Member set MemberName = :memberName, NickName = :nickName, MemberEmail = :memberEmail, MemberTelephone = :memberTelephone, MemberAge = :memberAge, MemberEducated = :memberEducated, IdentityNumber = :identityNumber, MemberAddress = :memberAddress where MemberId = :memberId", nativeQuery = true, countProjection = "Member")
	public void updateMemberInformation(@Param("memberName") String name, @Param("nickName") String nickName,
			@Param("memberEmail") String email, @Param("memberTelephone") String tel, @Param("memberAge") String age,
			@Param("memberEducated") String educated, @Param("identityNumber") String id,
			@Param("memberAddress") String address, @Param("memberId") Integer mid);

	@Query(value = "from Member where memberAccount = :ac")
	public Member checkVerifyCode(@Param("ac") String ac);

	@Query(value = "from Member where memberAccount = :ac")
	public Member callAndFindId(@Param("ac") String ac);
}
