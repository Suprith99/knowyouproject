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
@Table(name="facultymentor_table")

@Data
public class FacultyMentor 
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "facultyid_generator")
	@SequenceGenerator(name = "facultyid_generator",initialValue = 1000,allocationSize = 1,sequenceName = "facultyid_sequence")
	private int id;
	@Column(length = 100,nullable = false)
	private String name;
	@Column(length = 100,nullable = false)
	private String gender;
	@Column(length = 100,nullable = false)
	private String designation;
	@Column(length = 100,nullable = false)
	private int studentsAssignedCount;
	@Column(length = 100,nullable = false,unique = true)
	private String username;
	@Column(length = 100,nullable = false)
	private String department;
	@Column(length = 100,nullable = false,unique = true)
	private String contactno;
	@Column(length = 100,nullable = false,unique=true)
	private String email;
	@Column(length = 100,nullable =false)
	private String password;
}
