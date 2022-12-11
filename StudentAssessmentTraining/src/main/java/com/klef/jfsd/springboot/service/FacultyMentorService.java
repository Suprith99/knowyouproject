package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.FacultyMentor;
import com.klef.jfsd.springboot.model.Student;

public interface FacultyMentorService 
{
	public int updatePassword(String newpwd,String username,String oldpwd);
	public FacultyMentor checkuser(String username,String pwd);
	public List<Student> viewstudenysbyfaculty(String facultyname);
}
