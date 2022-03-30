package StudentTable;

import DataBaseOperations.GetUserData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DropStudentTable {
    public static void main(String[] args) {
        /**
         *Drop table
         */
        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getServerUrl(), getUserData.getUser(), getUserData.getPassword());
             Statement statement = connection.createStatement()) {
            String delete = "drop table studentTable";
            statement.execute(delete);
            System.out.println("table delete successfully...");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
