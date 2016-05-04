package Model;

import java.util.ArrayList;
import java.util.List;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import com.google.gson.Gson;

import spark.Request;

public class Sql2oModel implements Model {

	private Sql2o sql2o;

	public Sql2oModel(Sql2o sql2o) {
		this.sql2o = sql2o;
	}
	
	@Override
	public String addUser(Request req) throws IllegalArgumentException{

		String sql = "insert into users ( name, surname, phone, email,"
				+ " user_types_id ) values ( :name, :surname, :phone," + " :email, :user_types_id )";
		
		
		try (Connection con = sql2o.open()) {
			return con.createQuery(sql, true).throwOnMappingFailure(false)
					.addParameter("name", req.queryParams("name"))
					.addParameter("surname", req.queryParams("surname"))
					.addParameter("phone", req.queryParams("phone"))
					.addParameter("email", req.queryParams("email"))
					.addParameter("user_types_id",
							Integer.parseInt(req.queryParams("user_types_id")))
					.executeUpdate()
					.getKey().toString();

		}catch(IllegalArgumentException e){
			return "Wrong parameters";
		}
		
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
			
			engineerList = con.createQuery(sql).throwOnMappingFailure(false).addParameter("id", id)
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

			return con.createQuery(sql).throwOnMappingFailure(false).executeAndFetch(Engineer.class);
		}
	}

	@Override
	public List<User> getUsers() {
		
		String sql = "select * from users";
		
		try (Connection con = sql2o.open()) {
			return con.createQuery(sql).throwOnMappingFailure(false).executeAndFetch(User.class);
		}catch(Exception e){
			return null;
		}
	}

	public User getUser(String formId) {
		
		int id =0;
		try {
			id = Integer.parseInt(formId);
		} catch (IllegalArgumentException e) {
			return null;
		}
		
		String sql = "select * from users where id = :id";
		
		try (Connection con = sql2o.open()) {
			return con.createQuery(sql).throwOnMappingFailure(false)
					.addParameter("id", id)
					.executeAndFetch(User.class).get(0);
		}catch(Exception e){
			return null;
		}
	}

}
