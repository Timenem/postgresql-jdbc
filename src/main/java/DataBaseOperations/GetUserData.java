package DataBaseOperations;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class GetUserData {
    static Properties properties = new Properties();

    public String getUser(){
        /**
        * Get user name
        */
        String USER="";
        try {
            FileInputStream fileinputStream = new FileInputStream("src/main/resources/data.properties");
            properties.load(fileinputStream);
            USER = properties.getProperty("user");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return USER ;
    }

    public String getPassword(){
        /**
         * Get user password
         */
        String PASSWORD="";
        try {
            FileInputStream fileinputStream = new FileInputStream("src/main/resources/data.properties");
            properties.load(fileinputStream);
            PASSWORD = properties.getProperty("password");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return PASSWORD;
    }

    public String getUrl(){
        /**
         * Get localhost url
         */
        String URL="";
        try {
            FileInputStream fileinputStream = new FileInputStream("src/main/resources/data.properties");
            properties.load(fileinputStream);
            URL = properties.getProperty("url");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return URL;
    }

    public String getServerUrl(){

        String SERVER_URL = "";
        try {
            FileInputStream fileinputStream = new FileInputStream("src/main/resources/data.properties");
            properties.load(fileinputStream);
            SERVER_URL = properties.getProperty("serverUrl");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return SERVER_URL;
    }
}