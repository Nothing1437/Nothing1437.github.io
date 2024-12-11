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


    // 插入文章内容
    public boolean insertUser(String title, String content, String type, String subName) {
        boolean result = false;
        try {
            Class.forName(driver); // 加载数据库驱动
            Connection conn = DriverManager.getConnection(url, dbUser, dbPwd); // 建立连接

            String sql = "INSERT INTO Articles (Title, Content, SubDate, Type, SubName) VALUES (?, ?, GETDATE(), ?, ?)"; // 插入文章
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, type);
            pstmt.setString(4, subName); // 传递当前用户名

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

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
 // 删除指定ID的文章
    public boolean deleteArticleById(int id) {
        boolean result = false;
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, dbUser, dbPwd);

            String sql = "DELETE FROM Articles WHERE ArticleID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 更新文章
    public boolean updateArticle(String title, String content,String subName,String Type,int id) {
        boolean result = false;
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, dbUser, dbPwd);

            String sql = "UPDATE Articles SET Title = ?, Content = ?, SubName = ?, Type = ? WHERE ArticleID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, subName);
            pstmt.setString(4, Type);
            pstmt.setInt(5, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    } 

}
