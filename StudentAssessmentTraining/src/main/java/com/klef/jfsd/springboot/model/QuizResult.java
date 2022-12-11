package com.klef.jfsd.springboot.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="quizresult_table")

@Data
public class QuizResult 
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "quizresultid_generator")
	@SequenceGenerator(name = "quizresultid_generator",initialValue = 10,allocationSize = 1,sequenceName = "quizresultid_sequence")
	private int qid;
	private int student_id;
	private String course_id;
	private int category_id;
	private int scored;
	private int totalscore;
}
