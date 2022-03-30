package RegisterTable;

import DataBaseOperations.GetUserData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DropRegisterTable {
    public static void main(String[] args) {
        /**
         *Drop register table
         */
        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getServerUrl(), getUserData.getUser(), getUserData.getPassword());
             Statement statement = connection.createStatement()) {
            String delete = "drop table registertable";
            statement.execute(delete);
            System.out.println("table delete successfully...");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
