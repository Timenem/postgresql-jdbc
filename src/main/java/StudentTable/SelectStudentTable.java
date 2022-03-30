package StudentTable;

import DataBaseOperations.GetUserData;

import java.sql.*;

public class SelectStudentTable {
    public static void main(String[] args) {
        /*select all datas from table*/
        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getServerUrl(), getUserData.getUser(), getUserData.getPassword());
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("select * from studentTable");
            while (resultSet.next()){
                System.out.println(
                        "Имя " + resultSet.getString("firstName") +
                        " Фамилия "+ resultSet.getString("lastName")+
                        " Группа " + resultSet.getInt("groupNum"));
            }
            System.out.println("connection close...");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
