package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dao.UserManager;

@WebServlet("/loadUsers")
public class LoadUsersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type"); // 获取用户类型

        UserDao UserDao = new UserDao();
        List<UserManager> users = UserDao.getUsersByType(type); // 获取文章列表

     // 将文章列表作为请求属性传递给 JSP 页面
        request.setAttribute("users", users);

        // 转发请求到 JSP 页面
        request.getRequestDispatcher("/UserManagement.jsp").forward(request, response);
    }
}
