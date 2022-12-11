package com.klef.jfsd.springboot.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Trainer;

@Repository
public interface TrainerRepository extends CrudRepository<Trainer, Integer>
{
	@Query("select t from Trainer t where username=?1 and password=?2")
	public Trainer checklogin(String username,String password);
	@Query("select t from Trainer t where username=?1")
	public Trainer checkuser(String username);
	
	@Transactional
	@Modifying
	@Query("update Trainer t set t.password=?1 where t.username=?2 and t.password=?3")
	public int updatepassword(String password,String username,String oldpwd);
}
