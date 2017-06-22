package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.SortedMap;
import java.util.TreeMap;

import org.sql2o.Connection;
import org.sql2o.Sql2o;
import org.sql2o.Sql2oException;
import org.sql2o.data.Table;

import controllers.CustomerController;
import controllers.EngineerController;
import controllers.UserController;
import spark.Request;

public class Sql2oModel implements CustomerController, EngineerController, UserController {

	private Sql2o sql2o;

	private Integer pageLimit = 8;

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
	public List<Engineer> getAllEngineers(Integer page) {

		String sql = "select users.* from users left join user_types on users.user_types_id = user_types.id where user_types.description = 'Engineer' limit "
				+ pageLimit + " offset " + pageLimit * page;

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
		String sql = "SELECT * from customers";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).setAutoDeriveColumnNames(true).executeAndFetch(Customer.class);
		}
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
	public List<Job> getAllJobs(Integer page) {

		String paging = "limit " + pageLimit + " offset " + pageLimit * page;
		
		String sql = "SELECT * from jobs " + paging;

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).throwOnMappingFailure(false).setAutoDeriveColumnNames(true)
					.executeAndFetch(Job.class);
		}
	}

	/**
	 * @return
	 */
	public List<Job> getAllJobsByStatus(JobStatus status) {

		
		String sql = "SELECT j.* from jobs j, job_status js where j.job_status_id = js.id and js.description = '" + status.getDescription() + "'";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).throwOnMappingFailure(false).setAutoDeriveColumnNames(true)
					.executeAndFetch(Job.class);
		}
	}

	
	/**
	 * @return
	 */
	public void addJob(Map<String, String> pairs) {

		String sql = "insert into jobs (date, job_name, customer_id, notes, users_id, job_status_id) "
				+ "values(:date, :job_name, :customer_id, :notes, :users_id, :job_status_id)";

		try (Connection con = sql2o.open()) {

			int createId = con.createQuery(sql).addParameter("date", pairs.get("date"))
					.addParameter("job_name", pairs.get("jobDescription"))
					.addParameter("customer_id", pairs.get("customer_id")).addParameter("notes", pairs.get("notes"))
					.addParameter("users_id", pairs.get("users_id")).addParameter("job_status_id", 4).executeUpdate()
					.getKey(Integer.class);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public List<MaterialTypes> getAllMaterialTypes() {

		String sql = "select * from material_types";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).throwOnMappingFailure(false).setAutoDeriveColumnNames(true)
					.executeAndFetch(MaterialTypes.class);
		}

	}

	public List<MaterialTypes> getAllParentMaterialTypes(Integer page) {

		String sql = "select * from material_types where parent_types_id is null limit " + pageLimit + " offset "
				+ pageLimit * page;
		System.out.println(sql);
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

	public List<Map<String, Object>> getMaterialsByTypeId(Integer id, Integer page) {

		// String sql = "select m.*,mp.id as measurement_properties_id, " +
		// "mp.description as property_description,"
		// + " mhmp.measurement from materials m," + "
		// materials_has_measurement_properties mhmp,"
		// + "measurement_properties mp" + " where m.id = mhmp.materials_id and
		// "
		// + "mhmp.measurement_properties_id = mp.id and" + " material_types_id
		// = :id";

		String sql = "select * from materials where material_types_id = :id limit " + pageLimit + " offset "
				+ pageLimit * page;

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

	public List<MaterialTypes> getMaterialTypeChildren(Integer id, Integer page) {

		String sql = "select id, description,UOM, parent_types_id "
				+ "parentTypesId from material_types where parent_types_id = :id limit " + pageLimit + " offset "
				+ pageLimit * page;

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

		String sql = "insert into materials_usage (materials_id, users_id, job_id,cost_price,markup_percent) "
				+ "values(:materialsId, :usersId,:jobId,(select cost_price from materials where id = :materialsId),(select markup_percent from materials where id = :materialsId))";
		Long insertedId = null;

		try (Connection con = sql2o.open()) {

			Long key = con.createQuery(sql, true).addParameter("materialsId", materialsId)
					.addParameter("usersId", userId)
					.addParameter("jobId", jobId)
					.addParameter("materialsId", materialsId)
					.addParameter("materialsId", materialsId)
					.executeUpdate().getKey(Long.class);
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

		String sql = "select mu.*,m.cost_price,m.markup_percent, m.description as material_desc,"
				+ "concat(u.name, ' ', u.surname) as name "
				+ " from materials_usage mu,  " + " users u, materials m where mu.job_id = " + jobid + " and "
				+ " m.id = mu.materials_id" + " and u.id = mu.users_id";

		try {
			try (Connection con = sql2o.open()) {
				Table table = con.createQuery(sql).setAutoDeriveColumnNames(true).executeAndFetchTable();

				list = tableToList(table);

				Iterator<Map<String, Object>> it = list.iterator();
				while (it.hasNext()) {
					Map<String, Object> record = it.next();

					measurements = getMUMeasurements(record.get("id").toString());
					record.put("measurements", measurements);
				}
			}
		} catch (Sql2oException e) {
			SQLException originalException = (SQLException) e.getCause();
			System.out.println(originalException);
		}
		return list;
	}

	public List<Map<String, Object>> getMUMeasurements(String usageId) {

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

	public List<MeasurementProperty> getAllMeasurementProperties() {

		String sql = "select * from measurement_properties";

		try (Connection con = sql2o.open()) {

			return con.createQuery(sql).throwOnMappingFailure(false).setAutoDeriveColumnNames(true)
					.executeAndFetch(MeasurementProperty.class);
		}

	}

	public List<Map<String, Object>> getJobHeader(String id) {

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		String sql = "select j.job_name,j.notes,j.date, c.name as customer_name, "
				+ "concat(u.name,' ', u.surname) as user_name," + " js.description as job_status from jobs j, "
				+ "customers c, users u, job_status js " + "where j.customer_id = c.id and "
				+ "u.id = j.users_id and js.id = j.job_status_id " + "and j.id = " + id;

		try (Connection con = sql2o.open()) {
			Table table = con.createQuery(sql).setAutoDeriveColumnNames(true).executeAndFetchTable();

			list = tableToList(table);
		}
		return list;
	}

	@Override
	public List<Engineer> getAllEngineers() {
		// TODO Auto-generated method stub
		return null;
	}

	public void addMaterial(Map<String, String> params) {
		String sql = "insert into materials (description,cost_price,qty_on_hand,material_types_id,markup_percent) "
				+ "values(:description,:cost_price,:qty_on_hand,:material_types_id,:markup_percent)";
		
		String sql_mhmp = "insert into materials_has_measurement_properties (materials_id, measurement_properties_id, measurement)"
				+ " values(:materials_id, :measurement_properties_id, :measurement)";
		
		
		TreeMap<String, Object> treeMap = new TreeMap<String, Object>();
		treeMap.putAll(params);
		Map<String, Object> mprops = new TreeMap<String, Object>();

		mprops.putAll(getByPrefix(treeMap, "mprop"));
		Iterator<Entry<String, Object>> it = mprops.entrySet().iterator();

		try (Connection con = sql2o.open()) {

			int materialId = con.createQuery(sql).addParameter("description", params.get("description"))
					.addParameter("cost_price", params.get("costPrice"))
					.addParameter("qty_on_hand", params.get("qtyOnHand"))
					.addParameter("material_types_id", params.get("materialTypeID"))
					.addParameter("markup_percent", params.get("markUp")).executeUpdate().getKey(Integer.class);

			while (it.hasNext()) {
				
				Map.Entry<String,Object> pair = (Entry<String, Object>)it.next();
				
				String id = pair.getKey().toString().substring(6);
				String val = pair.getValue().toString();
				
				if(val.equals("")){
					val = null;
				}
				
				try{
				int mhmpId = con.createQuery(sql_mhmp).addParameter("materials_id",  materialId)
						.addParameter("measurement_properties_id", id)
						.addParameter("measurement", val).executeUpdate().getKey(Integer.class);
				}catch(Exception e){
					//swallow the exception here as null value param throws exception
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	private static SortedMap<String, Object> getByPrefix(NavigableMap<String, Object> myMap, String prefix) {
		return myMap.subMap(prefix, prefix + Character.MAX_VALUE);
	}

}
