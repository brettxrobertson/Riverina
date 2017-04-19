package controllers;

import static spark.Spark.get;
import static spark.Spark.post;
import static spark.Spark.staticFileLocation;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import freemarker.cache.ClassTemplateLoader;
import freemarker.template.Configuration;
import model.MaterialPropPayLoad;
import model.MaterialTypes;
import model.MeasurementProperty;
import model.Sql2oModel;
import spark.ModelAndView;
import spark.Spark;
import spark.template.freemarker.FreeMarkerEngine;

public class Controller {

	/**
	 * @param model
	 */
	public Controller(Sql2oModel model) {

		Spark.exception(Exception.class, (exception, request, response) -> {
			exception.printStackTrace();
		});

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
			request.session().invalidate();
			return null;
		});

		// Routes

		// ENGINEERS
		// gets all engineers HTML
		get("/factoryLogin", (request, response) -> {

			

			response.status(200);
			response.type("text/html");
			
			Integer page;
			if (request.queryParams("page") == null) {
				page = 0;
			} else {
				page = Integer.parseInt(request.queryParams("page"));
			}

			Map<String, Object> attributes = new HashMap<>();
			try {

				attributes.put("backPage", (page > 0) ? page - 1 : 0);
				attributes.put("fwdPage", page + 1);
				attributes.put("engineers", model.getAllEngineers(page));
				attributes.put("userScreenDescription", "Select user");
				attributes.put("userScreenHomeLocation", "/");

				return freeMarkerEngine.render(new ModelAndView(attributes, "engineers.ftl"));
			} catch (Exception e) {

				System.out.println("Ho Hom no db connection");
				return "Ho hum no DB connection " + e.getMessage();

			}
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

			Integer page;
			if (request.queryParams("page") == null) {
				page = 0;
			} else {
				page = Integer.parseInt(request.queryParams("page"));
			}

			if (request.queryParams("sessionId") == null && request.session().attribute("sessionId") == null) {
				response.redirect("/factoryLogin");
			} else if (request.session().attribute("sessionId") == null) {
				request.session().attribute("sessionId", request.queryParams("sessionId"));
			}

			Map<String, Object> attributes = new HashMap<>();

			attributes.put("backPage", (page > 0) ? page - 1 : 0);
			attributes.put("fwdPage", page + 1);

			attributes.put("jobs", model.getAllJobs(page));
			attributes.put("session", request.session());

			return freeMarkerEngine.render(new ModelAndView(attributes, "job.ftl"));
		});
		// gets all Jobs JSON
		get("/service/jobs", (request, response) -> model.getAllJobs(null), gson::toJson);
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
			
			Integer page;
			if (request.queryParams("page") == null) {
				page = 0;
			} else {
				page = Integer.parseInt(request.queryParams("page"));
			}
			
			Map<String, Object> attributes = new HashMap<>();
			request.session().attribute("jobId", request.queryParams("jobId"));
			attributes.put("materialTypes", model.getAllParentMaterialTypes(page));
			
			attributes.put("backPage", (page > 0) ? page - 1 : 0);
			attributes.put("fwdPage", page + 1);
			
			attributes.put("session", request.session());
			attributes.put("userScreenDescription", "Select Materials");
			attributes.put("userScreenHomeLocation", "/");

			return freeMarkerEngine.render(new ModelAndView(attributes, "material_types.ftl"));
		});

		get("/materialTypes/:id", (request, response) -> {
			response.status(200);
			response.type("text/html");

			Map<String, Object> attributes = new HashMap<>();
			attributes.put("userScreenDescription", "Select Materials");
			attributes.put("userScreenHomeLocation", "/");
			
			Integer page;
			if (request.queryParams("page") == null) {
				page = 0;
			} else {
				page = Integer.parseInt(request.queryParams("page"));
			}
			
			Integer materialId = Integer.parseInt(request.params(":id"));
			
			
			attributes.put("materialId", materialId);
			attributes.put("backPage", (page > 0) ? page - 1 : 0);
			attributes.put("fwdPage", page + 1);
			MaterialTypes materialType;

			/*
			 * If this material type has children types add them to the
			 * materialTypes object. Redirect to /addMaterialMeasurement/:id
			 */
			try {
				materialType = model.getMaterialTypesById(Integer.parseInt(request.params(":id"))).get(0);

				// If material type has sub types/children show them
				if (!model.getMaterialTypeChildren(materialType.getId(),0).isEmpty()) {
					attributes.put("materialTypes", model.getMaterialTypeChildren(materialType.getId(),page));
					// attributes.put("session", request.session());

					return freeMarkerEngine.render(new ModelAndView(attributes, "material_types.ftl"));

				} else {
					attributes.put("materialTypes", materialType);
					request.session().attribute("materialTypes", materialType.getId());
					attributes.put("session", request.session());

					attributes.put("materials", model.getMaterialsByTypeId(materialType.getId(), page));
					return freeMarkerEngine.render(new ModelAndView(attributes, "materials.ftl"));

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
				request.session().attribute("materialId", materialId);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			// Attribute Map for session variables
			Map<String, Object> attributes = new HashMap<>();

			attributes.put("session", request.session());
			attributes.put("userScreenDescription", "Select measurements");
			attributes.put("userScreenHomeLocation", "/");

			List<MeasurementProperty> materialTypeMeasurementProperties = model
					.getMaterialMeasurementProperties(materialId);

			attributes.put("materialTypeMeasurementProperties", materialTypeMeasurementProperties);

			return freeMarkerEngine.render(new ModelAndView(attributes, "materialMeasurement.ftl"));
		});

		post("/materialMeasurement", (request, response) -> {
			response.status(200);

			ObjectMapper mapper = new ObjectMapper();

			List<MaterialPropPayLoad> myPayLoads = null;

			Map<String, Object> attributes = new HashMap<>();

			attributes.put("session", request.session());
			attributes.put("userScreenDescription", "Select measurements");
			attributes.put("userScreenHomeLocation", "/");

			try {

				String justJSON = request.body().substring(11);

				myPayLoads = Arrays.asList(mapper.readValue(justJSON, MaterialPropPayLoad[].class));

				for (MaterialPropPayLoad pl : myPayLoads) {
					System.out.println(pl.propertyDescription + " " + pl.propertyValue);
				}
				System.out.println(request.session().attributes());

			} catch (JsonParseException e) {
				System.out.println(e.getMessage());
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			try {
				// Add usage measurements to DB
				int materialId = Integer.parseInt(request.session().attribute("materialId").toString());
				int userId = Integer.parseInt(request.session().attribute("sessionId").toString());
				int jobId = Integer.parseInt(request.session().attribute("jobId").toString());

				model.addMaterialUsage(myPayLoads, materialId, userId, jobId);

				List<Map<String, Object>> materialsList = model
						.getAllMaterialUsage(request.session().attribute("jobId"));

				Iterator<Map<String, Object>> it = materialsList.iterator();

				while (it.hasNext()) {
					Map<String, Object> record = it.next();

					System.out.println(record);
				}

				attributes.put("jobs", model.getJobHeader(request.session().attribute("jobId")));

				attributes.put("rows", model.getAllMaterialUsage(request.session().attribute("jobId")));

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			return freeMarkerEngine.render(new ModelAndView(attributes, "jobSummary.ftl"));
			// return "hello";
		});

		// Session logout
		// get("/jobSummary", (request, response) -> {
		//
		// Map<String, Object> attributes = new HashMap<>();
		// attributes.put("session", request.session());
		// attributes.put("userScreenDescription", "Job Summary");
		// attributes.put("userScreenHomeLocation", "initial.html");
		//
		// return freeMarkerEngine.render(new ModelAndView(attributes,
		// "jobSummary.ftl"));
		// });

		// Session logout
		get("/logout", (request, response) -> {
			request.session().invalidate();
			response.redirect("/");
			return null;
		});

		// Office data input interface
		get("/service/job", (request, response) -> {
			response.status(200);
			return freeMarkerEngine.render(new ModelAndView(null, "jobInput.ftl"));
		});

		post("service/job", (request, response) -> {

			return null;
		});

	}

}