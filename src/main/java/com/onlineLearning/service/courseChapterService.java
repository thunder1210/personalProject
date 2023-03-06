package com.onlineLearning.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onlineLearning.model.CourseChapter;
import com.onlineLearning.model.CourseChapterRepository;

@Service
@Transactional
public class courseChapterService {
	
	@Autowired
	private CourseChapterRepository courseChapterDao;
	
	public CourseChapter findAll(Integer courseId) {
		CourseChapter chapter = courseChapterDao.showFirstChapter(courseId);
		return chapter;
	}

}
