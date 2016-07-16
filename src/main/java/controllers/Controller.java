package controllers;

import static spark.Spark.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import com.google.gson.Gson;
import freemarker.cache.ClassTemplateLoader;
import freemarker.template.Configuration;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;
import model.Job;
import model.Sql2oModel;

public class Controller {

	public Controller(Sql2oModel model) {

		// Import the Google JSON library
		Gson gson = new Gson();

		// Setup the template configuration
		FreeMarkerEngine freeMarkerEngine = new FreeMarkerEngine();
		Configuration freeMarkerConfiguration = new Configuration();
		freeMarkerConfiguration.setTemplateLoader(new ClassTemplateLoader(this.getClass(), "/templates"));
		freeMarkerEngine.setConfiguration(freeMarkerConfiguration);

		staticFileLocation("/public");

		get("/", (request, response) -> {
			response.redirect("initial.html");
			return null;
		});

		// Routes

		// ENGINEERS
		// gets all engineers HTML
		get("/factoryLogin", (request, response) -> {

			response.status(200);
			response.type("text/html");

			Map<String, Object> attributes = new HashMap<>();
			attributes.put("engineers", model.getAllEngineers());

			return freeMarkerEngine.render(new ModelAndView(attributes, "factoryLogin.ftl"));

		});
		
		
		// gets all engineers JSON
		get("/service/engineers", (request, response) -> model.getAllEngineers(), gson::toJson);

		// gets engineer with id JSON
		get("/service/engineer/:id", (request, response) -> model.getEngineer(request.params(":id")), gson::toJson);
		
		//JOBS
		// gets all Jobs HTML
		get("/jobs", (request, response) -> {

			response.status(200);
			response.type("text/html");
			
			if(request.queryParams("sessionId") == null && request.session().attribute("sessionId") == null){
				response.redirect("/factoryLogin");
			}else if(request.session().attribute("sessionId") == null){
				request.session().attribute("sessionId",request.queryParams("sessionId"));
			}
			
			Map<String, Object> attributes = new HashMap<>();
			
			attributes.put("jobs", model.getAllJobs());
			attributes.put("session",request.session());

			return freeMarkerEngine.render(new ModelAndView(attributes, "jobsList.ftl"));
		});
		// gets all Jobs JSON
		get("/service/jobs", (request, response) -> model.getAllJobs(), gson::toJson);
		// TODO add post job

		
		
		// USERS
		// creates user
		post("/users", (request, response) -> model.addUser(request));

		// gets all Users HTML
		get("/engineers", (request, response) -> {
			response.status(200);
			response.type("text/html");

			Map<String, Object> attributes = new HashMap<>();
			attributes.put("users", model.getUsers());

			return freeMarkerEngine.render(new ModelAndView(attributes, "users.ftl"));
		});

		// gets all Users JSON
		get("/service/users", (request, response) -> model.getUsers(), gson::toJson);
		// gets User by id JSON
		get("/service/users/:id", (request, response) -> model.getUser(request.params(":id")), gson::toJson);

		// CUSTOMERS
		post("/customers", (request, response) -> model.addCustomer(request));
		get("/customers", (request, response) -> model.getAllCustomers());
		
		
		//Session logout
		get("/logout", (request, response) -> {
            request.session().invalidate();
            response.redirect("/");
            return null;
        });
		
	}

}