<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ArticleDao" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // 设置请求和响应的编码为 UTF-8
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    String title = request.getParameter("title");
    String content = request.getParameter("newstxt");
    String type = request.getParameter("type");
    String subName = request.getParameter("subName");

    ArticleDao articleDao = new ArticleDao();
    boolean isInserted = articleDao.insertArticle(title, content, type, subName);

    if (isInserted) {
        out.println("<script>alert('文章上传成功！');window.location.href='jiemian.jsp';</script>");
    } else {
        out.println("<script>alert('文章上传失败，请重试！');history.back();</script>");
    }
%>



