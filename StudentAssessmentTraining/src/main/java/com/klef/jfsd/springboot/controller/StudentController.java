package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.CourseCategory;
import com.klef.jfsd.springboot.model.Enquiry;
import com.klef.jfsd.springboot.model.Material;
import com.klef.jfsd.springboot.model.MaterialStatus;
import com.klef.jfsd.springboot.model.Question;
import com.klef.jfsd.springboot.model.QuizResult;
import com.klef.jfsd.springboot.model.Registration;
import com.klef.jfsd.springboot.model.Schedule;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.StudentService;
import com.klef.jfsd.springboot.service.TrainerService;

@Controller
public class StudentController 
{
	static ModelAndView indexpage=new ModelAndView("index");
	static String suname;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private TrainerService trainerService;
	
	static List<Question> questions;
	
	static int i=0,n=0;
	static int score=0;
	
	
	@GetMapping("/studenthome")
	public ModelAndView studenthome(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		if(suname!=null)
		{
			
			ModelAndView mv=new ModelAndView("studenthome");
			int sid=(int) session.getAttribute("studentid");
			mv.addObject("sid", sid);
			return mv;
		}
		return indexpage;
	}
	@GetMapping("/viewcoursesbystudent")
	public ModelAndView viewcourses(HttpServletRequest request)
	{
		HttpSession  session=request.getSession();
		suname=(String) session.getAttribute("suname");
		if(suname!=null)
		{
			ModelAndView mv=new ModelAndView("viewcourses-student");
			List<Course> registeredcourse=studentService.viewregisterecourses(suname);
			List<Course> unregisteredcourse=studentService.viewunregisterecourses(suname);
			int sid=(int) session.getAttribute("studentid");
			mv.addObject("sid", sid);
			mv.addObject("suname",suname);
			mv.addObject("registredcourses", registeredcourse);
			mv.addObject("unregistredcourses", unregisteredcourse);
			return mv;
			
		}
		return indexpage;
	}
	@GetMapping("/registercourse")
	public String registercourse(@RequestParam("c_id")String c_id,HttpServletRequest request)
	{
		HttpSession  session=request.getSession();
		suname=(String) session.getAttribute("suname");
		if(suname!=null)
		{
			Registration registration=new Registration();
			registration.setC_id(c_id);
			registration.setS_uname(suname);
			studentService.registercourse(registration);
			return "redirect:viewcoursesbystudent";
		}
		return "redirect:/";
	}
	@GetMapping("/changestudentpwdpage")
	public ModelAndView changestudentpwdpage(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		
		if(suname!=null)
		{
			ModelAndView mv=new ModelAndView();
			
			mv.setViewName("changestudentpwd");
			int sid=(int) session.getAttribute("studentid");
			mv.addObject("sid", sid);
			mv.addObject("suname", suname);
			return mv;
		}
		return indexpage;
	}
	@GetMapping("/viewstudentprofile")
	public ModelAndView viewprofileofstudent(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		int studentid=(int) session.getAttribute("studentid");
		if(suname!=null)
		{
			Student student=studentService.viewstudentbyid(studentid);
			ModelAndView mv=new ModelAndView("studentprofile");
			mv.addObject("student", student);
			return mv;
		}
		return indexpage;
	}
	@GetMapping("/viewschedulesofstudent")
	public ModelAndView viewschedulesofstudent(HttpServletRequest request,@RequestParam("c_id")String c_id)
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		int studentid=(int) session.getAttribute("studentid");
		if(suname!=null)
		{
			session.setAttribute("c_id", c_id);
			List<Schedule> schedules= trainerService.viewSchedulesByCId(c_id);
			ModelAndView mv=new ModelAndView();
			mv.setViewName("viewschedules-student");
			int sid=(int) session.getAttribute("studentid");
			mv.addObject("sid", sid);
			mv.addObject("suname", suname);
			mv.addObject("schedules", schedules);
			
			
			return mv;
		}
		return indexpage;
	}
	@GetMapping("/displayprofilepicstudent")
	public ResponseEntity<byte[]> displayprofilepicstudent(@RequestParam("s_id") int s_id) throws IOException, SQLException
	{
	  Student student=studentService.viewstudentbyid(s_id);
	  byte [] imageBytes = null;
	  imageBytes = student.getProfileimage().getBytes(1,(int)student.getProfileimage().length());

	  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}
	
	@PostMapping("/updateprofilepicstudent")
	public String updateprofilepicstudent(HttpServletRequest request,@RequestParam("profilepic")MultipartFile file)throws IOException, SerialException, SQLException, ParseException
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		int studentid=(int) session.getAttribute("studentid");
		if(suname!=null)
		{
			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			studentService.changeprofilepic(blob, studentid);
			return "redirect:viewstudentprofile";
		}
		return "redirect:/";
	}
	@GetMapping("/viewmaterialsbycoursestudent")
	public ModelAndView viewmaterialbycourse(HttpServletRequest request,@RequestParam("c_id")String c_id)
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		int studentid=(int) session.getAttribute("studentid");
		ModelAndView mv=new ModelAndView();
		if(suname!=null)
		{
			mv.setViewName("viewmaterialsstudent");
			mv.addObject("sid", studentid);
			List<Material> completedmaterials=studentService.completedMaterials(c_id,studentid);
			List<Material> incompletmaterials=studentService.incompleteMaterials(c_id,studentid);
			mv.addObject("completedmaterials", completedmaterials);
			mv.addObject("incompletematerials", incompletmaterials);
			int percentage=(completedmaterials.size()*100)/(incompletmaterials.size()+completedmaterials.size());
			mv.addObject("percentage", percentage);
			return mv;
		}
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("/markcompleted")
	public String markcompletedmaterial(HttpServletRequest request,@RequestParam("c_id")String c_id,@RequestParam("mat_id")int mat_id)
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		int studentid=(int) session.getAttribute("studentid");
		
		if(suname!=null)
		{
			MaterialStatus materialStatus=new MaterialStatus();
			materialStatus.setCourse_id(c_id);
			materialStatus.setMaterial_id(mat_id);
			materialStatus.setStudent_id(studentid);
			studentService.addMaterialStatus(materialStatus);
			return "redirect:viewmaterialsbycoursestudent?c_id="+c_id;
		}
		return "redirect:/";
	}
	@PostMapping("/filtercategory")
	public String filtercategory(HttpServletRequest request)
	{
		if(suname!=null)
		{
			String filter=request.getParameter("filter");
			String c_id=request.getParameter("c_id");
			return "redirect:viewquizcategory?c_id="+c_id+"&filter="+filter;
		}
		return "/";
	}
	@GetMapping("/viewquizcategory")
	public ModelAndView viewquizcategory(HttpServletRequest request,@RequestParam("c_id")String c_id,@RequestParam("filter")String filter)
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		int studentid=(int) session.getAttribute("studentid");
		ModelAndView mv=new ModelAndView();
		if(suname!=null)
		{
			mv.setViewName("viewquizcategorybystudent");
			if(filter.equals("incomplete"))
			{
				List<CourseCategory> courseCategories=studentService.unattempetedquiz(studentid, c_id);
				
				mv.addObject("categories",courseCategories);
			}
			else if(filter.equals("complete"))
			{
				List<CourseCategory> courseCategories=studentService.attempetedquiz(studentid, c_id);
				
				mv.addObject("categories",courseCategories);
			}
			mv.addObject("c_id",c_id);
			mv.addObject("sid", studentid);
			mv.addObject("filter", filter);
			session.setAttribute("c_id",c_id);
			score=0;
			i=0;
			return mv;
		}
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("/attemptquiz")
	public ModelAndView displayquiz(HttpServletRequest request,@RequestParam("cat_id")int cat_id)
	{
		
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		int studentid=(int) session.getAttribute("studentid");
		ModelAndView mv=new ModelAndView();
		if(suname!=null)
		{
			mv.setViewName("displayquiz");
			questions=studentService.viewquizquestions(cat_id);
			n=questions.size();
			session.setAttribute("cat_id", cat_id);
			mv.addObject("question", questions.get(i));
			mv.addObject("i", i+1);
			mv.addObject("n", n);
			return mv;
		}
		mv.setViewName("index");
		return mv;
	}
	@PostMapping("/nextquestion")
	public String nextquestion(HttpServletRequest request)
	{
		
		HttpSession session=request.getSession();
		String answer=request.getParameter("option");
		if(questions.get(i).getAnswer().equals(answer))
		{
			score++;
		}
		System.out.println(score +" " +questions.get(i).getAnswer());
		int cat_id=(int) session.getAttribute("cat_id");
		i++;
		if(i<n)
		{
			return "redirect:attemptquiz?cat_id="+cat_id;
		}
		return "redirect:submitquiz?cat_id="+cat_id;
	}
	@GetMapping("submitquiz")
	public String submitquiz(HttpServletRequest request,@RequestParam("cat_id")int cat_id)
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		int studentid=(int) session.getAttribute("studentid");
		if(suname!=null)
		{
			String c_id=(String) session.getAttribute("c_id");
			QuizResult quizResult=new QuizResult();
			QuizResult result=studentService.displayQuizResult(studentid, cat_id, c_id);
			if(result!=null)
			{
				if(score*10>result.getScored())
				{
					studentService.updateResult(score*10, cat_id, studentid);
				}
				
			}
			else
			{
				quizResult.setScored(score*10);
				quizResult.setStudent_id(studentid);
				quizResult.setTotalscore(n*10);
				quizResult.setCategory_id(cat_id);
				quizResult.setCourse_id(c_id);
				studentService.storeresult(quizResult);
			}
			
			return "redirect:viewquizscore?cat_id="+cat_id+"&c_id="+c_id;
		}
		return "/";
	}
	@GetMapping("/viewquizscore")
	public ModelAndView viewquizscore(HttpServletRequest request,@RequestParam("cat_id")int cat_id,@RequestParam("c_id")String c_id)
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		int studentid=(int) session.getAttribute("studentid");
		ModelAndView mv=new ModelAndView();
		if(suname!=null)
		{
			mv.setViewName("result");
			QuizResult result=studentService.displayQuizResult(studentid, cat_id, c_id);
			mv.addObject("score", result.getScored());
			mv.addObject("totalscore", result.getTotalscore());
			mv.addObject("c_id", c_id);
			int percentage=result.getScored()*100/result.getTotalscore();
			mv.addObject("percentage", percentage);
			return mv;
		}
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("studentenquiry")
	public ModelAndView enquiry(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		int studentid=(int) session.getAttribute("studentid");
		if(suname!=null)
		{
			ModelAndView mv=new ModelAndView("contactus","enquiry",new Enquiry());
			mv.addObject("suname", suname);
			mv.addObject("sid", studentid);
			return mv;
		}
		ModelAndView mv=new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	@PostMapping("addquery")
	public String addquery(HttpServletRequest request,@ModelAttribute("enquiry")Enquiry enquiry)
	{
		studentService.addquery(enquiry);
		return "redirect:studentenquiry";
	}
	
	
	
}
