package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NewsServlet.action")
public class NewsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        

        String action = request.getParameter("action"); // 获取 action 参数
        if ("login".equals(action)) {
            handleLogin(request, response); // 处理登录功能
        } else {
            response.getWriter().println("未知操作");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();

        // 获取表单数据
        String userId = request.getParameter("userid");
        String userPwd = request.getParameter("userpwd");

        // 数据库连接信息
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://localhost:1433;databaseName=S3E1JavaEEFinal;characterEncoding=UTF-8";
        String dbUser = "sa";
        String dbPwd = "123456";

        try {
            // 加载数据库驱动
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, dbUser, dbPwd);

            // SQL 查询，除了查询用户名，还要查询 UserType
            String sql = "SELECT UserName, UserType FROM Users WHERE UserID = ? AND UserPwd = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPwd);

            // 执行查询
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                // 登录成功，获取用户名和用户类型
                String userName = rs.getString("UserName");
                String userType = rs.getString("UserType");

                // 将用户名和用户类型存储到 session 中
                request.getSession().setAttribute("username", userName); 
                request.getSession().setAttribute("UserType", userType);

                // 跳转到首页
                response.sendRedirect("jiemian.jsp"); 
            } else {
                // 登录失败
                out.println("<script>alert('登录失败，请检查账号或密码！');history.back();</script>");
            }

            // 关闭资源
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('系统错误，请稍后重试！');history.back();</script>");
        }
    }
}
