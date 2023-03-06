package com.onlineLearning.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onlineLearning.model.Course;
import com.onlineLearning.model.CourseChapter;
import com.onlineLearning.model.Product;
import com.onlineLearning.service.CourseService;
import com.onlineLearning.service.ProductService;

@Controller
public class CourseController {

	@Autowired
	private CourseService cService;

	@Autowired
	private ProductService pService;

	// http://localhost:8080/onlinelearning/course/admin
	@GetMapping("/course/admin")
	private String goCourseAdmin(
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, 
			Model model) {
		Page<Course> pageCourse = cService.getCourseByPage(pageNumber);
		model.addAttribute("course", pageCourse);
		model.addAttribute("currentPage", pageNumber);
		return "chou/CourseAdmin";
	}

	// http://localhost:8080/onlinelearning/course/learning
	@GetMapping("/course/learning")
	private String goLearningPage(
			@RequestParam("courseId") Integer id, 
			@RequestParam("courseChapterId") Integer cid,
			Model model) {
		Course cId = cService.findCourseById(id);
		List<CourseChapter> listChap = cId.getCourseChapter();
		CourseChapter cCid = cService.findCourseChapterById(cid);

		model.addAttribute("course", cId);
		model.addAttribute("allChapter", listChap);
		model.addAttribute("chapter", cCid);
		return "chou/CourseLearning";
	}

	// http://localhost:8080/onlinelearning/course/insert
	@GetMapping("/course/page/insert")
	private String goCourseInsert() {
		return "chou/CourseInsert";
	}

	@PostMapping("/course/insert")
	public String insertCourse(
			@RequestParam("pId") Integer id, 
			@RequestParam("courseName") String cName,
			@RequestParam("coursePicture") MultipartFile cFile, 
			@RequestParam("courseType") String cType, Model model)
			throws IOException {
		Product product = pService.findById(id);
		Course course = new Course();
		InputStream cIS = cFile.getInputStream();
		String base = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(cIS.readAllBytes());
		course.setCourseName(cName);
		course.setCourseType(cType);
		course.setCoursePicture(base);
		product.setCourse(course);

		model.addAttribute("course", course);
		pService.insert(product);
		cIS.close();
		return "redirect:/course/page/insertChapter";
	}

	@GetMapping("/course/page/insertChapter")
	public String goInsertChapterPage(Model model) {
		Course cId = cService.getLastCourse();
		List<CourseChapter> cChap = cId.getCourseChapter();

		model.addAttribute("course", cId);
		model.addAttribute("chapter", cChap);
		return "chou/CourseInsertChapter";
	}

	@PostMapping("/course/insert2")
	public String insertCourse2(
			@RequestParam("newCourseChapter") String crsChapter, 
			@RequestParam("newCourseContent") String crsContent,
			@RequestParam("newVideoOrNot") String von) {
		Course cId = cService.getLastCourse();
		List<CourseChapter> listCourse = cId.getCourseChapter();
		CourseChapter cChap = new CourseChapter();
		cChap.setCourseChapter(crsChapter);
		cChap.setCourseContent(crsContent);
		cChap.setVideoOrNot(von);
		cChap.setCourse(cId);
		listCourse.add(cChap);

		cId.setCourseChapter(listCourse);

		cService.insertCourse(cId);
		return "redirect:/course/page/insertChapter";
//		return "redirect:/product/productcreate";
	}

	@GetMapping("/course/edit")
	public String goToEditCoursePage(@RequestParam("courseId") Integer id, Model model) {
		Course cId = cService.findCourseById(id);
		List<CourseChapter> crsChapter = cId.getCourseChapter();

		model.addAttribute("course", cId);
		model.addAttribute("chapter", crsChapter);
		return "chou/CourseEdit";
	}

	@GetMapping("/course/edit2")
	public String goToEditedCoursePage(@ModelAttribute("courseId") Integer id, Model model) {
		Course cId = cService.findCourseById(id);
		List<CourseChapter> crsChapter = cId.getCourseChapter();

		model.addAttribute("course", cId);
		model.addAttribute("chapter", crsChapter);
		return "chou/CourseEdit";
	}

	@PostMapping("/course/courseEdited")
	public String updateChapter(@ModelAttribute("course") Course course,
			@RequestParam("theCoursePicture") MultipartFile cFile) throws IOException {
		String base = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(cFile.getBytes());
		course.setCoursePicture(base);
		cService.insertCourse(course);
		return "redirect:/product/productlist";
	}

	@PostMapping("/course/chapterEdited")
	public String chapterEdit(
			@RequestParam("courseChapterId") Integer id, @RequestParam("courseChapter") String crsC,
			@RequestParam("courseContent") String crsCo, @RequestParam("videoOrNot") String von,
			RedirectAttributes redirectAttributes) {
		CourseChapter cChap = cService.findCourseChapterById(id);
		cChap.setCourseChapter(crsC);
		cChap.setCourseContent(crsCo);
		cChap.setVideoOrNot(von);
		cService.insertCourseChapter(cChap);
		Integer courseId = cChap.getCourse().getCourseId();
		System.out.println("抓抓   :" + courseId);
		redirectAttributes.addFlashAttribute("courseId", courseId);
		return "redirect:/course/edit2";
	}

	@DeleteMapping("/course/chapterDelete")
	public String deleteChapterById(@RequestParam("courseChapterId") Integer id,
			RedirectAttributes redirectAttributes) {
		CourseChapter cChap = cService.findCourseChapterById(id);
		Integer courseId = cChap.getCourse().getCourseId();
		redirectAttributes.addFlashAttribute("courseId", courseId);
		cService.deleteByCourseChapterById(id);
		return "redirect:/course/edit2";
	}

	@DeleteMapping("/course/delete")
	public String deleteCourseById(@RequestParam("courseId") Integer id) {
		cService.deleteByCourseId(id);
		return "redirect:/course/admin";
	}

}
