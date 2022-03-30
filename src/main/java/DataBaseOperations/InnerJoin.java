package DataBaseOperations;

import java.sql.*;

public class InnerJoin {
    public static void main(String[] args) {
        /*select all datas from register table*/
        GetUserData getUserData = new GetUserData();
        try (Connection connection = DriverManager.getConnection(getUserData.getServerUrl(), getUserData.getUser(), getUserData.getPassword());
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery("select * from studenttable s  inner join registertable r  on s.id = r.studentid");
            while (resultSet.next()){
                System.out.println("{");
                System.out.println("\tstudent_id:" + resultSet.getInt("id"));
                System.out.println("\tfirst_name:" + resultSet.getString("firstName"));
                System.out.println("\tlast_name:" +resultSet.getString("lastName"));
                System.out.println("\tgroup:" +resultSet.getInt("groupNum"));
                System.out.println("\tstudent_id:" +resultSet.getInt("studentid"));
                System.out.println("\tdiscipline:" +resultSet.getString("discipline"));
                System.out.println("}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

