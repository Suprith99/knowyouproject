package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.MaterialStatus;

@Repository
public interface MaterialStatusRepository extends CrudRepository<MaterialStatus, Integer>
{
	@Query("select material_id from MaterialStatus ms where ms.course_id=?1 and ms.student_id=?2")
	public List viewcompletedmaterialscount(String course_id,int student_id);
}
