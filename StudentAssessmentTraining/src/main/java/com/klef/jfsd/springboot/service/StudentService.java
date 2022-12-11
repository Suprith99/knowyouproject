package com.klef.jfsd.springboot.service;

import java.sql.Blob;
import java.util.List;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.CourseCategory;
import com.klef.jfsd.springboot.model.Enquiry;
import com.klef.jfsd.springboot.model.Material;
import com.klef.jfsd.springboot.model.MaterialStatus;
import com.klef.jfsd.springboot.model.Question;
import com.klef.jfsd.springboot.model.QuizResult;
import com.klef.jfsd.springboot.model.Registration;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.MaterialRepository;

public interface StudentService 
{
	public Student checklogin(String uname,String pwd);
	public List<Course> viewcourses();
	public Registration registercourse(Registration registration);
	public List<Course> viewregisterecourses(String s_uname);
	public int changePassword(String pwd,String uname,String oldpwd);
	public List<Course> viewunregisterecourses(String s_uname);
	public Student finduser(String uname);
	public List<Question> viewquizquestions(int cat_id);
	public QuizResult storeresult(QuizResult quizResult);
	public Student viewstudentbyid(int student_id);
	public int changeprofilepic(Blob b,int id);
	public MaterialStatus addMaterialStatus(MaterialStatus status);
	public List<Material> completedMaterials(String c_id,int s_id);
	public List<Material> incompleteMaterials(String c_id,int s_id);
	
	public List<CourseCategory> unattempetedquiz(int s_id,String c_id);
	public List<CourseCategory> attempetedquiz(int s_id,String c_id);
	
	public QuizResult displayQuizResult(int s_id,int cat_id,String c_id);
	public int updateResult(int score,int cat_id,int student_id);
	
	public Enquiry addquery(Enquiry enquiry);
}
