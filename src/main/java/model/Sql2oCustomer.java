package model;

import java.util.List;

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
	public String addCustomer(Request req) {
		
		String sql = "insert into customers (name, address1, address2,"
				+ " address3, suburb, state, postcode) values (:name, :address1,"
				+ ":address2, :address3, :suburb, :state, :postcode)";
		try (Connection con = sql2o.open()){
			return con.createQuery(sql, true).throwOnMappingFailure(false)
					.addParameter("name", req.queryParams("name"))
					.addParameter("address1", req.queryParams("address1"))
					.addParameter("address2", req.queryParams("address2"))
					.addParameter("address3", req.queryParams("address3"))
					.addParameter("suburb", req.queryParams("suburb"))
					.addParameter("state", req.queryParams("state"))
					.addParameter("postcode", req.queryParams("postcode"))
					.executeUpdate()
					.getKey().toString();
		}catch(IllegalArgumentException e){
			return "Wrong parameters";
		}
	}

	@Override
	public List<Customer> getAllCustomers() {

		String sql = "select * from customers";

		try (Connection con = sql2o.open()) {
			return con.createQuery(sql).throwOnMappingFailure(false).executeAndFetch(Customer.class);
		} catch (Exception e) {
			return null;

		}
	}

}
