package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.CourseCategory;

@Repository
public interface CourseCategoryRepository extends CrudRepository<CourseCategory, Integer>
{
	@Query("from CourseCategory c where c.c_id=?1")
	public List<CourseCategory> viewallcoursecategories(String c_id);
	
	@Query("from CourseCategory c where c.id in (select category_id from QuizResult q where q.student_id=?1 and course_id=?2)")
	public List<CourseCategory> viewallattempetedcoursecategories(int s_id,String c_id);
	@Query("from CourseCategory c where c.id not in (select category_id from QuizResult q where q.student_id=?1 and course_id=?2)")
	public List<CourseCategory> viewallunattempetedcoursecategories(int s_id,String c_id);
}
