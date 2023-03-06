package com.onlineLearning.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.onlineLearning.model.Course;
import com.onlineLearning.model.CourseChapter;
import com.onlineLearning.model.CourseChapterRepository;
import com.onlineLearning.model.CourseRepository;

@Service
@Transactional
public class CourseService {

	@Autowired
	private CourseChapterRepository courseChapterDao;

	@Autowired
	private CourseRepository courseDao;
	
	
	public void insertCourse(Course course) {
		courseDao.save(course);
	}
	
	public void insertCourseChapter(CourseChapter courseChapter) {
		courseChapterDao.save(courseChapter);
	}
	
	public Course getLastCourse() {
		return courseDao.findFirstByOrderByCourseIdDesc();
	}
	
	public Course findCourseById(Integer id) {
		Optional<Course> opt = courseDao.findById(id);
		if(opt.isPresent()) {
			return opt.get();
		}
		return null;
	}
	
	public CourseChapter findCourseChapterById(Integer id) {
		Optional<CourseChapter> opt = courseChapterDao.findById(id);
		if(opt.isPresent()) {
			CourseChapter courseContent = opt.get();
			return courseContent;
		}
		return null;
	}
	
	public List<Course> findCourseByCourseNameLike(String name) {
		return courseDao.findByKeyword(name);
	}
	
	public List<Course> findAllCourse(){
		return courseDao.findAll();
	}
	
	public void deleteByCourseId(Integer id) {
		courseDao.deleteById(id);
	}
	
	public void deleteByCourseChapterById(Integer id) {
		courseChapterDao.deleteById(id);
	}
	
	public Page<Course> getCourseByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber - 1, 8, Sort.Direction.DESC, "courseId");
		Page<Course> page = courseDao.findAll(pgb);
		return page;
	}
}

