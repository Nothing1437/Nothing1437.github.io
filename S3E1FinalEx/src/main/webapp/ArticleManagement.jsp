<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ArticleManager" %>
<html>
<head>
    <title>文章管理</title>
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
        
        .article-list th:nth-child(1) {
            width: 750px;
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
            <h3>文章类型</h3>
            <ul>
                <li><a href="loadArticles?type=学院新闻">学院新闻</a></li>
                <li><a href="loadArticles?type=教务通知">教务通知</a></li>
                <li><a href="loadArticles?type=通知公告">通知公告</a></li>
                <li><a href="loadArticles?type=研究生教学">研究生教学</a></li>
                <li><a href="loadArticles?type=学术讲座">学术讲座</a></li>
                <li><a href="loadArticles?type=学生工作">学生工作</a></li>
                <li><a href="loadArticles?type=招聘信息">招聘信息</a></li>
            </ul>
        </div>

        <div class="main-content">
            <h2>文章管理</h2>
            <div class="article-list">
                <table id="article-table">
                    <thead>
                        <tr>
                            <th>标题</th>
                            <th>上传人</th>
                            <th>发布日期</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<ArticleManager> articles = (List<ArticleManager>) request.getAttribute("articles");
                            if (articles != null) {
                                for (ArticleManager article : articles) {
                        %>
                        <tr>
                            <td><%= article.getTitle() %></td>
                            <td><%= article.getSubName() %></td>
                            <td><%= article.getSubDate() %></td>
                                <!-- 更新和删除按钮 -->
                            <td>
                            <a href="updateArticle.jsp?articleId=<%= article.getId() %>">
                                   <button>更新</button>
                            </a>
    <!-- 删除按钮，点击时提交删除请求 -->
    <form action="loadArticles" method="POST" style="display:inline;">
        <input type="hidden" name="deleteArticleId" value="<%= article.getId() %>">
        <button type="submit">删除</button>
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
