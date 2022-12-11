package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.FacultyMentor;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.FacultyMentorRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class FacultyMentorServiceImpl implements FacultyMentorService
{
	@Autowired
	private FacultyMentorRepository facultyMentorRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	@Override
	public int updatePassword(String newpwd, String username, String oldpwd) {
		// TODO Auto-generated method stub
		return facultyMentorRepository.updatepassword(newpwd, username, oldpwd);
	}
	@Override
	public FacultyMentor checkuser(String username, String pwd) {
		// TODO Auto-generated method stub
		return facultyMentorRepository.checkuser(username,pwd);
	}
	@Override
	public List<Student> viewstudenysbyfaculty(String facultyname) {
		// TODO Auto-generated method stub
		return studentRepository.viewstudentsforfaculty(facultyname);
	}

}
