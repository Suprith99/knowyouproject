package com.klef.jfsd.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "assignmentor_table")

@Data
public class AssignMentor 
{
	@Id
	private int student_id;
	@Column(nullable = false)
	private int faculty_id;
}
