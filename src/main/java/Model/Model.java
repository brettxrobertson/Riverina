package Model;

import java.util.List;

import spark.Request;

public interface Model {
	
	User getUser(String id);
	List<User> getUsers();
	String addUser(Request req);
	
	Engineer getEngineer(String id);
	List<Engineer> getAllEngineers();
	
	
}

