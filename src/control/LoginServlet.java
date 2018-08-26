package control;

import entity.Employee;
import service.ManageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet",urlPatterns = "/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String e_num = request.getParameter("e_num");
        String e_name = request.getParameter("e_name");
        String remember = request.getParameter("remember");
        ManageService manageService=new ManageService();
        Employee currentEmployee=new Employee(e_num,e_name);
        Employee employee=null;

        try {
            employee= manageService.queryCountByKeywords(currentEmployee);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(employee!=null){
            HttpSession session=request.getSession();
            session.setAttribute("employee",employee);
            if(remember!=null){
                //创建cookies
                Cookie cookie1 = new Cookie("e_name", e_name);
                Cookie cookie2 = new Cookie("e_num", e_num);

                //设置时长
                cookie1.setMaxAge(60);
                cookie2.setMaxAge(60);

                //add至响应中
                response.addCookie(cookie1);
                response.addCookie(cookie2);

            }
            if(employee.getE_type()==1){
                response.sendRedirect(request.getContextPath()+"/admin/index.jsp");
            }else{
                response.sendRedirect(request.getContextPath()+"/user/welcome.jsp");
            }
        }else{
            request.setAttribute("errorMsg","用户名或密码错误");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            //response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
        /*String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        User currentUser=new User(username,password);
        UserService userService=new UserService();
        User user= null;
        try {
            user = userService.queryCountByKeywords(currentUser);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(user!=null){
            //用户登录成功
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            if(remember!=null) {
                //创建cookies
                Cookie cookie1 = new Cookie("username", username);
                Cookie cookie2 = new Cookie("password", password);

                //设置时长
                cookie1.setMaxAge(60);
                cookie2.setMaxAge(60);

                //add至响应中
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            }

            //request.getRequestDispatcher("/User/login.jsp").forward(request, response);
            response.sendRedirect("/admin/user/index.jsp");
        }
        else{
            response.sendRedirect("/login.jsp");
        }*/
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
