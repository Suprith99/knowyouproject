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
@Table(name="trainer_table")

@Data
public class Trainer 
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "courseid_generator")
	@SequenceGenerator(name = "courseid_generator",initialValue = 500,allocationSize = 1,sequenceName = "courseid_sequence")
	private int id;
	@Column(length = 100,nullable = false)
	private String name;
	@Column(length = 100,nullable = false)
	private String gender;
	@Column(length = 100,nullable = false)
	private String designation;
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
	@Column
	private Blob profileimage;
}
