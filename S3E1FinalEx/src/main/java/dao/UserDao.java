package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    // 数据库连接配置
    private String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String url = "jdbc:sqlserver://localhost:1433;databaseName=S3E1JavaEEFinal;characterEncoding=UTF-8";

    private String dbUser = "sa";
    private String dbPwd = "123456";



    public List<UserManager> getUsersByType(String type) {
        List<UserManager> user = new ArrayList<>();
        try {
            Class.forName(driver); // 加载数据库驱动
            Connection conn = DriverManager.getConnection(url, dbUser, dbPwd); // 建立连接

            String sql = "SELECT  UserID, UserPwd, UserName  FROM Users WHERE UserType = ? ORDER BY UserID DESC"; // 查询前五篇文章
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, type);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String UserId = rs.getString("UserID");
                String UserPwd = rs.getString("UserPwd");
                String UserName=rs.getString("UserName");

                user.add(new UserManager(UserId, UserPwd, UserName)); // 添加到文章列表
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
 // 更新用户信息
    public boolean updateUser(String userId, String newPwd, String newName) {
        boolean result = false;
        try {
            Class.forName(driver); // 加载数据库驱动
            Connection conn = DriverManager.getConnection(url, dbUser, dbPwd); // 建立连接

            String sql = "UPDATE Users SET UserPwd = ?, UserName = ? WHERE UserID = ?"; // 更新用户的密码和姓名
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPwd);
            pstmt.setString(2, newName);
            pstmt.setString(3, userId);

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                result = true; // 如果更新成功，返回true
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 删除用户
    public boolean deleteUser(String userId) {
        boolean result = false;
        try {
            Class.forName(driver); // 加载数据库驱动
            Connection conn = DriverManager.getConnection(url, dbUser, dbPwd); // 建立连接

            String sql = "DELETE FROM Users WHERE UserID = ?"; // 删除用户
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);

            int rowsDeleted = pstmt.executeUpdate();
            if (rowsDeleted > 0) {
                result = true; // 如果删除成功，返回true
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public boolean addUser(String userId, String userPwd, String userName, String userType) {
        boolean result = false;
        try {
            Class.forName(driver); // 加载数据库驱动
            Connection conn = DriverManager.getConnection(url, dbUser, dbPwd); // 建立连接

            String sql = "INSERT INTO Users (UserID, UserPwd, UserName, UserType) VALUES (?, ?, ?, ?)"; // 插入新用户
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPwd);
            pstmt.setString(3, userName);
            pstmt.setString(4, userType);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                result = true; // 如果插入成功，返回true
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

 

}
