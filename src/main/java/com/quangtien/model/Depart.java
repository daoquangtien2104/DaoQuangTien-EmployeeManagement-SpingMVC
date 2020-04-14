package com.quangtien.model;

import java.util.Collection;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Departs")
public class Depart 
{
	@Id
	private String id;
	private String name;
	
	@OneToMany(mappedBy = "depart", fetch = FetchType.EAGER)
	private List<Staffs> staff;

	public Depart(String id, String name) 
	{
		super();
		this.id = id;
		this.name = name;
	}

	public Depart() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Collection<Staffs> getStaff() {
		return staff;
	}

	public void setStaff(List<Staffs> staff) {
		this.staff = staff;
	}

}
