package com.shop.computer;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestJdbc {
    public static void main(String[] args) {

        String jdbcUrl = "jdbc:mysql://localhost:3306/compshop?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false";
        String user = "admin";
        String password = "admin";

        try {
            System.out.println("connecting to db...");
            Connection conn = DriverManager.getConnection(jdbcUrl, user, password);
            System.out.println("connection successful!");


        } catch (Exception exc) {
            exc.printStackTrace();
        }
    }
}
