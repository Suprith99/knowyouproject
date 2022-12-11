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
@Table

@Data
public class Material 
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "materialid_generator")
	@SequenceGenerator(name = "materialid_generator",initialValue = 1000,allocationSize = 1,sequenceName = "materialid_sequence")
	private int id;
	private String name;
	private String description;
	private String ref_link;
	private String c_id;
}
