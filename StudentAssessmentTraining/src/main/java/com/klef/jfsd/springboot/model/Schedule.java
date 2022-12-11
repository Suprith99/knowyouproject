package com.klef.jfsd.springboot.model;

import java.sql.Blob;

import java.util.Date;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;


import lombok.Data;

@Entity
@Table(name="schedule_table")

@Data
public class Schedule 
{
	@Id
	@GeneratedValue
	private int id;
	@Column(nullable = false,length = 100,unique = true)
	private String title;
	@Column(nullable = false,length = 1000)
	private String description;
	@Column(nullable = false,length = 100)
	private String venue;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	@Column(nullable = false)
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	@Column(nullable = false)	
	private Date endDate;
	@Column(nullable = false,length = 100)
	private String days;
	@Column(nullable = false,length = 100)
	private String modeOfConduct;
	@Column(nullable = false,length = 100)
	private String c_id;
	@Column(nullable = false)
	private Blob scheduleposter;
}
