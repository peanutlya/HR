package control;

import entity.Employee;
import entity.Note;
import entity.PageBean;
import entity.Worklog;
import service.UserService;
import vo.EmployeeInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "UserServlet",urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet {
    private UserService userService=new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op=request.getParameter("op");
        if(("showPersonalMessage").equals(op)){
            doShowPersonalMessage(request,response);
        }else if(("addLeave").equals(op)){
            doAddLeave(request,response);
        }else if(("addWorkLog").equals(op)){
            doAddWorkLog(request,response);
        }else if(("showFeedBack").equals(op)){
            doShowFeedBack(request,response);
         }else if(("showWorkLog").equals(op)){
            doShowWorkLog(request,response);
        }
    }
    private void doShowWorkLog(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPageStr=request.getParameter("currentPage");
        HttpSession session = request.getSession();
        Employee employee = (Employee) session.getAttribute("employee");
        String e_num=employee.getE_num();
        if(currentPageStr==null){
            currentPageStr="1";
        }
        PageBean pageBean=new PageBean();
        int currentPage=Integer.parseInt(currentPageStr);
        int pageSize=5;
        try {
            pageBean = userService.findWorkLogByNum(currentPage, pageSize, e_num);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("pageBean",pageBean);
        request.getRequestDispatcher("/user/showSelfWorkLog.jsp").forward(request, response);
    }

    private void doShowFeedBack(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPageStr=request.getParameter("currentPage");
        HttpSession session = request.getSession();
        Employee employee = (Employee) session.getAttribute("employee");
        String e_num=employee.getE_num();
        if(currentPageStr==null){
            currentPageStr="1";
        }
        PageBean pageBean=new PageBean();
        int currentPage=Integer.parseInt(currentPageStr);
        int pageSize=5;
        try {
            pageBean = userService.findNoteByNum(currentPage, pageSize, e_num);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("pageBean",pageBean);
        request.getRequestDispatcher("/user/feedback.jsp").forward(request, response);
    }

    private void doAddWorkLog(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String e_num = request.getParameter("e_num");
        String e_name = request.getParameter("e_name");
        String w_contentscompleted = request.getParameter("w_contentscompleted");
        String w_unfinished = request.getParameter("w_unfinished");
        String w_selfassessment = request.getParameter("w_selfassessment");
        String w_note = request.getParameter("w_note");
        String subtime = request.getParameter("w_subtime");

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date w_subtime=null;
        if(subtime==null||subtime.trim().equals("")){
            try {
                w_subtime=sdf.parse(new Date().toLocaleString());
            } catch (ParseException e) {
                e.printStackTrace();
            }

        }else{
            try {
                w_subtime=sdf.parse(subtime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        Worklog worklog=new Worklog(null,e_num,e_name,w_contentscompleted,w_unfinished,w_selfassessment,w_note,w_subtime);
        String result=null;
        try {
            int i = userService.addWorkLog(worklog);
            if(i>0){
                result="日志已提交，回家注意安全";
            }else {
                result="日志提交失败，请重试";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("result",result);
        request.getRequestDispatcher("/user/workLog.jsp").forward(request, response);

    }

    private void doAddLeave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String e_num = request.getParameter("e_num");
        String e_name = request.getParameter("e_name");
        String n_type = request.getParameter("n_type");
        String n_forreason = request.getParameter("n_forreason");
        String starttime = request.getParameter("n_starttime");
        String endtime = request.getParameter("n_endtime");
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date n_starttime=null;
        Date n_endtime=null;
        try {
            n_starttime=sdf.parse(starttime);
            n_endtime=sdf.parse(endtime);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        Note note=new Note(e_num,e_name,n_starttime,n_endtime,n_type,n_forreason,null);
        String result=null;
        try {
            int i = userService.addNote(note);
            if(i>0){
                result="申请已提交，待管理员审核";
            }else {
                result="提交失败，请重试";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("result",result);
        request.getRequestDispatcher("/user/leaveRequest.jsp").forward(request, response);
    }

    private void doShowPersonalMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        EmployeeInfo employeeInfo=null;
        try {
            employeeInfo = userService.showPersonalMessage(employee.getE_num());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("employeeInfo",employeeInfo);
        request.getRequestDispatcher("/user/personalMessage.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
