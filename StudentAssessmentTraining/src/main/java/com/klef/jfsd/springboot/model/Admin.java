package com.klef.jfsd.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "admin_table")

@Data
@Getter
@Setter
public class Admin 
{
	@Id
	private String username;
	@Column(length = 100,nullable = false)
	private String password;
}
