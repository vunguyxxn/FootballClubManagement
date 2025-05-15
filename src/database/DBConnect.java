package database;
import java.sql.*;

public class DBConnect {
    private static final String URL = "jdbc:mysql://localhost:3306/footballclubmanagement";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "123456";

    public static Connection getConnection() {
        try {
            System.out.println("⏳ Đang kết nối đến MySQL...");
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("✅ Kết nối MySQL thành công!");
            return conn;
        } catch (SQLException e) {
            System.out.println("❌ Không thể kết nối đến MySQL:");
            e.printStackTrace();
            return null;
        }
    }
}
