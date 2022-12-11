package com.klef.jfsd.springboot.model;

import java.sql.Blob;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="student_table")

@Data
public class Student 
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "studentid_generator")
	@SequenceGenerator(name = "studentid_generator",initialValue = 200000,allocationSize = 1,sequenceName = "studentid_sequence")
	private int id;
	@Column(length = 100,nullable = false)
	private String name;
	@Column(length = 100,nullable = false)
	private String gender;
	@Column(length = 100,nullable = false)
	private double cgpa;
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
	@Column(length = 100)
	private String facultymentor;
	@Column
	private Blob profileimage;
	
}
