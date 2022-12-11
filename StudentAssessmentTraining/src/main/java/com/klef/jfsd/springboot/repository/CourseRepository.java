package com.klef.jfsd.springboot.repository;

import java.util.List;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Course;


@Repository
public interface CourseRepository extends CrudRepository<Course, String>
{
	@Query("from Course where c_trainer=?1")
	public List<Course> viewcourses(String c_trainer);
	
	@Query("from Course where c_id IN (select c_id from Registration r where s_uname=?1)")
	public List<Course> viewregisteredcoursesbystudent(String uname);
	
	@Query("from Course where c_id NOT IN (select c_id from Registration r where s_uname=?1)")
	public List<Course> viewunregisteredcoursesbystudent(String uname);
	
	
}
