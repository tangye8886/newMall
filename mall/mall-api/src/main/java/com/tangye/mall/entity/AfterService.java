package com.tangye.mall.entity;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class AfterService implements Serializable{
	
	private Integer id;
	private String username;
	private String tel;
	private String orderId;
	private String reason;
	private String photo;
	private long userNo;
	private Date crateTime;
	private Integer status;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getCrateTime() {
		return crateTime;
	}
	public void setCrateTime(Date crateTime) {
		this.crateTime = crateTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public AfterService() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AfterService(Integer id, String username, String tel, String orderId, String reason, String photo,
			Date crateTime, Integer status) {
		super();
		this.id = id;
		this.username = username;
		this.tel = tel;
		this.orderId = orderId;
		this.reason = reason;
		this.photo = photo;
		this.crateTime = crateTime;
		this.status = status;
	}
	public long getUserNo() {
		return userNo;
	}
	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}
	public AfterService(Integer id, String username, String tel, String orderId, String reason, String photo,
			long userNo, Date crateTime, Integer status) {
		super();
		this.id = id;
		this.username = username;
		this.tel = tel;
		this.orderId = orderId;
		this.reason = reason;
		this.photo = photo;
		this.userNo = userNo;
		this.crateTime = crateTime;
		this.status = status;
	}

	
	
}
