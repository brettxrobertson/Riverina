package model;
// Generated Jun 17, 2016 11:36:27 AM by Hibernate Tools 5.1.0.Alpha1

import java.util.Date;

/**
 * MaterialsUsage generated by hbm2java
 */
public class MaterialsUsage implements java.io.Serializable {

	private Integer id;
	private Components components;
	private Materials materials;
	private User users;
	private Date date;
	private int qty;

	public MaterialsUsage() {
	}

	public MaterialsUsage(Components components, Materials materials, User users, int qty) {
		this.components = components;
		this.materials = materials;
		this.users = users;
		this.qty = qty;
	}

	public MaterialsUsage(Components components, Materials materials, User users, Date date, int qty) {
		this.components = components;
		this.materials = materials;
		this.users = users;
		this.date = date;
		this.qty = qty;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Components getComponents() {
		return this.components;
	}

	public void setComponents(Components components) {
		this.components = components;
	}

	public Materials getMaterials() {
		return this.materials;
	}

	public void setMaterials(Materials materials) {
		this.materials = materials;
	}

	public User getUsers() {
		return this.users;
	}

	public void setUsers(User users) {
		this.users = users;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getQty() {
		return this.qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

}