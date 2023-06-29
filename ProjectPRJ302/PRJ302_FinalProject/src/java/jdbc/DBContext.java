package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    public static Connection getConnect() {
        Connection connection = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;"
                    + "databaseName=QLNS;"
                    + "user=sa;"
                    + "password=123;"
                    + "useUnicode=true;"
                    + "characterEncoding=UTF-8");
            System.err.println("Successfully connected!");
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Fail to connect!" + e.getMessage());
        }
        return connection;
    }

    public static void main(String[] args) {
        System.out.println(getConnect());
    }
}
