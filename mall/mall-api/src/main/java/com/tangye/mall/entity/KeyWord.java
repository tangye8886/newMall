package com.tangye.mall.entity;

import java.io.Serializable;

public class KeyWord implements Serializable{
	private static final long serialVersionUID = 372887005517376917L;
	
	private int id;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public KeyWord() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KeyWord(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	
}
