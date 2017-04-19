package model;
// Generated Jun 17, 2016 11:36:27 AM by Hibernate Tools 5.1.0.Alpha1

import java.util.HashSet;
import java.util.Set;

/**
 * MaterialTypes generated by hbm2java
 */
public class MaterialTypes implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String description;
	private String uom;
	private Integer parentTypesId;
	
	/**
	 * @return the uom
	 */
	public String getUom() {
		return uom;
	}

	/**
	 * @param uom the uom to set
	 */
	public void setUom(String uom) {
		this.uom = uom;
	}

	private Set defaultOperationses = new HashSet(0);
	private Set materialses = new HashSet(0);

	public MaterialTypes() {
	}

	public MaterialTypes(String unitOfMeasure) {
		this.uom = unitOfMeasure;
	}

	public MaterialTypes(String description, String unitOfMeasure, Set defaultOperationses, Set materialses) {
		this.description = description;
		this.uom = unitOfMeasure;
		this.defaultOperationses = defaultOperationses;
		this.materialses = materialses;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUnitOfMeasure() {
		return this.uom;
	}

	public void setUnitOfMeasure(String unitOfMeasure) {
		this.uom = unitOfMeasure;
	}

	public Set getDefaultOperationses() {
		return this.defaultOperationses;
	}


	public void setDefaultOperationses(Set defaultOperationses) {
		this.defaultOperationses = defaultOperationses;
	}

	public Set getMaterialses() {
		return this.materialses;
	}

	public void setMaterialses(Set materialses) {
		this.materialses = materialses;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "MaterialTypes [id=" + id + ", description=" + description + ", unitOfMeasure=" + uom
				+ ", defaultOperationses=" + defaultOperationses + ", materialses=" + materialses + "]";
	}

	/**
	 * @return the parentTypeId
	 */
	public Integer getParentTypesId() {
		return parentTypesId;
	}

	/**
	 * @param parentTypeId the parentTypeId to set
	 */
	public void setParentTypesId(Integer parentTypeId) {
		this.parentTypesId = parentTypeId;
	}
}
