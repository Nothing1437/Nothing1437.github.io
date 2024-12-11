<%@ page language="java" import="java.sql.*, java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>更新文章</title>
  <link href="editer/normalize.min.css" rel="stylesheet">
  <link href="editer/style.css" rel="stylesheet">
  <link href="editer/layout.css" rel="stylesheet">
  <script src="editer/index.js"></script>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    .container {
      width: 80%;
      margin: 0 auto;
    }
  </style>
</head>
<body>

  <% 
    // 获取文章ID
    String articleId = request.getParameter("articleId");
    if (articleId != null) {
        // 根据文章ID查询数据库，获取文章的内容和其他信息
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://localhost:1433;databaseName=S3E1JavaEEFinal;characterEncoding=UTF-8";
        String dbUser = "sa";
        String dbPwd = "123456";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
        	conn = DriverManager.getConnection(url, dbUser, dbPwd); // 建立连接
            String sql = "SELECT * FROM Articles WHERE ArticleID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(articleId));
            rs = ps.executeQuery();

            if (rs.next()) {
                String title = rs.getString("Title");
                String content = rs.getString("Content");
                String type = rs.getString("Type");
                String subName = rs.getString("SubName");
                String subDate = rs.getString("SubDate");

                // 将文章的内容传递到前端页面
                request.setAttribute("title", title);
                request.setAttribute("content", content);
                request.setAttribute("type", type);
                request.setAttribute("subName", subName);
                request.setAttribute("subDate", subDate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
  %>

  <div class="container">
    <h2>更新文章</h2>
    <form name="form1" method="post" action="SubmitUpdatedArticle.jsp">
      <label for="title">标题：</label>
      <input type="text" id="title" name="title" value="<%= request.getAttribute("title") %>" style="width: 100%;"><br><br>

      <label for="type">类型：</label>
      <select name="type" id="type" style="width: 100%;">
        <option value="学院新闻" <%= "学院新闻".equals(request.getAttribute("type")) ? "selected" : "" %>>学院新闻</option>
        <option value="教务通知" <%= "教务通知".equals(request.getAttribute("type")) ? "selected" : "" %>>教务通知</option>
        <option value="通知公告" <%= "通知公告".equals(request.getAttribute("type")) ? "selected" : "" %>>通知公告</option>
        <option value="研究生教学" <%= "研究生教学".equals(request.getAttribute("type")) ? "selected" : "" %>>研究生教学</option>
        <option value="学术讲座" <%= "学术讲座".equals(request.getAttribute("type")) ? "selected" : "" %>>学术讲座</option>
        <option value="学生工作" <%= "学生工作".equals(request.getAttribute("type")) ? "selected" : "" %>>学生工作</option>
        <option value="招聘信息" <%= "招聘信息".equals(request.getAttribute("type")) ? "selected" : "" %>>招聘信息</option>
      </select><br><br>
      
      <label for="title">上传人：</label>
      <input type="text" id="subName" name="subName" value="<%= request.getAttribute("subName") %>" style="width: 100%;"><br><br>
      
      <input type="hidden" name="newstxt" id="newstxt">
      <input type="hidden" name="articleId" value="<%= request.getParameter("articleId") %>" />
      

      <div class="page-container">
        <div class="page-right">
          <div style="border: 1px solid #ccc;width: 800px">
            <div id="editor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
            <div id="editor-text-area" style="height: 300px;"></div>
          </div><br>
          <input type="submit" value="提交修改">
        </div>
      </div>
    </form>
  </div>

  <script>
    const E = window.wangEditor
    const LANG = location.href.indexOf('lang=en') > 0 ? 'en' : 'zh-CN'
    E.i18nChangeLanguage(LANG)

    window.editor = E.createEditor({
      selector: '#editor-text-area',
      html: '<%= request.getAttribute("content") != null ? request.getAttribute("content") : "<p><br></p>" %>',
      config: {
        placeholder: '编辑文章内容...',
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

</body>
</html>
