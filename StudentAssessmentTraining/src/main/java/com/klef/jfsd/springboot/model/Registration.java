package com.klef.jfsd.springboot.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="registration_table")

@Data
public class Registration 
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "regid_generator")
	@SequenceGenerator(name = "regid_generator",initialValue = 1000,allocationSize = 1,sequenceName = "regid_sequence")
	private Long id;
	private String s_uname;
	private String c_id;
}
