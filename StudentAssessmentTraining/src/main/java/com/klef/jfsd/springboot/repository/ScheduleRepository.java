package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.scheduling.annotation.Schedules;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Schedule;

@Repository
public interface ScheduleRepository extends CrudRepository<Schedule, Integer>
{
	@Query("from Schedule s where s.c_id=?1")
	public List<Schedule> viewschdulebycId(String c_id);
}
