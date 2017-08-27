import controllers.Controller;
import dao.Dao;
import model.Sql2oModel;

public class Main {

	public static void main(String[] args) {
		
		try{
		new Controller(new Sql2oModel(Dao.sql2o));
		}catch(Exception e){
			
			System.out.print(e.getLocalizedMessage());
			
			e.printStackTrace();
		}
		    
	}

}
