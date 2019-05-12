package com.tangye.mall.entity;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MallCollect implements Serializable{

	private int id;
	private long userNo;
	private long itemNo;
	private int status;
	
	private MallItem item; //一对一
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getUserNo() {
		return userNo;
	}
	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}
	public long getItemNo() {
		return itemNo;
	}
	public void setItemNo(long itemNo) {
		this.itemNo = itemNo;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public MallCollect(int id, long userNo, long itemNo, int status) {
		super();
		this.id = id;
		this.userNo = userNo;
		this.itemNo = itemNo;
		this.status = status;
	}
	public MallCollect() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MallItem getItem() {
		return item;
	}
	public void setItem(MallItem item) {
		this.item = item;
	}
	
	
	
}
