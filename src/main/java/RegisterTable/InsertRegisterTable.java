package RegisterTable;

import DataBaseOperations.GetUserData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertRegisterTable {

    public void insertDataToRegisterTable(Integer studentId, String discipline){
        /**
         * insert data into table
         * @param studentId - student id from studentTable
         * @param discipline - student discipline
         */

        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getServerUrl(), getUserData.getUser(), getUserData.getPassword());
             PreparedStatement preparedStatement = connection.prepareStatement("insert into registertable (studentid , discipline)values(?,?)")) {
            preparedStatement.setInt(1, studentId);
            preparedStatement.setString(2, discipline);
            preparedStatement.execute();
            System.out.println("insert successfully...");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args){
        InsertRegisterTable insertRegisterTable = new InsertRegisterTable();
        insertRegisterTable.insertDataToRegisterTable(2,"literature");
        insertRegisterTable.insertDataToRegisterTable(2,"mathematic");
    }
}