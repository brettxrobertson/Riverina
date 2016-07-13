import controllers.Controller;
import dao.Dao;
import model.Sql2oModel;

public class Main {

	public static void main(String[] args) {
		
		new Controller(new Sql2oModel(Dao.sql2o));
		    
	}

}
