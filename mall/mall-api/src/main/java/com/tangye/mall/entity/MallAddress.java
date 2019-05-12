package com.tangye.mall.entity;

import java.io.Serializable;
import java.util.Date;

public class MallAddress implements Serializable{

	private static final long serialVersionUID = 6202292486692620502L;
	
	private Integer id;
	private long userNo;
	private String userName;
	private String phone;
	private String address;
	private long postCode;
	private Date createTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public long getUserNo() {
		return userNo;
	}
	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getPostCode() {
		return postCode;
	}
	public void setPostCode(long postCode) {
		this.postCode = postCode;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public MallAddress() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MallAddress(Integer id, long userNo, String userName, String phone, String address, long postCode,
			Date createTime) {
		super();
		this.id = id;
		this.userNo = userNo;
		this.userName = userName;
		this.phone = phone;
		this.address = address;
		this.postCode = postCode;
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "MallAddress [id=" + id + ", userNo=" + userNo + ", userName=" + userName + ", phone=" + phone
				+ ", address=" + address + ", postCode=" + postCode + ", createTime=" + createTime + "]";
	}
	
	
}
