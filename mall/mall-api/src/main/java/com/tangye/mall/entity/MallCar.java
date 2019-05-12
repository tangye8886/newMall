package com.tangye.mall.entity;

import java.io.Serializable;
import java.util.Date;

public class MallCar implements Serializable{
	private static final long serialVersionUID = 3773055789023066087L;
	
	private Integer id;
	private long itemNo;
	private long userNo;
	private long amount;
	
	
	private Date createTime;
	
	private MallItem item;
	
	
	
	
	
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public MallItem getItem() {
		return item;
	}
	public void setItem(MallItem item) {
		this.item = item;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public long getItemNo() {
		return itemNo;
	}
	public void setItemNo(long itemNo) {
		this.itemNo = itemNo;
	}
	public long getUserNo() {
		return userNo;
	}
	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public MallCar() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MallCar(long itemNo, long userNo, Date createTime) {
		super();
		this.itemNo = itemNo;
		this.userNo = userNo;
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "MallCar [id=" + id + ", itemNo=" + itemNo + ", userNo=" + userNo + ", createTime=" + createTime + "]";
	}
	public MallCar(long itemNo, long userNo, long amount, Date createTime) {
		super();
		this.itemNo = itemNo;
		this.userNo = userNo;
		this.amount = amount;
		this.createTime = createTime;
	}
	
	
}
