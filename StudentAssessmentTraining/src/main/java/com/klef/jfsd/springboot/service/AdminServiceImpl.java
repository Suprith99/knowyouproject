package com.klef.jfsd.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.AssignMentor;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.EmailDetails;
import com.klef.jfsd.springboot.model.FacultyMentor;
import com.klef.jfsd.springboot.model.Material;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Trainer;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.AssignMentorRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.FacultyMentorRepository;
import com.klef.jfsd.springboot.repository.MaterialRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;
import com.klef.jfsd.springboot.repository.TrainerRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired 
	private JavaMailSender javaMailSender;

	@Value("${spring.mail.username}") 
	private String sender;

	
	
	@Autowired
	private AdminRepository adminRepository;
	
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private FacultyMentorRepository facultyMentorRepository;
	
	@Autowired
	private TrainerRepository trainerRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private AssignMentorRepository assignMentorRepository;

	@Override
	public Admin checkAdminLogin(String uname, String pwd) 
	{
		Admin m=new Admin();
		m=adminRepository.checkAdminLogin(uname, pwd);
		return m;
	}
	
	@Override
	public Student addStudent(Student student) 
	{
		return studentRepository.save(student);
	}

	@Override
	public List<Student> viewstudents() 
	{
		return (List<Student>) studentRepository.findAll();
	}

	@Override
	public FacultyMentor addFacultyMentor(FacultyMentor facultyMentor) 
	{		
		return facultyMentorRepository.save(facultyMentor);
	}

	@Override
	public List<FacultyMentor> viewFacultyMentor() 
	{
		return (List<FacultyMentor>)facultyMentorRepository.findAll();
	}

	@Override
	public Trainer addTrainer(Trainer trainer)
	{		
		return trainerRepository.save(trainer);
	}

	@Override
	public List<Trainer> viewTrainers() 
	{	
		return (List<Trainer>) trainerRepository.findAll();
	}

	@Override
	public HashMap<String, Long> counts() {
		HashMap<String, Long> mp=new HashMap<String,Long>();
		mp.put("sc", studentRepository.count());
		mp.put("tc", trainerRepository.count());
		mp.put("fc", facultyMentorRepository.count());
		return mp;
	}

	@Override
	public Course addCourse(Course course) 
	{
		return courseRepository.save(course);
	}

	@Override
	public List<Course> viewCourses() 
	{
		return (List<Course>) courseRepository.findAll();
	}

	@Override
	public String sendSimpleMail(EmailDetails details) 
	{
		try {

			// Creating a simple mail message
			SimpleMailMessage mailMessage
				= new SimpleMailMessage();

			// Setting up necessary details
			mailMessage.setFrom(sender);
			mailMessage.setTo(details.getRecipient());
			mailMessage.setText(details.getMsgBody());
			mailMessage.setSubject(details.getSubject());

			// Sending the mail
			javaMailSender.send(mailMessage);
			return "Mail Sent Successfully...";
		}

		// Catch block to handle the exceptions
		catch (Exception e) {
			return "Error while Sending Mail";
		}
	}

	@Override
	public AssignMentor assignMentor(AssignMentor mentor)
	{
		return assignMentorRepository.save(mentor);
	}

	@Override
	public void DeleteStudent(int id) {
		// TODO Auto-generated method stub
		studentRepository.deleteById(id);
	}

	@Override
	public void deleteMentor(int id) {
		facultyMentorRepository.deleteById(id);
		
	}

	@Override
	public void deleteTrainer(int id) {
		trainerRepository.deleteById(id);
		
	}

	@Override
	public int updatementor(String f_id, int s_id) {
		
		return studentRepository.updatementor(f_id, s_id);
	}

	@Override
	public FacultyMentor viewmentorbyid(int id) {
		
		return facultyMentorRepository.findById(id).get();
	}

	@Override
	public int updateStudentCount(int id) {
		// TODO Auto-generated method stub
		return facultyMentorRepository.updatestudentcount(id);
	}

	@Override
	public int updatementortonull(String facultymentor) {
		// TODO Auto-generated method stub
		return studentRepository.updatementortonull(facultymentor);
	}

	

	
	
}
