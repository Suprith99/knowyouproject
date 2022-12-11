package com.klef.jfsd.springboot.service;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.CourseCategory;
import com.klef.jfsd.springboot.model.Enquiry;
import com.klef.jfsd.springboot.model.Material;
import com.klef.jfsd.springboot.model.MaterialStatus;
import com.klef.jfsd.springboot.model.Question;
import com.klef.jfsd.springboot.model.QuizResult;
import com.klef.jfsd.springboot.model.Registration;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.CourseCategoryRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.EnquiryRepository;
import com.klef.jfsd.springboot.repository.MaterialRepository;
import com.klef.jfsd.springboot.repository.MaterialStatusRepository;
import com.klef.jfsd.springboot.repository.QuestionRepository;
import com.klef.jfsd.springboot.repository.QuizResultRepository;
import com.klef.jfsd.springboot.repository.RegistrationRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private CourseRepository courseRepository;
	@Autowired
	private RegistrationRepository registrationRepository;
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private QuizResultRepository quizResultRepository;
	
	@Autowired
	private MaterialStatusRepository statusRepository;
	
	@Autowired
	private MaterialRepository materialRepository;
	
	@Autowired
	private CourseCategoryRepository categoryRepository;
	
	@Autowired
	private EnquiryRepository enquiryRepository;
	
	@Override
	public Student checklogin(String uname, String pwd) {
		
		return studentRepository.checklogin(uname, pwd);
	}
	@Override
	public List<Course> viewcourses() 
	{
		
		return (List<Course>) courseRepository.findAll();
	}
	@Override
	public Registration registercourse(Registration registration) 
	{
		
		return registrationRepository.save(registration);
	}
	@Override
	public List<Course> viewregisterecourses(String s_uname) 
	{
		return courseRepository.viewregisteredcoursesbystudent(s_uname);
	}
	@Override
	public List<Course> viewunregisterecourses(String s_uname) 
	{
		
		return courseRepository.viewunregisteredcoursesbystudent(s_uname);
	}
	@Override
	public int changePassword(String pwd, String uname,String oldpwd)
	{
		
		return studentRepository.updatepassword(pwd, uname,oldpwd);
	}
	@Override
	public Student finduser(String uname) {
		// TODO Auto-generated method stub
		return studentRepository.finduser(uname);
	}
	
	@Override
	public QuizResult storeresult(QuizResult quizResult) 
	{
		
		return quizResultRepository.save(quizResult);
	}

	@Override
	public Student viewstudentbyid(int student_id)
	{
		// TODO Auto-generated method stub
		return studentRepository.findById(student_id).get();
	}
	@Override
	public int changeprofilepic(Blob b, int id) {
		// TODO Auto-generated method stub
		return studentRepository.updateprofileimage(b, id);
	}
	@Override
	public List<Question> viewquizquestions(int cat_id) {
		// TODO Auto-generated method stub
		return questionRepository.viewquestionsbysid(cat_id);
	}
	@Override
	public MaterialStatus addMaterialStatus(MaterialStatus status) {
		// TODO Auto-generated method stub
		return statusRepository.save(status);
	}
	@Override
	public List<Material> completedMaterials(String c_id,int s_id) {
		// TODO Auto-generated method stub
		return materialRepository.completedmaterials(c_id,s_id);
	}
	@Override
	public List<Material> incompleteMaterials(String c_id,int s_id) {
		// TODO Auto-generated method stub
		return materialRepository.incompletedmaterials(c_id,s_id);
	}
	@Override
	public List<CourseCategory> unattempetedquiz(int s_id, String c_id) {
		// TODO Auto-generated method stub
		return categoryRepository.viewallunattempetedcoursecategories(s_id, c_id);
	}
	@Override
	public List<CourseCategory> attempetedquiz(int s_id, String c_id) {
		
		return categoryRepository.viewallattempetedcoursecategories(s_id, c_id);
	}
	@Override
	public QuizResult displayQuizResult(int s_id, int cat_id, String c_id) {
		// TODO Auto-generated method stub
		return quizResultRepository.displayquizresult(s_id, cat_id, c_id);
	}
	@Override
	public int updateResult(int score, int cat_id, int student_id) {
		// TODO Auto-generated method stub
		return quizResultRepository.updateScore(score, cat_id, student_id);
	}
	@Override
	public Enquiry addquery(Enquiry enquiry) {
		// TODO Auto-generated method stub
		return enquiryRepository.save(enquiry);
	}

	

	
	
}
