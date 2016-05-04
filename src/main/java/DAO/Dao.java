package DAO;

import org.sql2o.Sql2o;

public class Dao {
	
	public static Sql2o sql2o;

    

	static{
		
		//sql2o = new Sql2o("jdbc:mysql://162.243.40.230:3306/rmiDB?autoReconnect=true&useSSL=false", "root","riverina");
        sql2o = new Sql2o("jdbc:mysql://192.168.99.100:3306/rimDB?useSSL=false", "root", "password");
		
    }
}
