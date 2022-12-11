package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Schedules;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.CourseCategory;
import com.klef.jfsd.springboot.model.Material;
import com.klef.jfsd.springboot.model.Question;
import com.klef.jfsd.springboot.model.Schedule;
import com.klef.jfsd.springboot.model.Trainer;
import com.klef.jfsd.springboot.repository.CourseCategoryRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.MaterialRepository;
import com.klef.jfsd.springboot.repository.QuestionRepository;
import com.klef.jfsd.springboot.repository.ScheduleRepository;
import com.klef.jfsd.springboot.repository.TrainerRepository;

@Service
public class TrainerServiceImpl implements TrainerService
{
	@Autowired
	private TrainerRepository trainerRepository;
	
	@Autowired
	private ScheduleRepository scheduleRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Autowired
	private CourseCategoryRepository courseCategoryRepository;
	

	@Autowired
	private MaterialRepository materialRepository;
	
	@Override
	public Trainer checklogin(String uname, String pwd) 
	{
		return trainerRepository.checklogin(uname, pwd);
	}
	@Override
	public List<Course> viewcourses(String c_trainer) 
	{
		
		return courseRepository.viewcourses(c_trainer);
	}
	@Override
	public Schedule addSchedule(Schedule schedule) 
	{
		return scheduleRepository.save(schedule);
	}
	@Override
	public List<Schedule> viewSchedules() 
	{
		
		return (List<Schedule>) scheduleRepository.findAll();
	}
	@Override
	public Schedule viewScheduleById(int id) 
	{
		
		return scheduleRepository.findById(id).get();
	}
	@Override
	public List<Schedule> viewSchedulesByCId(String c_id) 
	{
		return scheduleRepository.viewschdulebycId(c_id);
	}
	@Override
	public int changePassword(String pwd, String uname,String oldpwd)
	{
		
		return trainerRepository.updatepassword(pwd, uname,oldpwd);
	}
	@Override
	public Trainer findtrainer(String uname) 
	{
		return trainerRepository.checkuser(uname);
	}
	@Override
	public Question addQuestion(Question question)
	{
		
		return questionRepository.save(question);
	}
	@Override
	public Material addMaterial(Material material) {
		// TODO Auto-generated method stub
		return materialRepository.save(material);
	}
	@Override
	public List<Material> viewallmaterials(String c_id) {
		// TODO Auto-generated method stub
		return materialRepository.viewmaterials(c_id);
	}
	@Override
	public CourseCategory addcoursecategort(CourseCategory courseCategory) {
		// TODO Auto-generated method stub
		return courseCategoryRepository.save(courseCategory);
	}
	@Override
	public List<CourseCategory> viewcoursecategories(String c_id) {
		// TODO Auto-generated method stub
		return courseCategoryRepository.viewallcoursecategories(c_id);
	}
}
