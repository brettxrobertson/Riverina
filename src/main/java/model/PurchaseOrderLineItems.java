package model;
// Generated Jun 17, 2016 11:36:27 AM by Hibernate Tools 5.1.0.Alpha1

/**
 * PurchaseOrderLineItems generated by hbm2java
 */
public class PurchaseOrderLineItems implements java.io.Serializable {

	private int id;
	private Materials materials;
	private PurchaseOrders purchaseOrders;
	private int qty;

	public PurchaseOrderLineItems() {
	}

	public PurchaseOrderLineItems(int id, Materials materials, PurchaseOrders purchaseOrders,
			int qty) {
		this.id = id;
		this.materials = materials;
		this.purchaseOrders = purchaseOrders;
		this.qty = qty;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Materials getMaterials() {
		return this.materials;
	}

	public void setMaterials(Materials materials) {
		this.materials = materials;
	}

	public PurchaseOrders getPurchaseOrders() {
		return this.purchaseOrders;
	}

	public void setPurchaseOrders(PurchaseOrders purchaseOrders) {
		this.purchaseOrders = purchaseOrders;
	}

	public int getQty() {
		return this.qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

}
