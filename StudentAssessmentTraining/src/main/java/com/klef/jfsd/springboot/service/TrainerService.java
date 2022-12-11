package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.CourseCategory;
import com.klef.jfsd.springboot.model.Material;
import com.klef.jfsd.springboot.model.Question;
import com.klef.jfsd.springboot.model.Schedule;
import com.klef.jfsd.springboot.model.Trainer;

public interface TrainerService 
{
	public Trainer checklogin(String uname,String pwd);
	public List<Course> viewcourses(String c_trainer);
	public Schedule addSchedule(Schedule schedule);
	public List<Schedule> viewSchedules();
	public List<Schedule> viewSchedulesByCId(String c_id);
	public int changePassword(String pwd,String uname,String oldpwd);
	public Schedule viewScheduleById(int id);
	public Trainer findtrainer(String uname);
	
	public Question addQuestion(Question question);
	public Material addMaterial(Material material);
	public List<Material> viewallmaterials(String c_id);
	
	public CourseCategory addcoursecategort(CourseCategory courseCategory);
	
	public List<CourseCategory> viewcoursecategories(String c_id);
}
