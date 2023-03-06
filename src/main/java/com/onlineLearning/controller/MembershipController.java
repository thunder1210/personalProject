package com.onlineLearning.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.onlineLearning.model.ChatMember;
import com.onlineLearning.model.LoginRecord;
import com.onlineLearning.model.Member;
import com.onlineLearning.model.MemberTimer;
import com.onlineLearning.service.LoginRecordService;
import com.onlineLearning.service.MemberPostManService;
import com.onlineLearning.service.MemberService;
import com.onlineLearning.util.GeneratePasswordUtil;
import com.onlineLearning.util.MemberEncodeTools;
import com.onlineLearning.util.MemberTimberUtil;
import com.onlineLearning.util.MemberVerifyRecaptcha;
import com.onlineLearning.util.SecureHashAlgorithmUtil;
import com.onlineLearning.util.UserUtil;

@Controller
public class MembershipController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberPostManService mailService;

	@Autowired
	private LoginRecordService loginRecordService;

	@Autowired
	private HttpSession session;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private Scheduler scheduler;

	@Autowired
	private MemberTimer memberTimer;

	@GetMapping("/Membership/login")
	public String loginTheWebsite() {
		return "thunder/MemberLogin";
	}

	@GetMapping("/Membership/agreement")
	public String agreement() {
		return "thunder/MemberAgreement";
	}

	@GetMapping("/Membership/fastLogin")
	public String fastLogin(HttpServletResponse response) {
		try {
			session.removeAttribute("loginMember");
			Member member = memberService.test();
			memberService.setCookieStatus("test1234");
			session.setAttribute("loginMember", member);
			loginRecordService.newLoginSuccess("test1234", "127.0.0.1", "快速登入");
			Cookie cookie = new Cookie("User", "test1234");
			cookie.setPath("/");
//			cookie.setSecure(true);
			cookie.setMaxAge(30 * 24 * 60 * 60);
			response.addCookie(cookie);
		} catch (Exception e) {
			return "redirect:/";
		}
		return "redirect:/";
	}

	@ResponseBody
	@PostMapping("/Membership/resetPassword")
	public String resetPwd(@RequestParam("mail") String mail, @RequestParam("account") String account) {

		String resetPw = GeneratePasswordUtil.getPassWordOne(6);
		boolean result = memberService.resetPassword(account, resetPw);

		if (result == true) {
			String resetContent = "您的重置密碼為" + resetPw;
			mailService.sendMail(mail, "THUNDER線上平台密碼重置信件 (請勿直接回覆或轉發)", resetContent);
		} else if (result == false) {
			return "發送失敗，請確認帳號是否存在或信箱是否已驗證！";
		}
		return "已發送，請檢查您的信箱並盡速修改密碼，謝謝！";
	}

	@ResponseBody
	@PostMapping("/Membership/launchTheList")
	public Set<ChatMember> getTheSocketList() {
		return UserUtil.getAllUser();
	}

	@ResponseBody
	@PostMapping("/Membership/theHobbyTagEdit")
	public String theHobbyTagEdit(@RequestBody Member member) {

		Member thisOne = memberService.findMemberById(member.getMemberId());

		if (member.getMemberFavorite1() == null) {
			thisOne.setMemberFavorite1(member.getMemberFavorite1());
			thisOne.setMemberFavorite2(null);
			thisOne.setMemberFavorite3(null);
			memberService.addMember(thisOne);
			return "更新成功！";
		} else if (member.getMemberFavorite1() != null) {
			thisOne.setMemberFavorite1(member.getMemberFavorite1());
		}

		if (member.getMemberFavorite2() != null) {
			thisOne.setMemberFavorite2(member.getMemberFavorite2());
		}

		if (member.getMemberFavorite3() != null) {
			thisOne.setMemberFavorite3(member.getMemberFavorite3());
		}

		memberService.addMember(thisOne);
		return "更新成功！";
	}

	@ResponseBody
	@PostMapping("/Membership/theSkillTagEdit")
	public String theSkillTagEdit(@RequestBody Member member) {

		Member thisOne = memberService.findMemberById(member.getMemberId());

		if (member.getMemberSkill1() == null) {
			thisOne.setMemberSkill1(member.getMemberSkill1());
			thisOne.setMemberSkill2(null);
			thisOne.setMemberSkill3(null);
			memberService.addMember(thisOne);
			return "更新成功！";
		} else if (member.getMemberSkill1() != null) {
			thisOne.setMemberSkill1(member.getMemberSkill1());
		}

		if (member.getMemberSkill2() != null) {
			thisOne.setMemberSkill2(member.getMemberSkill2());
		}

		if (member.getMemberSkill3() != null) {
			thisOne.setMemberSkill3(member.getMemberSkill3());
		}

		memberService.addMember(thisOne);
		return "更新成功！";
	}

	@ResponseBody
	@PostMapping("/Membership/cropped")
	public String croppedPicture(@RequestBody Member member) {
		boolean theResult = memberService.updateMemberPhotoByAjax(member);
		if (theResult == false) {
			return "更新失敗";
		}
		return "更新成功！";
	}

	@ResponseBody
	@GetMapping("/Membership/checkAC")
	public String checkIfAccountExist(@RequestParam("theWantedAccount") String theWantedAccount) {
		try {
			Member member = memberService.checkIfAccountExist(theWantedAccount);
			member.getMemberAccount();
			return "no";
		} catch (Exception e) {
			;
		}
		return "yes";
	}

	@ResponseBody
	@GetMapping("/Membership/orderPages")
	public Page<LoginRecord> showMessageByPageAjax(
			@SessionAttribute(name = "loginMember", required = false) Member sessionMember,
			@RequestParam(name = "theWantedPage") Integer theWantedPage) {
		Page<LoginRecord> page = loginRecordService.findLoginRecordsByMember(sessionMember.getMemberId(),
				theWantedPage);
		return page;
	}

	@GetMapping("/Membership/memberCenter")
	public String goCenter(@SessionAttribute(name = "loginMember", required = false) Member sessionMember, Model m) {

		if (sessionMember == null) {
			return "thunder/MemberLogin";
		}
		Member member = memberService.findMemberById(sessionMember.getMemberId());
		Set<LoginRecord> records = member.getLoginRecords();
		Page<LoginRecord> page = loginRecordService.findLoginRecordsByMember(sessionMember.getMemberId(), 1);
		List<LoginRecord> list = page.getContent();
		m.addAttribute("records", records);
		m.addAttribute("page", page);
		m.addAttribute("list", list);
		m.addAttribute("memberBox", memberService.findAndUpdateMemberById(sessionMember.getMemberId()));
		return "thunder/MemberCenter";
	}

	@GetMapping("/Membership/register")
	public String register(Model m) {
		Member memberBox = new Member();
		m.addAttribute("memberBox", memberBox);
		return "thunder/MemberRegister";
	}

	@PostMapping("/Membership/registerResult")
	public String registerResult(@RequestParam("theMemberPhoto") MultipartFile mPic, @ModelAttribute Member member,
			Model model) throws IOException {
		
		String ip;
		String agent = request.getHeader("user-agent");

		if (request.getHeader("x-forwarded-for") == null) {
			ip = request.getRemoteAddr();
		} else {
			ip = request.getHeader("x-forwarded-for");
		}

		InputStream fix = mPic.getInputStream();
		String base = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(fix.readAllBytes());

		if (!base.equals("data:image/jpeg;base64,")) {
			member.setMemberPhoto(base);
			model.addAttribute("base", base);
		}
		String sha512 = SecureHashAlgorithmUtil.SHA512(member.getMemberPassword());
		member.setMemberLastPassword(sha512);
		member.setMemberPassword(sha512);
		member.setMemberLoginTime("0");
		member.setMemberStatus("啟用");
		member.setCookieStatus(0);
		memberService.addMember(member);
		loginRecordService.newRegisterLogin(member.getMemberAccount(), ip, agent);

		if (member.getMemberName().equals(null) || member.getMemberName().equals("")) {
			member.setMemberName(member.getMemberAccount());
		}
		session.setAttribute("loginMember", member);
		fix.close();
		return "redirect:/";
	}

	@PostMapping("/Membership/loginCheck")
	public String loginCheck(@RequestParam("g-recaptcha-response") String gRecaptcha,
			@RequestParam("loginAccount") String ac, @RequestParam("loginPassword") String pw,
			@RequestParam(value = "scales", required = false) String rememberMe, Model model,
			HttpServletResponse response) {

		String decodeuser = new String(MemberEncodeTools.decode(ac));
		String decodepw = new String(MemberEncodeTools.decode(pw));

		Map<String, String> warning = new HashMap<String, String>();
		model.addAttribute("warning", warning);
		String ip;
		String agent = request.getHeader("user-agent");

		if (request.getHeader("x-forwarded-for") == null) {
			ip = request.getRemoteAddr();
		} else {
			ip = request.getHeader("x-forwarded-for");
		}

		if (decodeuser.equals("") || decodepw.equals("")) {
			warning.put("alarm", "帳號/密碼欄位不可為空！");
			loginRecordService.newLoginFailed(decodeuser, ip, agent, "登入時未填寫密碼");
			return "thunder/MemberLogin";
		}

		if (decodeuser.length() < 8) {
			warning.put("alarm", "帳號必須超過8位英數字！");
			return "thunder/MemberLogin";
		}

		if (decodepw.length() < 8) {
			warning.put("alarm", "密碼必須超過8位英數字！");
			loginRecordService.newLoginFailed(decodeuser, ip, agent, "密碼未超過8位英數字");
			return "thunder/MemberLogin";
		}

		try {
			Boolean gResult = MemberVerifyRecaptcha.verify(gRecaptcha);
			if (gResult == false || gResult == null) {
				warning.put("alarm", "未通過Google recaptcha驗證");
				loginRecordService.newLoginFailed(decodeuser, ip, agent, "未通過Google recaptcha驗證");
				return "thunder/MemberLogin";
			}
		} catch (IOException e) {
			e.printStackTrace();
			warning.put("alarm", "Google recaptcha驗證失敗");
			loginRecordService.newLoginFailed(decodeuser, ip, agent, "Google recaptcha驗證失敗");
			return "thunder/MemberLogin";
		}

		String sha512 = SecureHashAlgorithmUtil.SHA512(decodepw);

		boolean check = memberService.loginCheck(decodeuser, sha512);

		if (check == false) {
			warning.put("alarm", "帳號/密碼有誤！");
			loginRecordService.newLoginFailed(decodeuser, ip, agent, "輸入密碼不正確！");
			return "thunder/MemberLogin";
		}

		String status = memberService.verifyMemberStatus(decodeuser);

		if (status.equals("啟用")) {
			;
		} else if (status.equals("凍結")) {
			warning.put("alarm", "此帳號已被凍結，請五分鐘後再登入！");
			memberTimer.setJobClass("com.onlineLearning.model.myTask1");
			memberTimer.setJobName("test1");
			memberTimer.setAc(decodeuser);
			memberTimer.setMemberStatus("啟用");
			memberTimer.setCronExpression("*/10 * * * * ?");
			MemberTimberUtil.createScheduleJob(scheduler, memberTimer);
			loginRecordService.newLoginFailed(decodeuser, ip, agent, "帳號為凍結狀態，登入失敗！");
			return "thunder/MemberLogin";
		} else if (status.equals("停權")) {
			warning.put("alarm", "此帳號已被停權！");
			return "thunder/MemberLogin";
		}

		if (check == true) {
			loginRecordService.newLoginSuccess(decodeuser, ip, agent);
			memberService.resetLoginTimes(decodeuser);
			session.setAttribute("loginMember", memberService.getMemberByMemberName(decodeuser));
			if (rememberMe == null) {
				;
			} else if (rememberMe.equals("on") && rememberMe != null) {
				memberService.setCookieStatus(decodeuser);
				Cookie cookie = new Cookie("User", decodeuser);
				cookie.setPath("/");
//			cookie.setSecure(true);
				cookie.setMaxAge(30 * 24 * 60 * 60);
				response.addCookie(cookie);
			}
		}
		return "redirect:/";
	}

	@ResponseBody
	@PostMapping("/Membership/sendTheMail")
	public String sendTheMail(@RequestBody Member member) {

		int code = 0;
		String alert;
		String successfulMsg = "已發送，若您的郵件地址填寫無誤，請至信箱查看並確認";

		try {
			code = (int) ((Math.random() * 9 + 1) * 10000);
			memberService.addMember(member);
			memberService.generateVerifyCode(code, member.getMemberAccount());
		} catch (Exception e) {
			alert = "發送失敗，請重新確認提供的訊息是否正確";
			return alert;
		}
		mailService.sendHtmlVerifyMail(member.getMemberEmail(), "OnlineLearning線上學習平台註冊驗證信件 (請勿直接回覆或轉發)", code);
		return successfulMsg;
	}

	@GetMapping("/Membership/greenLogin")
	public String greenLogin(@RequestParam("name") String lname,
			@RequestParam(value = "photo", required = false) String photo,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "sub", required = false) String subId) {

		Member member = new Member();
		member.setMemberName(lname);
		member.setMemberAccount(subId);
		member.setMemberPhoto(photo);
		member.setMemberEmail(email);
		boolean result = memberService.greenLogin(member);

		if (result == false) {
			Map<String, String> warning = new HashMap<String, String>();
			warning.put("alarm", "第三方系統忙碌中，請稍後再試！");
			return "thunder/MemberLogin";
		}

		String ip;
		String agent = request.getHeader("user-agent");

		if (request.getHeader("x-forwarded-for") == null) {
			ip = request.getRemoteAddr();
		} else {
			ip = request.getHeader("x-forwarded-for");
		}
		loginRecordService.newLoginSuccess(member.getMemberAccount(), ip, agent);
		session.setAttribute("loginMember", memberService.getMemberByMemberName(member.getMemberAccount()));
		return "redirect:/";
	}

	@ResponseBody
	@PostMapping("/Membership/verifyCode")
	public String checkVerifyCode(@RequestBody Member member) {

		boolean result = memberService.checkVerifyCode(member.getMemberAccount(), member.getVerifyCode());
		if (result == false) {
			return "錯誤";
		}
		return "正確";
	}

	@ResponseBody
	@PostMapping("/Membership/callAndFindId")
	public String callAndFindId(@RequestBody Member member) {

		Member theResult = memberService.callAndFindId(member.getMemberAccount());
		String theId = String.valueOf(theResult.getMemberId());
		return theId;
	}

	@ResponseBody
	@PostMapping("/Membership/logout")
	public String logoutCurrentMember(@SessionAttribute(name = "loginMember", required = false) Member sessionMember,
			HttpSession session, SessionStatus sessionStatus, HttpServletResponse response) {

		try {
			memberService.setLogoutCookieStatus(sessionMember.getMemberAccount());
		} catch (Exception e) {
			System.out.println("目前並未登入，無法登出");
		}
		session.removeAttribute("loginMember");
		session.invalidate();
		sessionStatus.setComplete();
		Cookie cookie = new Cookie("User", "");
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		return "done";
	}

	@ResponseBody
	@PostMapping("/Membership/updateMemberInfo")
	public Member updateMemberInformation(@RequestBody Member member) {

		memberService.updateMemberInformation(member.getMemberName(), member.getNickName(), member.getMemberEmail(),
				member.getMemberTelephone(), member.getMemberAge(), member.getMemberEducated(),
				member.getIdentityNumber(), member.getMemberAddress(), member.getMemberId());
		return memberService.findAndUpdateMemberById(member.getMemberId());
	}
}
