package com.tangye.mall.entity;

import java.io.Serializable;
import java.util.Date;

public class MallItemCat implements Serializable{
	private static final long serialVersionUID = 6756775740292858513L;

	private Long id;

    private Long parentId;

    private String name;

    private Integer status;

    private Integer sortOrder;

    private Integer isParent;

    private Date created;

    private Date updated;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Integer getIsParent() {
        return isParent;
    }

    public void setIsParent(Integer isParent) {
        this.isParent = isParent;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

	public MallItemCat() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MallItemCat(Long parentId, String name, Integer status, Integer sortOrder, Integer isParent, Date created,
			Date updated) {
		super();
		this.parentId = parentId;
		this.name = name;
		this.status = status;
		this.sortOrder = sortOrder;
		this.isParent = isParent;
		this.created = created;
		this.updated = updated;
	}
    
    
}