import static spark.Spark.*;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import DAO.Dao;
import Model.Sql2oModel;

public class Controller {
	

	public Controller(Sql2oModel model){	
	
		Gson gson = new Gson();
		 
		staticFileLocation("/public");

		get("/", (request, response) -> {
			response.redirect("initial.html");
			return null;

		});
		
		// gets all engineers
		get("/engineers", (request, response) -> model.getAllEngineers(), gson::toJson);
		
		// gets engineer with id
		get("/engineer/:id", (request, response) -> 
			model.getEngineer(request.params(":id")), gson::toJson);
		
		// creates user
		post("/users", (request, response) -> model.addUser(request));
		
		// gets all Users
		get("/users" ,(request, response) -> model.getUsers(), gson::toJson);
		
		// gets User by id
		get("/users/:id" ,(request, response) -> model.getUser(request.params(":id")), gson::toJson);

	}	
}