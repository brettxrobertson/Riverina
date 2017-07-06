package model;

import java.util.List;
import java.util.Map;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import controllers.CustomerController;
import spark.Request;

public class Sql2oCustomer implements CustomerController {

	private Sql2o sql2o;

	public Sql2oCustomer(Sql2o sql2o) {
		this.sql2o = sql2o;
	}

	@Override
	public List<Customer> getAllCustomers() {
		String sql = "SELECT * from customers";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).setAutoDeriveColumnNames(true).executeAndFetch(Customer.class);
		}
	}

	@Override
	public void addCustomer(Map<String, String> params) {
		String sql = "insert into customers (name,address1,address2,address3,state,suburb,postcode) "
				+ "values(:name,:address1,:address2,:address3,:state,:suburb,:postcode)";
		
		try (Connection con = sql2o.open()) {
		
			con.createQuery(sql)
				.addParameter("name", params.get("name"))
				.addParameter("address1", params.get("address1"))
				.addParameter("address2", params.get("address2"))
				.addParameter("address3", params.get("address3"))
				.addParameter("state", params.get("state"))
				.addParameter("suburb", params.get("suburb"))
				.addParameter("postcode", params.get("postcode"))
				.executeUpdate();
		}
		
	}
	
	

}
