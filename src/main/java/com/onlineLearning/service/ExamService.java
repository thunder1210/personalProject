package com.onlineLearning.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onlineLearning.model.ExamRepository;

@Service
@Transactional
public class ExamService {

	@Autowired
	private ExamRepository examDao;
	
}
