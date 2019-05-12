package com.tangye.mall.entity;

import java.io.Serializable;
import java.util.Date;

public class MallUser implements Serializable{
	private static final long serialVersionUID = -1347979685003957716L;

	private Long id;

    private String username;

    private String password;

    private String phone;

    private String email;

    private Date created;

    private Date updated;
    
    private Integer role;
    
    
    //private MallAddress address;
    
    
    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public MallUser(String username, String password, String phone, String email, Date created, Date updated) {
		super();
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.created = created;
		this.updated = updated;
	}

	public MallUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }


	public MallUser(String username, String password, String phone, String email, Date created) {
		super();
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.created = created;
	}


	public MallUser(String username, String password, String phone, String email, Date created, Date updated,
			Integer role) {
		super();
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.created = created;
		this.updated = updated;
		this.role = role;
	}


	public Integer getRole() {
		return role;
	}


	public void setRole(Integer role) {
		this.role = role;
	}


	@Override
	public String toString() {
		return "MallUser [id=" + id + ", username=" + username + ", password=" + password + ", phone=" + phone
				+ ", email=" + email + ", created=" + created + ", updated=" + updated + "]";
	}

    
}