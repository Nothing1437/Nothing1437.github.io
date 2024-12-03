<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>文章详情</title>
</head>
<body>
    <%
        int id = Integer.parseInt(request.getParameter("id"));

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

            String sql = "SELECT Title, Content, SubDate FROM Articles WHERE ArticleID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                String title = rs.getString("Title");
                String content = rs.getString("Content");
                Date subDate = rs.getDate("SubDate");
    %>
                <h1><%=title%></h1>
                <p><i>发布日期：<%=subDate%></i></p>
                <div><%=content%></div>
    <%
            } else {
    %>
                <p>文章不存在。</p>
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
</body>
</html>
