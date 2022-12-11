package com.klef.jfsd.springboot.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="coursecategory_table")

@Data
public class CourseCategory 
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "categoryid_generator")
	@SequenceGenerator(name = "categoryid_generator",initialValue = 1,allocationSize = 1,sequenceName = "categoryid_sequence")
	private int id;
	private String title;
	private String description;
	private String c_id;
}
