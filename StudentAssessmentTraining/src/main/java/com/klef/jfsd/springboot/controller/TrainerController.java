package com.klef.jfsd.springboot.controller;

import java.io.IOException;


import java.sql.Blob;
import java.util.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.http.MediaType;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.CourseCategory;
import com.klef.jfsd.springboot.model.Material;
import com.klef.jfsd.springboot.model.Question;
import com.klef.jfsd.springboot.model.Schedule;

import com.klef.jfsd.springboot.service.TrainerService;

@Controller
public class TrainerController 
{
	static String tuname;
	
	
	@Autowired
	private TrainerService trainerService;
	static ModelAndView indexpage=new ModelAndView("index");
	@GetMapping("/trainerhome")
	public ModelAndView trainerhome()
	{
		
		if(tuname!=null)
		{
			ModelAndView mv=new ModelAndView("trainerhome");
			return mv;
		}
		return indexpage;
	}
	
	@GetMapping("/viewcourses")
	public ModelAndView viewcourses(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		tuname=(String) session.getAttribute("tuname");
		if(tuname!=null)
		{
			List<Course> courses=trainerService.viewcourses(tuname);
			for(Course c:courses)
			{
				System.out.println(c);
			}
			ModelAndView mv=new ModelAndView("courses","schedule",new Schedule());
			mv.addObject("tuname", tuname);
			mv.addObject("courses", courses);
			return mv;
		}
		return indexpage;
	}
	@PostMapping("/addschedule")
	public String addschedule(HttpServletRequest request,@ModelAttribute("schedule")Schedule schedule,@RequestParam("poster") MultipartFile file) throws IOException, SerialException, SQLException, ParseException
	{
	
		
		if(tuname!=null)
		{
			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			schedule.setScheduleposter(blob);
			
			
			SimpleDateFormat in=new SimpleDateFormat("yyyy-MM-dd");
			String parameter=request.getParameter("startDate");
			System.out.println("Date: "+parameter);
			Date date=in.parse(parameter);
			System.out.println("Date: "+date);
			schedule.setStartDate(date);
			
			String parameter2=request.getParameter("endDate");
			Date endDate=in.parse(parameter2);
			schedule.setEndDate(endDate);
			trainerService.addSchedule(schedule);
			return "redirect:viewcourses";
		}
		return "redirect:/";
	}
	@GetMapping("/viewschedules")
	public ModelAndView viewschedules(@RequestParam("c_id")String c_id,@RequestParam("c_name")String c_name)
	{
		if(tuname!=null)
		{
			List<Schedule> schedules=trainerService.viewSchedulesByCId(c_id);
			ModelAndView mv=new ModelAndView();
			mv.setViewName("viewschedules");
			mv.addObject("schedules", schedules);
			mv.addObject("c_name", c_name);
			return mv;
		}
		return indexpage;
	}
	@GetMapping("/displayscheduleposter")
	public ResponseEntity<byte[]> displayscheduleposter(@RequestParam("s_id") int s_id) throws IOException, SQLException
	{
	  Schedule schedule=trainerService.viewScheduleById(s_id);
	  byte [] imageBytes = null;
	  imageBytes = schedule.getScheduleposter().getBytes(1,(int)schedule.getScheduleposter().length());

	  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}
	@GetMapping("/changetrainerpwdpage")
	public ModelAndView changetrainerpwdpage(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String tuname=(String) session.getAttribute("tuname");
		
		if(tuname!=null)
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("changetrainerpwd");
			mv.addObject("tuname", tuname);
			return mv;
		}
		return indexpage;
	}
	
	
	@GetMapping("/regmaterial")
	public ModelAndView regmaterial(HttpServletRequest request,@RequestParam("c_id")String c_id,@RequestParam("c_name")String c_name)
	{
		HttpSession session=request.getSession();
		String tuname=(String) session.getAttribute("tuname");
		
		if(tuname!=null)
		{
			ModelAndView mv=new ModelAndView("addmaterials","material",new Material());
			mv.addObject("c_id",c_id);
			mv.addObject("c_name", c_name);
			return mv;
		}
		ModelAndView mv=new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	@PostMapping("/addmaterial")
	public String addmaterial(HttpServletRequest request,@ModelAttribute("material")Material material)
	{
		HttpSession session=request.getSession();
		String tuname=(String) session.getAttribute("tuname");
		if(tuname!=null)
		{
			trainerService.addMaterial(material);
			return "redirect:viewcourses";
		}
		return "redirect:/";
	}
	@GetMapping("/viewmaterialsbycourse")
	public ModelAndView viewmaterialbycourse(HttpServletRequest request,@RequestParam("c_id")String c_id)
	{
		HttpSession session=request.getSession();
		String tuname=(String) session.getAttribute("tuname");
		ModelAndView mv=new ModelAndView();
		if(tuname!=null)
		{
			mv.setViewName("viewmaterialsbytrainer");
			List<Material> materials=trainerService.viewallmaterials(c_id);
			mv.addObject("materials", materials);
			return mv;
		}
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("/addquiz")
	public ModelAndView addquiz(HttpServletRequest request,@RequestParam("c_id")String c_id)
	{
		HttpSession session=request.getSession();
		String tuname=(String) session.getAttribute("tuname");
		
		if(tuname!=null)
		{
			ModelAndView mv=new ModelAndView("addquiz","category",new CourseCategory());
			mv.addObject("c_id", c_id);
			return mv;
		}
		ModelAndView mv=new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	@PostMapping("/addquizcategory")
	public String addquizcat(HttpServletRequest request,@ModelAttribute("category")CourseCategory category)
	{
		HttpSession session=request.getSession();
		String tuname=(String) session.getAttribute("tuname");
		
		if(tuname!=null)
		{
			trainerService.addcoursecategort(category);
			return "redirect:addquiz?c_id="+category.getC_id();
		}
		return "redirect:/";
	}
	@GetMapping("/viewquiz")
	public ModelAndView viewquiz(HttpServletRequest request,@RequestParam("c_id")String c_id)
	{
		HttpSession session=request.getSession();
		String tuname=(String) session.getAttribute("tuname");
		ModelAndView mv=new ModelAndView();
		if(tuname!=null)
		{
			List<CourseCategory> categories=trainerService.viewcoursecategories(c_id);
			mv.setViewName("viewquiz");
			mv.addObject("categories", categories);
			mv.addObject("c_id", c_id);
			return mv;
		}
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("/addquizquestion")
	public ModelAndView addquizquestion(HttpServletRequest request,@RequestParam("c_id")String c_id,@RequestParam("cat_id")int cat_id)
	{
		HttpSession session=request.getSession();
		String tuname=(String) session.getAttribute("tuname");
		
		if(tuname!=null)
		{
			ModelAndView mv=new ModelAndView("addquizquestion","question",new Question());
			mv.addObject("cat_id", cat_id);
			mv.addObject("c_id", c_id);
			return mv;
		}
		ModelAndView mv=new ModelAndView("index");
		
		return mv;
	}
	@PostMapping("/addquizquestionbytrainer")
	public String addquizquestionbytrainer(HttpServletRequest request,@ModelAttribute("question")Question question)
	{
		HttpSession session=request.getSession();
		String tuname=(String) session.getAttribute("tuname");
		
		if(tuname!=null)
		{
			trainerService.addQuestion(question);
			return "redirect:addquizquestion?c_id="+question.getC_id()+"&cat_id="+question.getCategory_id();
			
		}
		return "redirect:/";
		
	}
	
}
