package com.klef.jfsd.springboot.controller;

import java.io.IOException;


import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.AssignMentor;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.EmailDetails;
import com.klef.jfsd.springboot.model.FacultyMentor;
import com.klef.jfsd.springboot.model.Material;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Trainer;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.FacultyMentorService;
import com.klef.jfsd.springboot.service.StudentService;
import com.klef.jfsd.springboot.service.TrainerService;

@Controller
public class ClientController 
{
	
	
	@Autowired
	public  AdminService adminService;
	
	@Autowired
	private TrainerService trainerService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private FacultyMentorService mentorService;
	
	
	//to store admin username as a global value so to use multiple times
	static String adminuname;
	
	//to redirect to login page everytime u try to skip login process
	static ModelAndView indexpage=new ModelAndView("index");
	
	//to count the avaibale records in map
	static HashMap<String, Long> mp;
	
	static List<Student> students;
	
	static List<FacultyMentor> facultyMentors;
	
	static List<Trainer> trainers;
	static List<Course> courses;
	
	
	@GetMapping("/")
	public ModelAndView index()
	{
		
		return indexpage;
	}
	
	@PostMapping("/forgotpassword")
	public String forgotpassword(HttpServletRequest request)
	{
		String status=request.getParameter("status");
		String username=request.getParameter("username");
		if(status.equals("trainer"))
		{
			Trainer trainer=trainerService.findtrainer(username);
			String msg="Hello Mr/Mrs "+trainer.getName()+"\nPlease go through the mail and proced future.\n" +"Your password to login is "+trainer.getPassword() +".\nOnce logged in change your password for security purpose";
			EmailDetails details=new EmailDetails();
			details.setRecipient(trainer.getEmail());
			details.setSubject("Forget Password!!....");
			details.setMsgBody(msg);
			adminService.sendSimpleMail(details);
		}
		else if(status.equals("student"))
		{
			Student student=studentService.finduser(username);
			String msg="Hello Mr/Mrs "+student.getName()+"\nPlease go through the mail and proced future" +"Your password to login is "+student.getPassword() +".\nOnce logged in change your password for security purpose";
			EmailDetails details=new EmailDetails();
			details.setRecipient(student.getEmail());
			details.setSubject("Forget Password!!....");
			details.setMsgBody(msg);
			adminService.sendSimpleMail(details);
		}
		else if(status.equals("faculty"))
		{
			
		}
		return "redirect:/";
	}
	@PostMapping("/checklogin")
	public ModelAndView checklogin(HttpServletRequest request)
	{
		
		String status=request.getParameter("status");
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		HttpSession session=request.getSession();
		if(status.equals("admin"))
		{
			ModelAndView mv=new ModelAndView();
			Admin m;
			m=adminService.checkAdminLogin(uname, pwd);
			if(m!=null)
			{
				
				mv.setViewName("adminhome");
				mv.addObject("auname", uname);
				session.setAttribute("auname",uname);
				adminuname=uname;
				
				mp=adminService.counts();
				students=adminService.viewstudents();
				trainers=adminService.viewTrainers();
				facultyMentors=adminService.viewFacultyMentor();
				courses=adminService.viewCourses();
				mv.addObject("mp", mp);
				return mv;
			}			
		}
		else if(status.equals("trainer"))
		{
			Trainer t=trainerService.checklogin(uname, pwd);
			if(t!=null)
			{
				session.setAttribute("tuname", uname);
				ModelAndView mv=new ModelAndView();
				if(t.getPassword().equals("klu_trainer"))
				{
					mv.setViewName("changetrainerpwd");
					return mv;
				}
				mv.setViewName("trainerhome");
				mv.addObject("tuname", uname);
				return mv;
			}
		}
		else if(status.equals("student"))
		{
			Student s=studentService.checklogin(uname, pwd);
			if(s!=null)
			{
				session.setAttribute("suname", uname);
				session.setAttribute("studentid", s.getId());
				ModelAndView mv=new ModelAndView();
				if(s.getPassword().equals("klu"))
				{
					mv.setViewName("changestudentpwd");
					mv.addObject("suname", uname);
					mv.addObject("sid", s.getId());
					return mv;
				}
				
				mv.setViewName("studenthome");
				mv.addObject("suname", uname);
				mv.addObject("sid", s.getId());
				
				return mv;
			}
			else
			{
				ModelAndView mv=new ModelAndView("index");
				mv.addObject("msg", "Username or password is wrong");
				return mv;
			}
		}
		else if(status.equals("faculty"))
		{
			FacultyMentor f=mentorService.checkuser(uname, pwd);
			if(f!=null)
			{
				session.setAttribute("funame", uname);
				session.setAttribute("facultyid", f.getId());
				session.setAttribute("facultyname", f.getName());
				ModelAndView mv=new ModelAndView();
				if(f.getPassword().equals("klu_faculty"))
				{
					mv.setViewName("changefacultypwd");
					mv.addObject("funame", uname);
					return mv;
				}
				mv.setViewName("facultyhome");
				mv.addObject("funame", uname);
				mv.addObject("fid", f.getId());
				return mv;
			}
			else
			{
				ModelAndView mv=new ModelAndView("index");
				mv.addObject("msg", "Username or password is wrong");
				return mv;
			}
		}
		return indexpage;
	}
	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		adminuname=null;
		HttpSession session=request.getSession();
		session.invalidate();
		return indexpage;
	}
	@GetMapping("/adminhome")
	public ModelAndView adminhome()
	{
		if(adminuname==null)
		{	
			return indexpage;
		}
		ModelAndView mv=new ModelAndView("adminhome");
		mv.addObject("mp", mp);
		return mv;
	}
	@GetMapping("/studentdetails")
	public ModelAndView studentdetails()
	{
		if(adminuname==null)
		{	
			return indexpage;
		}
		ModelAndView mv=new ModelAndView("studentdetails","student",new Student());
		mv.addObject("auname",adminuname);		
		mv.addObject("students", students);
		mv.addObject("mp", mp);
		return mv;
	}
	@PostMapping("/addstudent")
	public String addstudent(@ModelAttribute("student")Student  student,@RequestParam("profilepic") MultipartFile file) throws IOException, SerialException, SQLException
	{
		
		byte[] bytes = file.getBytes();
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		student.setProfileimage(blob);
		Student student1=adminService.addStudent(student);
		students.add(student1);
		mp.put("sc", mp.get("sc")+1);
		String msg="To login to student assessment website please use the below credentials\nUsername: "+student.getUsername()+"\nPassword:"+student1.getPassword()+"\nLearn from it";
		EmailDetails emailDetails=new EmailDetails();
		emailDetails.setRecipient(student1.getEmail());
		emailDetails.setSubject("This Mail is regarding the creation of you new account for student assessment offical website");
		emailDetails.setMsgBody(msg);
		adminService.sendSimpleMail(emailDetails);
		  
		return "redirect:studentdetails";
	}
	@GetMapping("/facultymentordetails")
	public ModelAndView facultymentordetails() 
	{
		if(adminuname==null)
		{	
			return indexpage;
		}

		ModelAndView mv=new ModelAndView("facultymentordetails","faculty",new FacultyMentor());
		mv.addObject("auname",adminuname);
		mv.addObject("students",students);
		mv.addObject("facultymentors", facultyMentors);
		mv.addObject("mp", mp);
		return mv;
	}
	@PostMapping("/addfaculty")
	public String addfaculty(@ModelAttribute("faculty")FacultyMentor facultyMentor)
	{
		
		FacultyMentor mentor=adminService.addFacultyMentor(facultyMentor);
		facultyMentors.add(mentor);
		mp.put("fc", mp.get("fc")+1);
		return "redirect:facultymentordetails";
	}
	@GetMapping("/trainerdetails")
	public ModelAndView trainerdetails() 
	{
		if(adminuname==null)
		{	
			return indexpage;
		}

		ModelAndView mv=new ModelAndView("trainerdetails","trainer",new Trainer());
		mv.addObject("auname",adminuname);
		
		mv.addObject("trainers", trainers);
		mv.addObject("mp", mp);
		return mv;
	}
	@PostMapping("/addtrainer")
	public String addtrainer(@ModelAttribute("trainer")Trainer trainer,@RequestParam("profilepic") MultipartFile file) throws IOException, SerialException, SQLException
	{
		
		byte[] bytes = file.getBytes();
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		trainer.setProfileimage(blob);
		Trainer trainer1=adminService.addTrainer(trainer);
		mp.put("tc", mp.get("tc")+1);
		trainers.add(trainer1);
		return "redirect:trainerdetails";
	}
	
	@GetMapping("/coursedetails")
	public ModelAndView coursedetails(HttpServletRequest request)
	{
		if(adminuname==null)
		{	
			return indexpage;
		}
		ModelAndView mv=new ModelAndView("coursedetails","course",new Course());
		mv.addObject("auname",adminuname);
		mv.addObject("trainers", trainers);
		mv.addObject("courses", courses);
		mv.addObject("mp", mp);
		return mv;
	}
	@PostMapping("/addcourse")
	public String addcourse(@ModelAttribute("course")Course course)
	{
		Course course2=adminService.addCourse(course);
		courses.add(course2);
		return "redirect:coursedetails";
	}
	
	@PostMapping("/changestudentpwd")
	public ModelAndView changepwd(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("suname");
		String oldpwd=request.getParameter("oldpwd");
		String newpwd=request.getParameter("newpwd");
		ModelAndView mv=new ModelAndView();
		if(suname!=null)
		{
			mv.setViewName("studenthome");
			studentService.changePassword(newpwd,suname,oldpwd);
			mv.addObject("suname","suname");
			return mv;
		}
		return indexpage;
	}@PostMapping("/changetrainerpwd")
	public ModelAndView changetrainerpwd(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String tuname=(String) session.getAttribute("tuname");
		String oldpwd=request.getParameter("oldpwd");
		String newpwd=request.getParameter("newpwd");
		ModelAndView mv=new ModelAndView();
		if(tuname!=null)
		{
			mv.setViewName("trainerhome");
			trainerService.changePassword(newpwd, tuname, oldpwd);
			mv.addObject("tuname", tuname);
			return mv;
		}
		return indexpage;
	}
	@PostMapping("/changefacultypwd")
	public ModelAndView changefacultypwd(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String funame=(String) session.getAttribute("funame");
		String oldpwd=request.getParameter("oldpwd");
		String newpwd=request.getParameter("newpwd");
		ModelAndView mv=new ModelAndView();
		if(funame!=null)
		{
			mv.setViewName("trainerhome");
			mentorService.updatePassword(newpwd, funame, oldpwd);
			mv.addObject("funame", funame);
			return mv;
		}
		return indexpage;
	}

	
	@PostMapping("/assignmentor")
	public String assignmentor(HttpServletRequest request)
	{
		if(adminuname==null)
		{	
			return "redirect:/";
		}
		
		int s_id=Integer.parseInt(request.getParameter("s_id"));
		int f_id=Integer.parseInt(request.getParameter("f_id"));
		AssignMentor mentor=new AssignMentor();
		mentor.setStudent_id(s_id);
		mentor.setFaculty_id(f_id);
		FacultyMentor mentor2=adminService.viewmentorbyid(f_id);
		adminService.updatementor(mentor2.getName(), s_id);
		adminService.assignMentor(mentor);
		adminService.updateStudentCount(f_id);
		facultyMentors=adminService.viewFacultyMentor();
		return "redirect:facultymentordetails";
	}
	@GetMapping("/viewstudentprofilebyid")
	public ModelAndView viewprofileofstudent(HttpServletRequest request,@RequestParam("id")int id)
	{

			Student student=studentService.viewstudentbyid(id);
			ModelAndView mv=new ModelAndView("studentprofilebyadmin");
			mv.addObject("student", student);
			return mv;
	
	}
	@GetMapping("/deletestudentbyid")
	public String deletestudent(@RequestParam("id")int id)
	{
			adminService.DeleteStudent(id);
			students=adminService.viewstudents();
			return "redirect:studentdetails";
	
	}
	@GetMapping("/deletetrainerbyid")
	public String deletetrainer(@RequestParam("id")int id)
	{
			adminService.deleteTrainer(id);
			trainers=adminService.viewTrainers();
			return "redirect:studentdetails";
	
	}
	@GetMapping("/deletefacultybyid")
	public String deletementor(@RequestParam("id")int id)
	{
		FacultyMentor mentor=adminService.viewmentorbyid(id);
		students=adminService.viewstudents();
			adminService.updatementortonull(mentor.getName());
			adminService.deleteMentor(id);
			facultyMentors=adminService.viewFacultyMentor();
			return "redirect:studentdetails";
	
	}
	
	
	
}
