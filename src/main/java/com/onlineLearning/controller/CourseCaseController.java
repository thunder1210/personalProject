package com.onlineLearning.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.onlineLearning.model.Course;
import com.onlineLearning.model.Product;
import com.onlineLearning.service.CourseService;
import com.onlineLearning.service.ProductService;

@Controller
public class CourseCaseController {
	
	@Autowired
	private ProductService pSer;
	
	@Autowired
	private CourseService cSer;
	

//	http://localhost:8080/onlinelearning/courseindex
//	前往 Book 頁面
	@GetMapping("/courseindex" )
	private String courseIndex(Model m) {
		List<Course> allCourse = cSer.findAllCourse();
		List<Product> allp = pSer.findAllProd();
		m.addAttribute("pp", allp);
		m.addAttribute("crs", allCourse);
		return "dom/MyBookCase";
	}


	// http://localhost:8080/onlinelearning/myCourse
	@GetMapping("/myCourse")
	public String myCourses(@RequestParam("pID") Integer id, Model m) {
		Product pp = pSer.findById(id);
		m.addAttribute("product", pp);
		return "chou/MyCourse";
	}
	
	// http://localhost:8080/onlinelearning/myAllCourse
	//	前往 Course 頁面
	@GetMapping("/myAllCourse")
	public String allProduct(
			@RequestParam(name = "p", defaultValue = "1")Integer pageNumber,
			Model m) {
		List<Course> allC = cSer.findAllCourse();
		Page<Course> coursePage = cSer.getCourseByPage(pageNumber);
		m.addAttribute("course", coursePage);
		m.addAttribute("currentPage", pageNumber);
		m.addAttribute("allCourse", allC);
		return "chou/MyCourse";
	}
	
	//條件篩選
	@GetMapping("/courseTypeOption")
	public String findCourseByCourseType(@RequestParam("courseType")String type, Model m) {
		List<Course> cType = cSer.findCourseByType(type);
		List<Course> allCourse = cSer.findAllCourse();
		m.addAttribute("course", cType);
		m.addAttribute("allCourse", allCourse);
		return "chou/CourseType";
	}

	@GetMapping("/course/namelike")
	public String searchCourseNameLike(@RequestParam("searchBar") String name, Model model) {
		List<Course> courseNameLike = cSer.findCourseByCourseNameLike(name);
		List<Course> allCourse = cSer.findAllCourse();
		model.addAttribute("course", courseNameLike);
		model.addAttribute("allCourse", allCourse);
		return "chou/CourseBar";
	}
}
