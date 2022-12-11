package com.klef.jfsd.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="materialstatus")

@Data
public class MaterialStatus 
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "materialstatusid_generator")
	@SequenceGenerator(name = "materialstatusid_generator",initialValue = 1000,allocationSize = 1,sequenceName = "materialstatusid_sequence")
	private int id;
	@Column(nullable = false)
	private String course_id;
	@Column(nullable = false)
	private int material_id;
	@Column(nullable = false)
	private int student_id;
}
