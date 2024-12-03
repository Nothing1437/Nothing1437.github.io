package dao;

import java.sql.*;

public class ArticleDao {
    // 数据库连接配置
    private String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String url = "jdbc:sqlserver://localhost:1433;databaseName=S3E1JavaEEFinal;characterEncoding=UTF-8";

    private String dbUser = "sa";
    private String dbPwd = "123456";

    // 根据文章编号查询文章
    public String getArticleContentByID(int id) {
        String content = null;
        try {
            Class.forName(driver); // 加载数据库驱动
            Connection conn = DriverManager.getConnection(url, dbUser, dbPwd); // 建立连接

            String sql = "SELECT Content FROM Articles WHERE ArticleID = ?"; // 查询文章内容
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                content = rs.getString("Content"); // 获取文章内容
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return content;
    }

    // 插入文章内容
    public boolean insertArticle(String title, String content, String type) {
        boolean result = false;
        try {
            Class.forName(driver); // 加载数据库驱动
            Connection conn = DriverManager.getConnection(url, dbUser, dbPwd); // 建立连接

            String sql = "INSERT INTO Articles (Title, Content, SubDate, Type) VALUES (?, ?, GETDATE(), ?)"; // 插入文章
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, type);

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
