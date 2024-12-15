<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>文章详情</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="fixed-top.css">
    <style>
        #user-menu {
            display: none;
            position: absolute;
            top: 70px; /* 距离欢迎消息下方 */
            left: 85%;  
            right: 0;   
            background-color: white;
            border: 1px solid #ccc;
            padding: 10px;
            list-style: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 150px; /* 设置固定宽度为200px */
        }
        
        body {
            font-family: Arial, sans-serif;
        }

        ul li{
            list-style: none;
            padding: 0;
            margin: 0;
            width: 80%;
            margin: 0 auto;  /* 将列表居中 */
        }
    </style>
</head>
<body>
<!-- 顶部导航栏 -->
<header id="header" class="header d-flex align-items-center fixed-top" style="background:linear-gradient(to left, rgb(21, 153, 87), rgb(21, 87, 153)); height:100px; width:100%; display: flex; justify-content: space-between; align-items: center;">
    <div class="container-fluid container-xl d-flex align-items-center" style="width:100%; display: flex; justify-content: space-between; align-items: center;">

        <!-- Logo 部分 -->
        <a href="/S3E1FinalEx/jiemian.jsp" class="logo d-flex align-items-center" style="flex-shrink: 0; display: inline-block;">
            <img src="/S3E1FinalEx/upload/article/images/index/logonew_1.png" style="width:100px; height:auto;">
            <img src="/S3E1FinalEx/upload/article/images/index/logonew_2.png" style="width:150px; height:auto;">
        </a>

        <!-- 导航栏部分 -->
        <nav class="d-flex align-items-center" style="display: flex; justify-content: center; align-items: center; width: auto; margin: 0 auto;">
            <ul style="display: flex; margin-bottom: 0; list-style: none; padding: 0;">
                <li><a href="/S3E1FinalEx/jiemian.jsp">首页</a></li>
                <li><a href="/S3E1FinalEx/NewsList.jsp?type=学院新闻">学院新闻</a></li>
                <li><a href="/S3E1FinalEx/NewsList.jsp?type=教务通知">教务通知</a></li>
                <li><a href="/S3E1FinalEx/NewsList.jsp?type=通知公告">通知公告</a></li>
                <li><a href="/S3E1FinalEx/NewsList.jsp?type=研究生教学">研究生教学</a></li>
                <li><a href="/S3E1FinalEx/NewsList.jsp?type=学术讲座">学术讲座</a></li>
                <li><a href="/S3E1FinalEx/NewsList.jsp?type=学生工作">学生工作</a></li>
                <li><a href="/S3E1FinalEx/NewsList.jsp?type=招聘信息">招聘信息</a></li>
            </ul>
        </nav>

        <!-- 登录按钮部分 -->
        <div style="margin-left: auto; display: flex; align-items: center;">
            <% 
                String username = (String) session.getAttribute("username");
                String userType = (String) session.getAttribute("UserType");
            %>
            <% if (username != null) { %>
                <!-- 显示欢迎信息并使其可点击 -->
                <span id="welcome-msg" style="color:white; font-size:16px; cursor:pointer;" onclick="toggleMenu()">
                    欢迎您，<%= username %>
                </span>

                <!-- 动态生成用户功能菜单 -->
                <ul id="user-menu" style="display:none; position:absolute; right:10px; background-color:white; border:1px solid #ccc; padding:10px; list-style:none; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                    <%
                 // 公共功能项，所有用户都能看到的功能
                    out.println("<li><a href='/S3E1FinalEx/jiemian.jsp'>首页</a></li>");
                    String[] commonItems = { "学院新闻", "教务通知", "通知公告", "研究生教学", "学术讲座", "学生工作", "招聘信息"};
                    for (String item : commonItems) {
                        out.println("<li><a href='/S3E1FinalEx/NewsList.jsp?type=" + item + "'>" + item + "</a></li>");
                    }

                        // 根据用户类型添加不同的菜单项
                        if (userType != null) {
                            if (userType.equals("教师")) {
                                out.println("<li><a href='/S3E1FinalEx/newsEditor.jsp'>上传文章</a></li>");
                            } else if (userType.equals("管理员")) {
                                out.println("<li><a href='/S3E1FinalEx/newsEditor.jsp'>上传文章</a></li>");
                                out.println("<li><a href='/S3E1FinalEx/ArticleManagement.jsp'>文章管理</a></li>");
                                out.println("<li><a href='/S3E1FinalEx/UserManagement.jsp'>用户管理</a></li>");
                            }
                        }
                    %>
                </ul>
            <% } else { %>
                <a id="login-btn" href="Login.html" style="color:white; font-size:16px;">登录</a>
            <% } %>
        </div>
    </div>
</header>

<!-- JavaScript部分 -->
<script>
    function toggleMenu() {
        var menu = document.getElementById('user-menu');
        // 切换菜单显示和隐藏
        if (menu.style.display === 'none' || menu.style.display === '') {
            menu.style.display = 'block';
        } else {
            menu.style.display = 'none';
        }
    }

    // 点击页面其他区域时关闭菜单
    window.onclick = function(event) {
        var menu = document.getElementById('user-menu');
        var welcomeMsg = document.getElementById('welcome-msg');
        // 如果点击的不是菜单或者用户名，则关闭菜单
        if (!menu.contains(event.target) && event.target !== welcomeMsg) {
            menu.style.display = 'none';
        }
    }
</script>


<!-- 主要内容部分 -->
    <main id="main">
        <section id="posts" class="posts">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <img src="/S3E1FinalEx/upload/article/images/index/bannernew1.jpg" id="webbanner" width="1300" height="270"/>
                    </div>
                    <ul>
                    <li>
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
                <!-- 标题居中 -->
                <h1 style="text-align: center;"><%= title %></h1>
                <!-- 发布日期居中 -->
                <p style="text-align: center;"><i>发布日期：<%= subDate %></i></p>
                <div><%= content %></div>
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
                    </li>
                    </ul>
                </div>
            </div>
        </section>
    </main>
    
    
<!-- 底部 -->
<footer>
    <p>学院官网 © 2024</p>
</footer>
</body>
</html>
