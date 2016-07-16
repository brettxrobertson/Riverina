package model;

import java.util.ArrayList;
import java.util.List;
import org.sql2o.Connection;
import org.sql2o.Query;
import org.sql2o.Sql2o;

import controllers.CustomerController;
import controllers.EngineerController;
import controllers.UserController;
import spark.Request;

public class Sql2oModel implements CustomerController,EngineerController,UserController {

	private Sql2o sql2o;

	public Sql2oModel(Sql2o sql2o) {
		this.sql2o = sql2o;
	}

	@Override
	public Engineer getEngineer(String formId) {
	
		String sql = "select * from users where id = :id";
		int id =0;
		try {
			id = Integer.parseInt(formId);
		} catch (IllegalArgumentException e) {
			return null;
		}

		try (Connection con = sql2o.open()) {
			
			List<Engineer> engineerList = new ArrayList<Engineer>();
			
			engineerList = con.createQuery(sql)
					.throwOnMappingFailure(false)
					.setAutoDeriveColumnNames(true)
					.addParameter("id", id)
					.executeAndFetch(Engineer.class);
			
			return (Engineer) engineerList.get(0);
			
		} catch (IllegalArgumentException e) {
			return null;
		}
	}

	@Override
	public List<Engineer> getAllEngineers() {

		String sql = "select users.* from users left join user_types on users.user_types_id = user_types.id where user_types.description = 'Engineer'";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql)
					.throwOnMappingFailure(false)
					.setAutoDeriveColumnNames(true)
					.executeAndFetch(Engineer.class);
		}
	}

	@Override
	public List<User> getUsers() {
		return null;
		
		
	}

	@Override
	public User getUser(String formId) {
		return null;
		
		
	}
	@Override
	public String addUser(Request req) throws IllegalArgumentException{
		return null;

		
		
	}

	@Override
	public String addCustomer(Request req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Customer> getAllCustomers() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @return
	 */
	public List<Job> getAllJobs() {
		
		String sql = "SELECT job_name from jobs";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).throwOnMappingFailure(false)
					.setAutoDeriveColumnNames(true)
					.executeAndFetch(Job.class);
		}
	}
	
	
}
