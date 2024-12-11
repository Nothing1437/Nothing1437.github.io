<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserManager" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="fixed-top.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            margin-top: 100px;
        }

        .sidebar {
            width: 15%;
            padding: 15px;
            border-right: 1px solid #ccc;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 10px 0;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: blue;
            display: block;
        }

        .sidebar ul li a:hover {
            text-decoration: underline;
        }

        .main-content {
            width: 85%;
            padding: 15px;
        }

        .article-list table {
            width: 100%;
            border-collapse: collapse;
        }

        .article-list th, .article-list td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .article-list th {
            background-color: #f2f2f2;
        }
    </style>

</head>
<body>
    <header id="header" class="header d-flex align-items-center fixed-top" style="background:linear-gradient(to left, rgb(21, 153, 87), rgb(21, 87, 153)); height:100px; width:100%; display: flex; justify-content: space-between; align-items: center;">
        <div class="container-fluid container-xl d-flex align-items-center" style="width:100%; display: flex; justify-content: space-between; align-items: center;">
            <a href="/S3E1FinalEx/jiemian.jsp" class="logo d-flex align-items-center" style="flex-shrink: 0; display: inline-block;">
                <img src="/S3E1FinalEx/upload/article/images/index/logonew_1.png" style="width:100px; height:auto;">
                <img src="/S3E1FinalEx/upload/article/images/index/logonew_2.png" style="width:150px; height:auto;">
            </a>
        </div>
    </header>

    <div class="container">
        <div class="sidebar">
            <h3>用户类型</h3>
            <ul>
                <li><a href="loadUsers?type=学生">学生列表</a></li>
                <li><a href="loadUsers?type=教师">教师列表</a></li>
                <li><a href="loadUsers?type=管理员">管理员列表</a></li>
            </ul>
        </div>

        <div class="main-content">
            <h2>用户管理</h2>
            <div class="article-list">
                <table id="article-table">
                    <thead>
                        <tr>
                            <th>账号</th>
                            <th>密码</th>
                            <th>姓名</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<UserManager> users = (List<UserManager>) request.getAttribute("users");
                            if (users != null) {
                                for (UserManager user : users) {
                        %>
                        <tr>
                            <td><%= user.getId() %></td>
                            <td><%= user.getPwd() %></td>
                            <td><%= user.getName() %></td>
                        </tr>
                        <% 
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
