package RegisterTable;

import DataBaseOperations.GetUserData;

import java.sql.*;

public class SelectRegisterTable {
    public static void main(String[] args) {
        /*select all datas from register table*/
        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getServerUrl(), getUserData.getUser(), getUserData.getPassword());
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("select * from registerTable");
            while (resultSet.next()){
                System.out.println(
                        "id студента " + resultSet.getString("studentId") +
                        " Предмет "+ resultSet.getString("discipline"));
            }
            System.out.println("connection close...");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
