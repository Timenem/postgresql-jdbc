package StudentTable;

import DataBaseOperations.GetUserData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateStudentTable {
    public static void main(String[] args) {
        /**
         * Create table if not exist
         */
        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getServerUrl(), getUserData.getUser(), getUserData.getPassword());
             Statement statement = connection.createStatement()) {
            String createTable = "create table if not exists studentTable (" +
                    "id serial primary key,"+
                    "firstName varchar(250)," +
                    "lastName varchar(250)," +
                    "groupNum int);";
            statement.execute(createTable);
            System.out.println("table created successfully...");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
