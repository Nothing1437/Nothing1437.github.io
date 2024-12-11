package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;
import dao.ArticleManager;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/loadArticles")
public class LoadArticlesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type"); // 获取文章类型

        ArticleDao articleDao = new ArticleDao();
        List<ArticleManager> articles = articleDao.getArticlesByType1(type); // 获取文章列表

     // 将文章列表作为请求属性传递给 JSP 页面
        request.setAttribute("articles", articles);

        // 转发请求到 JSP 页面
        request.getRequestDispatcher("/ArticleManagement.jsp").forward(request, response);
    }
}

