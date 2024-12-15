<%@ page language="java" import="java.util.Enumeration" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>wangEditor default mode</title>
  <link href="editer/normalize.min.css" rel="stylesheet">
  <link href="editer/style.css" rel="stylesheet">
  <link href="editer/layout.css" rel="stylesheet">
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
<form name="form1" method="post" action="SubmitArticle.jsp">  
  标题：<input type="text" name="title" style="width:755px"><br><br>
  类型：
  <select name="type" style="width:755px">
    <option value="学院新闻">学院新闻</option>
    <option value="教务通知">教务通知</option>
    <option value="通知公告">通知公告</option>
    <option value="研究生教学">研究生教学</option>
    <option value="学术讲座">学术讲座</option>
    <option value="学生工作">学生工作</option>
    <option value="招聘信息">招聘信息</option>
  </select>
  <br><br>

<!-- 将当前用户的用户名传递给后台 -->
  <input type="hidden" name="subName" value="<%= session.getAttribute("username") %>" />

  <input type=hidden name="newstxt" id="newstxt" />
  <div class="page-container"> 
    <div class="page-right">
      <div style="border: 1px solid #ccc;width:800px">
        <div id="editor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
        <div id="editor-text-area" style="height: 300px;"></div>
      </div><br>
      <input type="submit" value="提交" /> 
    </div>
  </div>
</form>

<script src="editer/index.js"></script>
<script>
  const E = window.wangEditor
  const LANG = location.href.indexOf('lang=en') > 0 ? 'en' : 'zh-CN'
  E.i18nChangeLanguage(LANG)

  window.editor = E.createEditor({
  selector: '#editor-text-area',
  html: '<%= request.getParameter("content") != null ? request.getParameter("content") : "<p><br></p>" %>',
  config: {
    placeholder: 'Type here...',
    MENU_CONF: {
      uploadImage: {
        fieldName: 'your-fileName',
        base64LimitSize: 10 * 1024 * 1024 // 10M 以下插入 base64
      }
    },
    onChange(editor) {
      document.getElementById('newstxt').value = editor.getHtml()
    }
  }
})

  window.toolbar = E.createToolbar({
    editor,
    selector: '#editor-toolbar',
    config: {}
  })
</script>
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