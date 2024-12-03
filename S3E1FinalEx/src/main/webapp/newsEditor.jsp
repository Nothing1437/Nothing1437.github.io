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
</head>

<body>

<form name="form1" method="post" action="SubmitArticle.jsp">  
  标题：<input type="text" name="title" style="width:755px"><br><br>
  类型：<input type="text" name="type" style="width:755px"><br><br>

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
</body>
</html>