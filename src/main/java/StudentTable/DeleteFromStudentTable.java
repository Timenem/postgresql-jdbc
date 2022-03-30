package StudentTable;

import DataBaseOperations.GetUserData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteFromStudentTable {
    public void deleteData(Integer studentId){
        /**
         * delete data from student table
         * @param studentId - student id
         */

        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getServerUrl(), getUserData.getUser(), getUserData.getPassword());
             PreparedStatement preparedStatement = connection.prepareStatement("delete from studentTable where id= ?")) {
            preparedStatement.setInt(1, studentId);
            preparedStatement.executeUpdate();
            System.out.println("delete successfully");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args){
        DeleteFromStudentTable delete = new DeleteFromStudentTable();
        delete.deleteData(3);
    }
}
