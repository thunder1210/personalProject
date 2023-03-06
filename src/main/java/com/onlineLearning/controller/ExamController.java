package com.onlineLearning.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.onlineLearning.service.ExamService;

@Controller
public class ExamController {

	@Autowired
	private ExamService eService;
}
