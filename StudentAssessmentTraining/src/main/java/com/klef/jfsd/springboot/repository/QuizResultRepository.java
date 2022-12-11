package com.klef.jfsd.springboot.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.QuizResult;

@Repository
public interface QuizResultRepository extends CrudRepository<QuizResult, Integer>
{
	@Query("select r from QuizResult r where r.student_id=?1 and r.category_id=?2 and r.course_id=?3")
	public QuizResult displayquizresult(int s_id,int cat_id,String course_id);
	
	
	@Transactional
	@Modifying
	@Query("update QuizResult r set r.scored=?1 where category_id=?2 and student_id=?3")
	public int updateScore(int score,int cat_id,int student_id);
}
