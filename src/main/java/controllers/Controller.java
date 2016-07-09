package controllers;

import static spark.Spark.*;

import java.util.HashMap;
import java.util.Map;
import com.google.gson.Gson;
import freemarker.cache.ClassTemplateLoader;
import freemarker.template.Configuration;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;

import model.Sql2oModel;

public class Controller {

	public Controller(Sql2oModel model) {
		
		//Import the Google JSON library
		Gson gson = new Gson();

		//Setup the template configuration
		FreeMarkerEngine freeMarkerEngine = new FreeMarkerEngine();
		Configuration freeMarkerConfiguration = new Configuration();
		freeMarkerConfiguration.setTemplateLoader(new ClassTemplateLoader(this.getClass(), "/templates"));
		freeMarkerEngine.setConfiguration(freeMarkerConfiguration);

		staticFileLocation("/public");

		get("/", (request, response) -> {
			response.redirect("initial.html");
			return null;
		});

		// ENGINEERS
		// gets all engineers
		get("/engineers", (request, response) -> {

			response.status(200);
			response.type("text/html");
			
			Map<String, Object> attributes = new HashMap<>();
			attributes.put("engineers", model.getAllEngineers());
			
			return freeMarkerEngine.render(new ModelAndView(attributes, "engineers.ftl"));

		});


		// gets engineer with id
		get("/engineer/:id", (request, response) -> model.getEngineer(request.params(":id")), gson::toJson);

		// USERS
		// creates user
		post("/users", (request, response) -> model.addUser(request));
		// gets all Users
		get("/users", (request, response) -> model.getUsers(), gson::toJson);
		// gets User by id
		get("/users/:id", (request, response) -> model.getUser(request.params(":id")), gson::toJson);

		// CUSTOMERS
		post("/customers", (request, response) -> model.addCustomer(request));
		get("/customers", (request, response) -> model.getAllCustomers());

		// JOBS

	}
}