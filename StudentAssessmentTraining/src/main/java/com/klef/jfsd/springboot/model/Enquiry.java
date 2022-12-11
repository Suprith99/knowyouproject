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
@Table(name="enquiry_table")

@Data
public class Enquiry 
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "enquiryid_generator")
	@SequenceGenerator(name = "enquiryid_generator",initialValue = 1000,allocationSize = 1,sequenceName = "enquiryid_sequence")
	private int id;
	@Column(nullable = false)
	private String role;
	@Column(nullable = false)
	private int role_id;
	@Column(nullable=false)
	private String subject;
	@Column(length = 300,nullable = false)
	private String query;
}
