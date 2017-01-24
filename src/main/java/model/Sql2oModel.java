package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.sql2o.Connection;
import org.sql2o.Query;
import org.sql2o.Sql2o;
import org.sql2o.Sql2oException;
import org.sql2o.data.Table;

import controllers.CustomerController;
import controllers.EngineerController;
import controllers.UserController;
import spark.Request;

public class Sql2oModel implements CustomerController, EngineerController, UserController {

	private Sql2o sql2o;

	public Sql2oModel(Sql2o sql2o) {
		this.sql2o = sql2o;
	}

	@Override
	public Engineer getEngineer(String formId) {

		String sql = "select * from users where id = :id";
		int id = 0;
		try {
			id = Integer.parseInt(formId);
		} catch (IllegalArgumentException e) {
			return null;
		}

		try (Connection con = sql2o.open()) {

			List<Engineer> engineerList = new ArrayList<Engineer>();

			engineerList = con.createQuery(sql).throwOnMappingFailure(false).setAutoDeriveColumnNames(true)
					.addParameter("id", id).executeAndFetch(Engineer.class);

			return (Engineer) engineerList.get(0);

		} catch (IllegalArgumentException e) {
			return null;
		}
	}

	@Override
	public List<Engineer> getAllEngineers() {

		String sql = "select users.* from users left join user_types on users.user_types_id = user_types.id where user_types.description = 'Engineer'";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).throwOnMappingFailure(false).setAutoDeriveColumnNames(true)
					.executeAndFetch(Engineer.class);
		}
	}

	@Override
	public List<User> getUsers() {

		String sql = "select users.* from users left join user_types on users.user_types_id = user_types.id";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).throwOnMappingFailure(false).setAutoDeriveColumnNames(true)
					.executeAndFetch(User.class);
		}

	}

	@Override
	public User getUser(String formId) {
		return null;

	}

	@Override
	public String addUser(Request req) throws IllegalArgumentException {
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

	public List<Customer> getCustomerById(int customerId) {

		String sql = "SELECT * from customers where id = :customerId";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).setAutoDeriveColumnNames(true).addParameter("customerId", customerId)
					.executeAndFetch(Customer.class);
		}
	}

	/**
	 * @return
	 */
	public List<Job> getAllJobs() {

		String sql = "SELECT * from jobs";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).throwOnMappingFailure(false).setAutoDeriveColumnNames(true)
					.executeAndFetch(Job.class);
		}
	}

	public List<MaterialTypes> getAllMaterialTypes() {

		String sql = "select * from material_types";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).throwOnMappingFailure(false).setAutoDeriveColumnNames(true)
					.executeAndFetch(MaterialTypes.class);
		}

	}

	public List<MaterialTypes> getAllParentMaterialTypes() {

		String sql = "select * from material_types where parent_types_id is null";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).throwOnMappingFailure(false).setAutoDeriveColumnNames(true)
					.executeAndFetch(MaterialTypes.class);
		}

	}

	public List<MaterialTypes> getMaterialTypesById(int id) {

		String sql = "select id, description,UOM, parent_types_id parentTypesId from material_types where id = :id";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).setAutoDeriveColumnNames(true).addParameter("id", id)
					.executeAndFetch(MaterialTypes.class);
		}

	}

	public List<Materials> getMaterialsById(String id) {

		String sql = "select * from materials where id = :id";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).throwOnMappingFailure(false).addParameter("id", id)
					.setAutoDeriveColumnNames(true).executeAndFetch(Materials.class);
		}
	}

	public List<Map<String, Object>> getMaterialsByTypeId(Integer id) {

		// String sql = "select m.*,mp.id as measurement_properties_id, " +
		// "mp.description as property_description,"
		// + " mhmp.measurement from materials m," + "
		// materials_has_measurement_properties mhmp,"
		// + "measurement_properties mp" + " where m.id = mhmp.materials_id and
		// "
		// + "mhmp.measurement_properties_id = mp.id and" + " material_types_id
		// = :id";

		String sql = "select * from materials where material_types_id = :id";

		try (Connection con = sql2o.open()) {

			// return
			Table table = con.createQuery(sql).addParameter("id", id).setAutoDeriveColumnNames(true)
					.executeAndFetchTable();

			return tableToList(table);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;

	}

	public List<MaterialTypes> getMaterialTypeChildren(Integer id) {

		String sql = "select id, description,UOM, parent_types_id "
				+ "parentTypesId from material_types where parent_types_id = :id";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).addParameter("id", id).setAutoDeriveColumnNames(true)
					.executeAndFetch(MaterialTypes.class);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	public List<MeasurementProperty> getMaterialMeasurementProperties(Integer id) {

		String sql = "select mhmp.measurement_properties_id as id, mp.description from measurement_properties mp, materials_has_measurement_properties mhmp "
				+ "where mp.id = mhmp.measurement_properties_id and mhmp.materials_id = :id and mhmp.measurement is null";

		try (Connection con = sql2o.open()) {

			// Table table = con.createQuery(sql).addParameter("id",
			// id).setAutoDeriveColumnNames(true)
			// .executeAndFetchTable();
			//
			// return tableToList(table);

			return con.createQuery(sql).addParameter("id", id).setAutoDeriveColumnNames(true)
					.executeAndFetch(MeasurementProperty.class);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return null;
	}

	// Make a nice table list from the fetchtable sql2o call
	private List<Map<String, Object>> tableToList(Table t) {
		List<Map<String, Object>> mapList = new ArrayList<>();
		for (int i = 0; i < t.rows().size(); i++) {
			Map<String, Object> map = new HashMap<>();
			for (int j = 0; j < t.columns().size(); j++) {
				map.put(t.columns().get(j).getName(), t.rows().get(i).getObject(j));
			}
			mapList.add(map);

		}
		return mapList;
	}

	// Return materialId of material with matching details
	public Integer materialByProperties(List<MaterialPropPayLoad> payLoadList, int materialTypesId) throws Exception {

		// Material properties string
		String materialPropertiesSql = "";

		for (MaterialPropPayLoad load : payLoadList) {

			if (materialPropertiesSql != "") {
				materialPropertiesSql += " and ";
			}
			materialPropertiesSql += " ( mhmp.material_properties_id = '" + load.propertyId
					+ "' and mhmp.measurement = " + load.propertyValue;
		}

		String sql = "SELECT * FROM materials m, materials_has_measurement_properties mhmp,"
				+ " material_types mt  where m.material_types_id = :materialTypesId" + " and " + materialPropertiesSql;

		return null;

	}

	public Long addMaterialUsage(final List<MaterialPropPayLoad> payLoadList, final int materialsId, final int userId,
			final int jobId) {

		String sql = "insert into materials_usage (materials_id, users_id, job_id) values(:materialsId, :usersId,:jobId)";
		Long insertedId = null;

		try (Connection con = sql2o.open()) {

			Long key = con.createQuery(sql, true).addParameter("materialsId", materialsId)
					.addParameter("usersId", userId).addParameter("jobId", jobId).executeUpdate().getKey(Long.class);
			insertedId = key;
		} catch (Sql2oException e) {
			System.out.println("Failed to insert record");
		} catch (Exception e) {
			System.err.println(e.getLocalizedMessage() + e.getMessage());
		}
		if (insertedId != null) {
			addMUmeasurements(payLoadList, insertedId);
		}

		return insertedId;
	}

	private boolean addMUmeasurements(List<MaterialPropPayLoad> payLoadList, Long insertedId) {

		String sql = "insert into materials_usage_has_measurement_properties "
				+ "(materials_usage_id, measurement_properties_id, measurement) "
				+ "values(:materials_usage_id, :measurement_properties_id, :measurement)";

		try (Connection con = sql2o.open()) {

			for (MaterialPropPayLoad load : payLoadList) {

				con.createQuery(sql).addParameter("materials_usage_id", insertedId)
						.addParameter("measurement_properties_id", load.propertyId)
						.addParameter("measurement", load.propertyValue).executeUpdate();
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return false;

	}

	public List<Map<String, Object>> getAllMaterialUsage(String jobId) throws SQLException {
		// TODO Auto-generated method stub

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> measurements = new ArrayList<Map<String, Object>>();

		int jobid = Integer.parseInt(jobId);

		String sql = "select mu.*, m.description as material_desc,concat(u.name, ' ', u.surname) as name "
				+ " from materials_usage mu,  " + " users u, materials m where mu.job_id = " + jobid + " and "
				+ " m.id = mu.materials_id" + " and u.id = mu.users_id";

		try {
			try (Connection con = sql2o.open()) {
				Table table = con.createQuery(sql).setAutoDeriveColumnNames(true).executeAndFetchTable();

				list = tableToList(table);

				Iterator<Map<String, Object>> it = list.iterator();
				while (it.hasNext()) {
					Map<String, Object> record = it.next();

					measurements = getMeasurements(record.get("id").toString());
					record.put("measurements",measurements);
				}
			}
		} catch (Sql2oException e) {
			SQLException originalException = (SQLException) e.getCause();
			System.out.println(originalException);
		}
		return list;
	}

	private List<Map<String, Object>> getMeasurements(String usageId) {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		String sql = "select mu.id,mp.description,muhmp.measurement "
				+ "from materials_usage mu, measurement_properties mp, materials_usage_has_measurement_properties muhmp"
				+ " where mu.id = muhmp.materials_usage_id and "
				+ "muhmp.measurement_properties_id = mp.id and mu.id = " + usageId;

		try (Connection con = sql2o.open()) {
			Table table = con.createQuery(sql).setAutoDeriveColumnNames(true).executeAndFetchTable();

			list = tableToList(table);
		}
		return list;

	}
}
