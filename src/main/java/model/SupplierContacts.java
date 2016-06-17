package model;
// Generated Jun 17, 2016 11:36:27 AM by Hibernate Tools 5.1.0.Alpha1

/**
 * SupplierContacts generated by hbm2java
 */
public class SupplierContacts implements java.io.Serializable {

	private Integer id;
	private Suppliers suppliers;
	private String name;
	private String surname;
	private String phone;
	private String mobile;
	private String email;

	public SupplierContacts() {
	}

	public SupplierContacts(Suppliers suppliers, String name, String surname) {
		this.suppliers = suppliers;
		this.name = name;
		this.surname = surname;
	}

	public SupplierContacts(Suppliers suppliers, String name, String surname, String phone, String mobile,
			String email) {
		this.suppliers = suppliers;
		this.name = name;
		this.surname = surname;
		this.phone = phone;
		this.mobile = mobile;
		this.email = email;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Suppliers getSuppliers() {
		return this.suppliers;
	}

	public void setSuppliers(Suppliers suppliers) {
		this.suppliers = suppliers;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return this.surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
