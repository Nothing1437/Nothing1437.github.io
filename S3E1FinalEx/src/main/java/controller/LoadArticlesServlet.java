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
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取删除请求中的文章ID
        String deleteArticleIdStr = request.getParameter("deleteArticleId");
        
        if (deleteArticleIdStr != null) {
            try {
                int deleteArticleId = Integer.parseInt(deleteArticleIdStr); // 转换为整型

                // 调用ArticleDao删除文章
                ArticleDao articleDao = new ArticleDao();
                boolean isDeleted = articleDao.deleteArticleById(deleteArticleId);

                if (isDeleted) {
                    // 删除成功，重定向回文章列表页面
                    // 如果操作成功，重新加载用户列表
                	request.getRequestDispatcher("/ArticleManagement.jsp").forward(request, response);
                } else {
                    // 删除失败，给出提示
                    response.getWriter().write("删除失败");
                }
            } catch (NumberFormatException e) {
                // 处理参数转换错误
                response.getWriter().write("无效的文章ID");
            }
        } else {
            // 如果没有传递删除文章的ID，则继续处理获取文章的逻辑
            String type = request.getParameter("type"); // 获取文章类型

            ArticleDao articleDao = new ArticleDao();
            List<ArticleManager> articles = articleDao.getArticlesByType1(type); // 获取文章列表

            // 将文章列表作为请求属性传递给 JSP 页面
            request.setAttribute("articles", articles);

            // 转发请求到 JSP 页面
            request.getRequestDispatcher("/ArticleManagement.jsp").forward(request, response);
        }
    }
}

