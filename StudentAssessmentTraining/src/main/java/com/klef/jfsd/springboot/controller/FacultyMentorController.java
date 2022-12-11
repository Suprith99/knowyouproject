package com.klef.jfsd.springboot.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.FacultyMentorService;
import com.klef.jfsd.springboot.service.StudentService;


@Controller
public class FacultyMentorController 
{
	@Autowired
	private FacultyMentorService mentorService;
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/facultyhome")
	public ModelAndView facultyhome(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String funame=(String) session.getAttribute("funame");
		ModelAndView mv=new ModelAndView();
		if(funame!=null)
		{
			mv.setViewName("facultyhome");
			mv.addObject("funame", funame);
			return mv;
		}
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping("/changefacultypwdpage")
	public ModelAndView changestudentpwdpage(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String funame=(String) session.getAttribute("funame");
		ModelAndView mv=new ModelAndView();
		if(funame!=null)
		{
			
			
			mv.setViewName("changestudentpwd");
			int fid=(int) session.getAttribute("facultyid");
			mv.addObject("fid", fid);
			mv.addObject("funame", funame);
			return mv;
		}
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("/viewmystudents")
	public ModelAndView viewmystudents(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String funame=(String) session.getAttribute("funame");
		String facultyname=(String) session.getAttribute("facultyname");
		ModelAndView mv=new ModelAndView();
		if(funame!=null)
		{
			mv.setViewName("viewstudentsforfaculty");
			List<Student> students=mentorService.viewstudenysbyfaculty(facultyname);
			mv.addObject("students", students);
			mv.addObject("funame", funame);
			return mv;
		}
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("/viewstudentprofilebyfaculty")
	public ModelAndView viewstudentprofile(HttpServletRequest request,@RequestParam("s_id")int s_id)
	{
		HttpSession session=request.getSession();
		String funame=(String) session.getAttribute("funame");
		String facultyname=(String) session.getAttribute("facultyname");
		ModelAndView mv=new ModelAndView();
		if(funame!=null)
		{
			Student student=studentService.viewstudentbyid(s_id);
			mv.setViewName("viewstudentprofilebyfaculty");
			mv.addObject("student", student);
			return mv;
		}
		mv.setViewName("index");
		return mv;
	}
}
