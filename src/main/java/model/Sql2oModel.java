package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sql2o.Connection;
import org.sql2o.Query;
import org.sql2o.Sql2o;
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

		String sql = "select m.*,mp.id as measurement_properties_id, " + "mp.description as property_description,"
				+ " mhmp.measurement from materials m," + " materials_has_measurement_properties mhmp,"
				+ "measurement_properties mp" + " where m.id = mhmp.materials_id and "
				+ "mhmp.measurement_properties_id = mp.id and" + " material_types_id = :id";

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

		String sql = "select mthmp.measurement_properties_id as id, mp.description from "
				+ "material_types_has_measurement_properties mthmp, measurement_properties mp, material_types mt"
				+ " where mt.id = :id and mthmp.material_types_id = mt.id and mp.id = mthmp.measurement_properties_id";

		try (Connection con = sql2o.open()) {

//			Table table = con.createQuery(sql).addParameter("id", id).setAutoDeriveColumnNames(true)
//					.executeAndFetchTable();
//
//			return tableToList(table);
			
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
}
