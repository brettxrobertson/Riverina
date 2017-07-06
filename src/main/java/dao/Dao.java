package dao;

import org.sql2o.Sql2o;

public class Dao {
	
	public static Sql2o sql2o;
	//private final static String IP = "172.17.0.2";
	
	private final static String IP = "localhost";
    

	static{
		
		//
		
		//sql2o = new Sql2o("jdbc:mysql://162.243.40.230:3306/rmiDB?autoReconnect=true&useSSL=false", "root","riverina");
        sql2o = new Sql2o("jdbc:mysql://" + IP + ":3306/rimDB?useSSL=false", "root", "password");
		
    }
}
