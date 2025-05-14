package com.db;
import java.sql.*;

public class DbConnect {
    
    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null || con.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmermarcket", "root", "tushar@0088");
                System.out.println("Database Connected Successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
