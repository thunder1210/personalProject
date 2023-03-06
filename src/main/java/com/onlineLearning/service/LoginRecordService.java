package com.onlineLearning.service;

import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.transaction.Transactional;

import org.lionsoul.ip2region.xdb.Searcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.github.houbb.opencc4j.util.ZhConverterUtil;
import com.onlineLearning.model.LoginRecord;
import com.onlineLearning.model.LoginRecordRepository;
import com.onlineLearning.model.Member;

@Service
@Transactional
public class LoginRecordService {

	@Autowired
	private LoginRecordRepository loginRecordDao;
	
	@Autowired
	private MemberService memberService;

	private Searcher searcher;
	
	public Page<LoginRecord> findLoginRecordsByMember(Integer memberId, Integer pageNumber){
		
		Pageable pgb = PageRequest.of(pageNumber-1, 10, Sort.Direction.DESC, "LoginTime");
		Page<LoginRecord> page = loginRecordDao.findRecordsByMember(memberId, pgb);
		return page;
	}
	
	public void newRegisterLogin(String memberAccount, String ip, String header) {

		String type;
		String region = null;
		String errorMessage = null;
		LoginRecord loginRecord = new LoginRecord();

		if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "127.0.0.1";
		}

		if ("127.0.0.1".equals(ip) || ip.startsWith("192.168")) {
			region = "台灣/本機IP";
		}

		if (searcher == null) {
			try {
				File file = ResourceUtils.getFile("classpath:ip2region.xdb");
				String dbPath = file.getPath();
				searcher = Searcher.newWithFileOnly(dbPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		try {
			region = searcher.search(ip);
		} catch (Exception e) {
			errorMessage = e.getMessage();
			if (errorMessage != null && errorMessage.length() > 256) {
				errorMessage = errorMessage.substring(0, 256);
			}
			e.printStackTrace();
		}

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = dateFormat.format(new Date());
		Timestamp timestamp = Timestamp.valueOf(date);

		if (header.contains("Edge")) {
			type = "Edge";
		} else if (header.contains("Firefox")) {
			type = "Firefox";
		} else if (header.contains("Opera")) {
			type = "Firefox";
		} else if (header.contains("Chrome")) {
			type = "Chrome";
		} else {
			type = "未知裝置";
		}

		String ipDataWords = region.substring(region.lastIndexOf("|") +1);
		
		Member member = memberService.getMemberByMemberName(memberAccount);
		loginRecord.setLoginTime(timestamp);
		loginRecord.setLoginIP(ip);
		loginRecord.setLoginLocation(ZhConverterUtil.convertToTraditional(ipDataWords));
		loginRecord.setLoginType(type);
		loginRecord.setLoginStatus("成功");
		loginRecord.setSystemEvent("新註冊會員登入");
		loginRecord.setMember(member);
		member.getLoginRecords().add(loginRecord);
		memberService.addMember(member);
	}

	public void newLoginFailed(String memberAccount, String ip, String header, String loginEvent) {

		String type;
		LoginRecord loginRecord = new LoginRecord();

		if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "127.0.0.1";
		}

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = dateFormat.format(new Date());
		Timestamp timestamp = Timestamp.valueOf(date);

		if (header.contains("Edge")) {
			type = "Edge";
		} else if (header.contains("Chrome")) {
			type = "Chrome";
		} else if (header.contains("Safari")) {
			type = "Safari";
		} else if (header.contains("Firefox")) {
			type = "Firefox";
		} else {
			type = "未知裝置";
		}

		try {
			Member member = memberService.getMemberByMemberName(memberAccount);
			loginRecord.setSystemEvent(loginEvent);
			loginRecord.setLoginIP(ip);
			loginRecord.setLoginType(type);
			loginRecord.setLoginStatus("失敗");
			loginRecord.setLoginTime(timestamp);
			loginRecord.setLoginLocation("台灣/本機IP");
			loginRecord.setMember(member);
			member.getLoginRecords().add(loginRecord);
			memberService.addMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void newLoginSuccess(String memberAccount, String ip, String header) {

		String type;
		String region = null;
		String errorMessage = null;
		LoginRecord loginRecord = new LoginRecord();

		if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "127.0.0.1";
		}

		if ("127.0.0.1".equals(ip) || ip.startsWith("192.168")) {
			region = "台灣/本機IP";
		}

		if (searcher == null) {
			try {
				File file = ResourceUtils.getFile("classpath:ip2region.xdb");
				String dbPath = file.getPath();
				searcher = Searcher.newWithFileOnly(dbPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		try {
			region = searcher.search(ip);
		} catch (Exception e) {
			errorMessage = e.getMessage();
			if (errorMessage != null && errorMessage.length() > 256) {
				errorMessage = errorMessage.substring(0, 256);
			}
			e.printStackTrace();
		}

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = dateFormat.format(new Date());
		Timestamp timestamp = Timestamp.valueOf(date);

		if (header.contains("Edge")) {
			type = "Edge";
		} else if (header.contains("Firefox")) {
			type = "Firefox";
		} else if (header.contains("Opera")) {
			type = "Firefox";
		} else if (header.contains("Chrome")) {
			type = "Chrome";
		} else {
			type = "未知裝置";
		}

		String ipDataWords = region.substring(region.lastIndexOf("|") +1);
		
		Member member = memberService.getMemberByMemberName(memberAccount);
		loginRecord.setLoginTime(timestamp);
		loginRecord.setLoginIP(ip);
		loginRecord.setLoginLocation(ZhConverterUtil.convertToTraditional(ipDataWords));
		loginRecord.setLoginType(type);
		loginRecord.setLoginStatus("成功");
		loginRecord.setSystemEvent("登入成功");
		loginRecord.setMember(member);
		member.getLoginRecords().add(loginRecord);
		memberService.addMember(member);
	}
}
