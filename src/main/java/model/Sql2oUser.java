package model;

import java.util.List;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import controllers.UserController;
import spark.Request;

public class Sql2oUser implements UserController {

	private Sql2o sql2o;
	
	public Sql2oUser(Sql2o sql2o) {
		this.sql2o = sql2o;
	}
	
	@Override
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

	@Override
	public List<User> getUsers() {

		String sql = "select * from users";

		try (Connection con = sql2o.open()) {
			return con.createQuery(sql).throwOnMappingFailure(false).executeAndFetch(User.class);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public String addUser(Request req) {
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

}
