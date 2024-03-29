package model;
// Generated Jun 17, 2016 11:36:27 AM by Hibernate Tools 5.1.0.Alpha1

/**
 * DefaultOperations generated by hbm2java
 */
public class DefaultOperations implements java.io.Serializable {

	private Integer id;
	private MaterialTypes materialTypes;
	private Operations operations;
	private Integer quantity;

	public DefaultOperations() {
	}

	public DefaultOperations(MaterialTypes materialTypes, Operations operations) {
		this.materialTypes = materialTypes;
		this.operations = operations;
	}

	public DefaultOperations(MaterialTypes materialTypes, Operations operations, Integer quantity) {
		this.materialTypes = materialTypes;
		this.operations = operations;
		this.quantity = quantity;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public MaterialTypes getMaterialTypes() {
		return this.materialTypes;
	}

	public void setMaterialTypes(MaterialTypes materialTypes) {
		this.materialTypes = materialTypes;
	}

	public Operations getOperations() {
		return this.operations;
	}

	public void setOperations(Operations operations) {
		this.operations = operations;
	}

	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}
