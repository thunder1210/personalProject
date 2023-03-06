package com.onlineLearning.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onlineLearning.model.Member;
import com.onlineLearning.service.MemberService;

@Controller
public class MemberBackendController {
	
	@Autowired
	private MemberService memberService;

	@GetMapping("/BackendSystem/cs")
	public String theFirstSin() {
		return "thunder/MembersCS";
	}
	
	@GetMapping("/BackendSystem/memberList")
	public String loginTheWebsite(Model model) {
		List<Member> mlist = memberService.findAllMemberList();
		model.addAttribute("mlist", mlist);
		return "thunder/MemberBackendSystem";
	}
	
	@GetMapping("/BackendSystem/deletemember")
	public String deleteMember(@RequestParam("mId") Integer mId) {
		memberService.deleteMember(mId);
		return "redirect:/BackendSystem/memberList";
	}
	
	@GetMapping("/BackendSystem/findMember")
	public String lookUpMember(@RequestParam("mId") Integer mId, Model model) {
		Member member = memberService.findMemberById(mId);
		Member emptyMemberModel = new Member();
		model.addAttribute("theOne", member);
		model.addAttribute("emptyMemberModel", emptyMemberModel);
		return "thunder/MemberBackendSystemUpdate";
	}
	
	@PostMapping("/BackendSystem/updateMemberAndWrite")
	public String writeNewProfile(@ModelAttribute Member member) {
		
		memberService.updateMemberInformation(member.getMemberName(), member.getNickName(), member.getMemberEmail(),
				member.getMemberTelephone(), member.getMemberAge(), member.getMemberEducated(),
				member.getIdentityNumber(), member.getMemberAddress(), member.getMemberId());
		return "redirect:/BackendSystem/memberList";
	}
}
