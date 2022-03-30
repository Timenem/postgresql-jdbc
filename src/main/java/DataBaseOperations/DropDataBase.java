package DataBaseOperations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DropDataBase {
    public static void main(String[] args) {
        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getUrl(), getUserData.getUser(), getUserData.getPassword());
             Statement statement = connection.createStatement()) {
            String delete = "DROP DATABASE students";
            statement.execute(delete);
            System.out.println("database delete successfully...");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
