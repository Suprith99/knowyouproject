package com.klef.jfsd.springboot.service;

import java.util.HashMap;
import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.AssignMentor;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.EmailDetails;
import com.klef.jfsd.springboot.model.FacultyMentor;
import com.klef.jfsd.springboot.model.Material;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Trainer;

public interface AdminService 
{
	public Admin checkAdminLogin(String uname,String pwd);
	
	//student operations by admin
	public Student addStudent(Student student);
	public List<Student> viewstudents();
	public void DeleteStudent(int id);
	public int updatementor(String f_id,int s_id)
;	
	
	//faculty mentor operations by admin
	public FacultyMentor addFacultyMentor(FacultyMentor facultyMentor);
	public List<FacultyMentor> viewFacultyMentor();
	public void deleteMentor(int id);
	public FacultyMentor viewmentorbyid(int id);
	public int updateStudentCount(int id);
	
	//trainer operations by admin
	public Trainer addTrainer(Trainer trainer);
	public List<Trainer> viewTrainers();
	public void deleteTrainer(int id);
	
	//course operations by admin
	public Course addCourse(Course course);
	public List<Course> viewCourses();
	
	//method to count no of records in each module
	public HashMap<String,Long> counts(); 
	
	//email service
	public String sendSimpleMail(EmailDetails details);
	
	public AssignMentor assignMentor(AssignMentor mentor);
	
	public int updatementortonull(String facultymentor);
	
	
}
