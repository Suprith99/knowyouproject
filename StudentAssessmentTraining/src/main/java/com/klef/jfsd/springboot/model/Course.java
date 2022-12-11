package com.klef.jfsd.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="course_table")

@Data
public class Course 
{
	@Id
	private String c_id;
	@Column(length = 100,nullable = false,unique = true)
	private String c_name;
	@Column(length = 1000,nullable = false)
	private String c_description;
	@Column(length = 100,nullable = false)
	private String c_trainer;
	@Column(length = 100,nullable = false)
	private String difficulty;
}
