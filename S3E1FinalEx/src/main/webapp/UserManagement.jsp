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
            <h2>用户管理<button id="addUserButton">添加用户</button></h2>
            
            <!-- 添加用户的对话框 -->
<div id="addUserDialog" style="display:none;">
    <h3>添加新用户</h3>
    <form id="addUserForm" action="loadUsers" method="post" accept-charset="UTF-8">
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="userType" value="<%= request.getParameter("type") %>"> <!-- 当前用户类型 -->

        <label for="userId">账号:</label>
        <input type="text" id="userId" name="userId" required><br>

        <label for="userPwd">密码:</label>
        <input type="password" id="userPwd" name="userPwd" required><br>

        <label for="userName">姓名:</label>
        <input type="text" id="userName" name="userName" required><br>

        <button type="submit">提交</button>
        <button type="button" id="closeDialog">关闭</button>
    </form>
</div>

<!-- 弹出对话框的脚本 -->
<script>
    document.getElementById("addUserButton").onclick = function() {
        document.getElementById("addUserDialog").style.display = "block";
    };

    document.getElementById("closeDialog").onclick = function() {
        document.getElementById("addUserDialog").style.display = "none";
    };
</script>
            
            <div class="article-list">
                <table id="article-table">
                    <thead>
                        <tr>
                            <th>账号</th>
                            <th>密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名</th>
                        </tr>
                    </thead>
<%-- 表格显示用户列表 --%>
<tbody>
    <% 
        List<UserManager> users = (List<UserManager>) request.getAttribute("users");
        if (users != null) {
            for (UserManager user : users) {
    %>
    <tr id="<%= user.getId() %>">
        <!-- 用户ID（只读） -->
        <td><input class="input-field" type="text" value="<%= user.getId() %>" readonly></td>
      
        <!-- 操作列：更新和删除按钮 -->
        <td>
            <!-- 更新操作 -->
            <form action="loadUsers" method="post" style="display:inline;" accept-charset="UTF-8">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="userId" value="<%= user.getId() %>">
                <input type="text" name="newPwd" value="<%= user.getPwd() %>" placeholder="新密码">
                <input type="text" name="newName" value="<%= user.getName() %>" placeholder="新姓名">
                <input type="submit" value="更新">
            </form>

            
            <!-- 删除操作 -->
            <form action="loadUsers" method="post" style="display:inline;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="userId" value="<%= user.getId() %>">
                <input type="submit" value="删除">
            </form>
        </td>
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
