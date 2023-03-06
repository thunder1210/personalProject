package com.onlineLearning.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onlineLearning.model.Member;
import com.onlineLearning.model.MemberExperience;
import com.onlineLearning.model.MemberExperienceData;
import com.onlineLearning.service.MemberExperienceService;
import com.onlineLearning.service.MemberService;

@Controller
public class MemberExperienceController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberExperienceService ExService;

	@GetMapping("/BackendSystem/test")
	public String testHere() {
		return "thunder/Test";
	}

	@GetMapping("/BackendSystem/box")
	public String theMessageBox(Model model) {
		List<MemberExperienceData> list = ExService.showAllComments();
		model.addAttribute("list", list);
		return "thunder/MessageBox";
	}

	@ResponseBody
	@PostMapping("/Membership/newExperienceComment")
	public void newExperienceComment(@RequestBody MemberExperience memEx) {

		Member member = memberService.findMemberById(memEx.getMemberid());
		MemberExperience memberExperience = new MemberExperience();
		memberExperience.setFeedbackContent(memEx.getFeedbackContent());
		memberExperience.setFeedbackTime(memEx.getFeedbackTime());
		memberExperience.setStarCounts(memEx.getStarCounts());
		memberExperience.setMember(member);
		member.getMemberExperience().add(memberExperience);
		memberService.addMember(member);
	}
}
