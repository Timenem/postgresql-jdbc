package StudentTable;

import DataBaseOperations.GetUserData;

import java.sql.*;

public class InsertStudentTable {

    public void insertDataToTable(String firstName, String lastName, Integer groupNum){
        /**
         * insert data into table
         * @param firstName - student name
         * @param lastName - student last name
         * @param group - student group
         */

        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getServerUrl(), getUserData.getUser(), getUserData.getPassword());
             PreparedStatement preparedStatement = connection.prepareStatement("insert into studentTable (firstName , lastName, groupNum)values(?,?,?)")) {
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setInt(3, groupNum);
            preparedStatement.execute();
            System.out.println("insert successfully");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args){
        InsertStudentTable insertStudentTable = new InsertStudentTable();
        insertStudentTable.insertDataToTable("bella","hwal",343);
        insertStudentTable.insertDataToTable("ravon","dell",325);
        insertStudentTable.insertDataToTable("crees","bell",325);
    }
}