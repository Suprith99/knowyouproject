package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Question;

@Repository
public interface QuestionRepository extends CrudRepository<Question, Integer>
{
	@Query("from Question q where category_id=?1")
	public List<Question> viewquestionsbysid(int cat_id);
}
