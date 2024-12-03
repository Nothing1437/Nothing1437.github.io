<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ArticleDao" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    request.setCharacterEncoding("UTF-8"); // 设置请求编码为UTF-8
    String title = request.getParameter("title");
    String content = request.getParameter("newstxt");
    String type = request.getParameter("type");

    ArticleDao articleDao = new ArticleDao();
    boolean isInserted = articleDao.insertArticle(title, content, type);

    if (isInserted) {
        out.println("<script>alert('文章提交成功!'); window.location='newsEditor.jsp';</script>");
    } else {
        out.println("<script>alert('文章提交失败!'); window.location='newsEditor.jsp';</script>");
    }
%>

