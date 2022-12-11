package com.klef.jfsd.springboot.repository;

import java.sql.Blob;
import java.util.List;

import javax.transaction.Transactional;


import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Student;

@Repository
public interface StudentRepository extends CrudRepository<Student, Integer>
{
	@Query("select s from Student s where username=?1 and password=?2")
	public Student checklogin(String uname,String pwd);
	
	@Query("select s from Student s where username=?1")
	public Student finduser(String uname);
	
	@Transactional
	@Modifying
	@Query("update Student s set s.password=?1 where s.username=?2 and s.password=?3")
	public int updatepassword(String password,String username,String oldpwd);
	
	@Transactional
	@Modifying
	@Query("update Student s set s.facultymentor=?1 where s.id=?2")
	public int updatementor(String f_id,int s_id);
	
	@Transactional
	@Modifying
	@Query("update Student s set s.facultymentor='null' where s.facultymentor=?1")
	public int updatementortonull(String facultymentor);
	
	
	@Transactional
	@Modifying
	@Query("update Student s set s.profileimage=?1 where s.id=?2")
	public int updateprofileimage(Blob b,int id);
	
	@Query("from Student s where s.facultymentor=?1")
	public List<Student> viewstudentsforfaculty(String facultymentor);
}
