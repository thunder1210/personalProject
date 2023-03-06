package com.onlineLearning.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onlineLearning.model.MemberExperienceData;
import com.onlineLearning.model.MemberExperienceRepository;

@Service
@Transactional
public class MemberExperienceService {

	@Autowired
	private MemberExperienceRepository memberExDao;

	public List<MemberExperienceData> showAllComments() {
		List<MemberExperienceData> list = memberExDao.findAllComments();
		return list;
	}
}
