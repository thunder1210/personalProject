package com.onlineLearning.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onlineLearning.model.Member;
import com.onlineLearning.model.MemberRepository;

@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberRepository memberDao;

	public Member myFindMemberById(String id) {
		Optional<Member> optional = memberDao.findById(Integer.valueOf(id));
		Member member = optional.get();
		return member;
	}
	
	public Member findMemberByMemberAccount(String memberAccount) {
		Member theMember = memberDao.findMemberByMemberAccount(memberAccount);
		return theMember;
	}
	
	public boolean setCookieStatus(String account) {
		try {
			memberDao.setCookieStatus(account);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean setLogoutCookieStatus(String account) {
		try {
			memberDao.setLogoutCookieStatus(account);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean resetPassword(String account, String password) {
		try {
			Member statusCheck = memberDao.memberMailVerifyStatusCheck(account);
			if (statusCheck.getMailVerifyStatus().equals("未驗證")) {
				return false;
			}
			memberDao.resetPassword(account, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("重設密碼失敗，請確認輸入帳號和信箱是否有誤");
			return false;
		}
		return true;
	}

	public Member test() {
		memberDao.createTestAccount();
		Member member = memberDao.loginCheck("test1234");
		return member;
	}

	public void resetLoginTimes(String ac) {
		memberDao.resetLoginTimes(ac);
	}

	public boolean freeTheMember(String status, String ac) {
		try {
			memberDao.unfreezeTheAccount(status, ac);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public String verifyMemberStatus(String account) {

		Member member = memberDao.callAndFindId(account);
		if (member.getMemberStatus().equals("啟用")) {
			return "啟用";
		} else if (member.getMemberStatus().equals("凍結")) {
			return "凍結";
		} else if (member.getMemberStatus().equals("停權")) {
			return "停權";
		}
		return "帳號不存在";
	}

	public boolean greenLogin(Member member) {
		try {
			memberDao.callAndFindId(member.getMemberAccount());
			memberDao.newGreenMember(member.getMemberAccount(), member.getMemberName(), member.getMemberPhoto(),
					member.getMemberEmail());
		} catch (Exception e) {
			memberDao.newGreenMember(member.getMemberAccount(), member.getMemberName(), member.getMemberPhoto(),
					member.getMemberEmail());
			e.printStackTrace();
		}
		return true;
	}

	public List<Member> findAllMemberList() {
		List<Member> list = memberDao.findAll();
		return list;
	}

	public boolean deleteMember(Integer mId) {
		memberDao.deleteById(mId);
		return true;
	}

	public void addMember(Member member) {
		memberDao.save(member);
	}

	public boolean updateMemberPhotoByAjax(Member editMember) {

		Optional<Member> optional = memberDao.findById(editMember.getMemberId());
		if (optional.isPresent()) {
			Member member = optional.get();
			member.setMemberPhoto(editMember.getMemberPhoto());
			memberDao.save(member);
			return true;
		}
		return false;
	}

	public Member findMemberById(Integer id) {
		Optional<Member> optional = memberDao.findById(id);
		Member member = optional.get();
		return member;
	}

	public Member getMemberByMemberName(String ac) {
		return memberDao.loginCheck(ac);
	}

	public boolean loginCheck(String ac, String pw) {

		Member result = memberDao.loginCheck(ac);

		if (result == null) {
			return false;
		}
		try {
			Integer loginTimes = Integer.valueOf(result.getMemberLoginTime());

			if (loginTimes >= 3) {
				memberDao.setMemeberStatus("凍結", ac);
				return false;
			}

			if (!result.getMemberAccount().equals(ac)) {
				return false;
			}

			if (result.getMemberAccount().equals(ac) && !result.getMemberLastPassword().equals(pw)) {
				memberDao.setLoginTimes(ac);
				return false;
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public void generateVerifyCode(Integer verifyCode, String ac) {
		memberDao.generateVerifyCode(verifyCode, ac);
	}

	public boolean checkVerifyCode(String ac, Integer code) {
		Member result = memberDao.checkVerifyCode(ac);
		if (!result.getVerifyCode().equals(code)) {
			return false;
		}
		memberDao.verifyPass("已驗證", result.getMemberAccount());
		return true;
	}

	public Member callAndFindId(String ac) {
		return memberDao.callAndFindId(ac);
	}

	public boolean updateMemberInformation(String name, String nickName, String email, String tel, String age,
			String educated, String id, String address, Integer mid) {

		try {
			memberDao.updateMemberInformation(name, nickName, email, tel, age, educated, id, address, mid);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public Member checkIfAccountExist(String accountName) {
		return memberDao.callAndFindId(accountName);
	}

	public Member findAndUpdateMemberById(Integer id) {
		Optional<Member> theOne = memberDao.findById(id);
		if (theOne.isPresent()) {
			return theOne.get();
		}
		Member msg = new Member();
		msg.setMemberName("更新失敗");
		return msg;
	}
}
