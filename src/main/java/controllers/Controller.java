package controllers;

import static spark.Spark.*;
import static spark.Spark.get;
import static spark.Spark.post;

import java.util.Arrays;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.sql2o.logging.SysOutLogger;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import lombok.Data;
import com.google.gson.Gson;

import freemarker.cache.ClassTemplateLoader;
import freemarker.template.Configuration;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;
import model.MaterialPropPayLoad;
import model.MaterialTypes;
import model.MeasurementProperty;
import model.Sql2oModel;

public class Controller {

	/**
	 * @param model
	 */
	/**
	 * @param model
	 */
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
			attributes.put("userScreenDescription", "Select user");
			attributes.put("userScreenHomeLocation", "initial.html");

			return freeMarkerEngine.render(new ModelAndView(attributes, "engineers.ftl"));

		});

		// gets all engineers JSON
		get("/service/engineers", (request, response) -> model.getAllEngineers(), gson::toJson);

		// gets engineer with id JSON
		get("/service/engineer/:id", (request, response) -> model.getEngineer(request.params(":id")), gson::toJson);

		// JOBS
		// gets all Jobs HTML
		get("/jobs", (request, response) -> {

			response.status(200);
			response.type("text/html");

			if (request.queryParams("sessionId") == null && request.session().attribute("sessionId") == null) {
				response.redirect("/factoryLogin");
			} else if (request.session().attribute("sessionId") == null) {
				request.session().attribute("sessionId", request.queryParams("sessionId"));
			}

			Map<String, Object> attributes = new HashMap<>();

			attributes.put("jobs", model.getAllJobs());
			attributes.put("session", request.session());

			return freeMarkerEngine.render(new ModelAndView(attributes, "job.ftl"));
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
			attributes.put("session", request.session());

			return freeMarkerEngine.render(new ModelAndView(attributes, "users.ftl"));
		});

		// gets all Users JSON
		get("/service/users", (request, response) -> model.getUsers(), gson::toJson);
		// gets User by id JSON
		get("/service/users/:id", (request, response) -> model.getUser(request.params(":id")), gson::toJson);

		// CUSTOMERS
		post("/customers", (request, response) -> model.addCustomer(request));
		get("/customers", (request, response) -> model.getAllCustomers());

		// MATERIALS
		get("/materialTypes", (request, response) -> {
			response.status(200);
			response.type("text/html");

			Map<String, Object> attributes = new HashMap<>();
			request.session().attribute("jobId", request.queryParams("jobId"));
			attributes.put("materialTypes", model.getAllParentMaterialTypes());
			attributes.put("session", request.session());
			attributes.put("userScreenDescription", "Select Materials");
			attributes.put("userScreenHomeLocation", "initial.html");

			return freeMarkerEngine.render(new ModelAndView(attributes, "material_types.ftl"));
		});

		get("/materialTypes/:id", (request, response) -> {
			response.status(200);
			response.type("text/html");

			Map<String, Object> attributes = new HashMap<>();
			attributes.put("userScreenDescription", "Select Materials");
			attributes.put("userScreenHomeLocation", "initial.html");

			MaterialTypes materialType;

			/*
			 * If this material type has children types add them to the
			 * materialTypes object. Redirect to /addMaterialMeasurement/:id
			 */
			try {
				materialType = model.getMaterialTypesById(Integer.parseInt(request.params(":id"))).get(0);

				// If material type has sub types/children show them
				if (!model.getMaterialTypeChildren(materialType.getId()).isEmpty()) {
					attributes.put("materialTypes", model.getMaterialTypeChildren(materialType.getId()));
					attributes.put("session", request.session());

					return freeMarkerEngine.render(new ModelAndView(attributes, "material_types.ftl"));

				} else {
					attributes.put("materialTypes", materialType);
					attributes.put("session", request.session());

					response.redirect("/materialMeasurement/" + materialType.getId());
					return null;
				}
			} catch (IndexOutOfBoundsException e) {
				System.out.println("Index out of bounds: no materials found");
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return null;
		});

		// Add material measurements
		get("/materialMeasurement/:id", (request, response) -> {

			Integer materialId = 0;

			try {
				materialId = Integer.parseInt(request.params(":id"));
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			// Attribute Map for session variables
			Map<String, Object> attributes = new HashMap<>();
			attributes.put("session", request.session());
			attributes.put("userScreenDescription", "Select size and qty");
			attributes.put("userScreenHomeLocation", "initial.html");

			List<MeasurementProperty> materialTypeMeasurementProperties = model
					.getMaterialMeasurementProperties(materialId);

			attributes.put("materialTypeMeasurementProperties", materialTypeMeasurementProperties);

			return freeMarkerEngine.render(new ModelAndView(attributes, "materialMeasurement.ftl"));
		});

		post("/materialMeasurement", (request, response) -> {

			try {
				ObjectMapper mapper = new ObjectMapper();
				List<MaterialPropPayLoad> myObjects = Arrays
						.asList(mapper.readValue(request.body(), MaterialPropPayLoad[].class));

				for (MaterialPropPayLoad pl : myObjects) {
					System.out.println(pl.propertyDescription + " " + pl.propertyValue);
				}

			} catch (JsonParseException e) {
				System.out.println(e.getMessage());
			}catch(Exception e ){
				System.out.println(e.getMessage());
			}
			
			try{
			System.out.println("Body: " + request.body());
			// System.out.println(responseData);
			}
			catch(Exception e){
				System.out.println(e.getMessage());
			}
			

			return "200 OK";
		});

		// Session logout
		get("/logout", (request, response) -> {
			request.session().invalidate();
			response.redirect("/");
			return null;
		});

	}

}