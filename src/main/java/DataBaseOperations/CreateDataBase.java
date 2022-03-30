package DataBaseOperations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateDataBase  extends GetUserData {
    public static void main(String[] args) {
        /**
         * Create database if not exist
         */
        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getUrl(), getUserData.getUser(), getUserData.getPassword());
             Statement statement = connection.createStatement()) {
            String createdatabase = "create database students ";
            statement.execute(createdatabase);
            System.out.println("base created successfully");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
