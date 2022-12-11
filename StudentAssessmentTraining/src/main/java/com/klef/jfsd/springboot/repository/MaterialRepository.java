package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Material;

@Repository
public interface MaterialRepository extends CrudRepository<Material, Integer>
{
	@Query("from Material m where m.c_id=?1")
	public List<Material> viewmaterials(String c_id);
	
	@Query("from Material m where m.id in (select material_id from MaterialStatus ms where ms.course_id=?1 and ms.student_id=?2)")
	public List<Material> completedmaterials(String c_id,int s_id);
	
	@Query("from Material m where m.id not in (select material_id from MaterialStatus ms where ms.course_id=?1 and ms.student_id=?2)")
	public List<Material> incompletedmaterials(String c_id,int s_id);
}
