<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>学院新闻</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        ul {
            list-style: none;
        }
        ul li {
            margin: 10px 0;
        }
        ul li a {
            text-decoration: none;
            color: blue;
        }
        ul li a:hover {
            text-decoration: underline;
        }
    </style>
    
</head>
<body>
    <h1>学院新闻</h1>
    <ul>
        <%
        
        String type = request.getParameter("type");

        // 确保 type 不为空，若为空则返回提示或默认值
        if (type == null || type.isEmpty()) {
            out.println("<p>未提供新闻类型！</p>");
            return;
        }

            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=S3E1JavaEEFinal;characterEncoding=UTF-8";
            String dbUser = "sa";
            String dbPwd = "123456";

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName(driver);
                conn = DriverManager.getConnection(url, dbUser, dbPwd);

                String sql = "SELECT ArticleID, Title FROM Articles WHERE Type = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, type);

                rs = pstmt.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("ArticleID");
                    String title = rs.getString("Title");
        %>
                    <li><a href="/S3E1FinalEx/ArticleDetails.jsp?id=<%=id%>"><%=title%></a></li>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
    </ul>
</body>
</html>
