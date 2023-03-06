package com.onlineLearning.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.onlineLearning.model.Member;
import com.onlineLearning.service.MemberService;

@Controller
public class PageController {

	@Autowired
	private MemberService memberService;

// http://localhost:8080/onlinelearning/

	@GetMapping("/")
	public String goToIndex(@SessionAttribute(name = "loginMember", required = false) Member sessionMember,
			HttpSession session, HttpServletRequest request) {

		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			;
		} else if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("User".equals(cookie.getName())) {
					Member theSavedMember;
					theSavedMember = memberService.findMemberByMemberAccount(cookie.getValue());
					try {
						if (theSavedMember.getCookieStatus() == 1) {
							session.removeAttribute("loginMember");
							session.setAttribute("loginMember", theSavedMember);
							return "index";
						}
					} catch (Exception e) {
						;
					}
				}
			}
		}
		if (sessionMember == null) {
			;
		} else if (sessionMember != null) {
			Member loginMember = memberService.findMemberById(sessionMember.getMemberId());
			session.removeAttribute("loginMember");
			session.setAttribute("loginMember", loginMember);
		}
		return "index";
	}

// http://localhost:8080/onlinelearning/BackendSystem

	@GetMapping("/BackendSystem")
	public String goToBackendSystem() {
		return "BackendSystem";
	}

	@GetMapping("/NavBar")
	public String goToNavBar() {
		return "NavBar";
	}
}
