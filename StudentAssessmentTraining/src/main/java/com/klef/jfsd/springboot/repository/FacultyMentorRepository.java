package com.klef.jfsd.springboot.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.FacultyMentor;

@Repository
public interface FacultyMentorRepository extends CrudRepository<FacultyMentor, Integer>
{
	@Query("select f from FacultyMentor f where username=?1 and password=?2")
	public FacultyMentor checkuser(String uname,String pwd);
	
	
	@Transactional
	@Modifying
	@Query("update FacultyMentor f set f.studentsAssignedCount=(select count(*) from AssignMentor m where m.faculty_id=?1) where f.id=?1")
	public int updatestudentcount(int id);
	
	
	@Transactional
	@Modifying
	@Query("update FacultyMentor t set t.password=?1 where t.username=?2 and t.password=?3")
	public int updatepassword(String password,String username,String oldpwd);

	
}
