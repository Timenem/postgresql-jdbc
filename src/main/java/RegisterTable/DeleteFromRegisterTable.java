package RegisterTable;

import DataBaseOperations.GetUserData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteFromRegisterTable {
    public void deleteData(Integer  registerId){
        /**
         * insert data into table
         * @param  registerId - register id
         */

        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getServerUrl(), getUserData.getUser(), getUserData.getPassword());
             PreparedStatement preparedStatement = connection.prepareStatement("delete from registerTable where id= ?")) {
            preparedStatement.setInt(1,  registerId);
            preparedStatement.executeUpdate();
            System.out.println("delete successfully...");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args){
        DeleteFromRegisterTable delete = new DeleteFromRegisterTable();
        delete.deleteData(4);
    }
}
