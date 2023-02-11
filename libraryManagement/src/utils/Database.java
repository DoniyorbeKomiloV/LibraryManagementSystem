package utils;

import java.sql.Connection;
import java.sql.DriverManager;
public class Database {
    
    public static Connection connectDB(){
        try{
        Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/lms?autoReconnect=true&useSSL=false", "root", "");
        }catch(Exception e){e.printStackTrace();}
        
        return null;
    }
    
}
