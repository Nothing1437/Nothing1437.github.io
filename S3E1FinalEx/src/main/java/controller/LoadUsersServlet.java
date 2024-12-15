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
        // 设置请求和响应的字符编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    	
        String type = request.getParameter("type"); // 获取用户类型

        // 获取指定类型的用户列表
        UserDao userDao = new UserDao();
        List<UserManager> users = userDao.getUsersByType(type); 

        // 将用户列表作为请求属性传递给 JSP 页面
        request.setAttribute("users", users);

        // 转发请求到 JSP 页面
        request.getRequestDispatcher("/UserManagement.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应的字符编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    	
        String action = request.getParameter("action"); // 获取请求操作类型

        UserDao userDao = new UserDao();
        boolean result = false;

        if ("update".equals(action)) {
            // 更新操作
            String userId = request.getParameter("userId");
            String newPwd = request.getParameter("newPwd");
            String newName = request.getParameter("newName");

            result = userDao.updateUser(userId, newPwd, newName); // 调用更新方法
        } else if ("delete".equals(action)) {
            // 删除操作
            String userId = request.getParameter("userId");

            result = userDao.deleteUser(userId); // 调用删除方法
        } else if ("add".equals(action)) {
            // 添加新用户
            String userId = request.getParameter("userId");
            String userPwd = request.getParameter("userPwd");
            String userName = request.getParameter("userName");
            String userType = request.getParameter("userType"); // 用户类型

            result = userDao.addUser(userId, userPwd, userName, userType); // 调用插入方法
        }

        // 操作完成后，重定向回用户列表页面
        if (result) {
            // 如果操作成功，重新加载用户列表
        	request.getRequestDispatcher("/UserManagement.jsp").forward(request, response);
        } else {
            response.getWriter().println("操作失败"); // 失败则显示失败消息
        }
    }
}

