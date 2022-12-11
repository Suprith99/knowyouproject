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
@Table(name="question_table")

@Data
public class Question
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "questionid_generator")
	@SequenceGenerator(name = "questionid_generator",initialValue = 1000,allocationSize = 1,sequenceName = "questionid_sequence")
	private Long id;
	@Column(nullable = false)
	private int category_id;
	@Column(nullable = false,length=1000)
	private String name;
	@Column(nullable = false)
	private String option1;
	@Column(nullable = false)
	private String option2;
	@Column(nullable = false)
	private String option3;
	@Column(nullable = false)
	private String option4;
	@Column(nullable = false)
	private String answer;
	@Column(nullable = false)
	private String c_id;
}
