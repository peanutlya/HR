package control;

import com.google.gson.Gson;

import dao.ManageDao;
import entity.*;

import org.apache.commons.beanutils.BeanUtils;

import service.ManageService;
import vo.Condition;
import vo.ConditionLog;
import vo.ConditionNote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ManageServlet",urlPatterns = "/ManageServlet")
public class ManageServlet extends HttpServlet {
    private ManageService manageService=new ManageService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op=request.getParameter("op");
        if(("exit").equals(op)){
            doExit(request,response);
        }else if (("departmentManage").equals(op)){
            doManageDepartment(request,response);
        }else if(("employeeManage").equals(op)){
            doManageEmployee(request,response);
        }else if(("deleteEmployee").equals(op)){
            doDelteEmployee(request,response);
        }else if(("deleteDepartmentCheck").equals(op)){
            doDelteDepartmentCheck(request,response);
        }else if(("deleteDepartment").equals(op)){
            doDelteDepartment(request,response);
        }else if(("addEmployee").equals(op)){
            doAddEmployee(request,response);
        }else if(("editEmployee").equals(op)){
            doEditEmployee(request,response);
        }else if(("updateEmployee").equals(op)){
            doUpdateEmployee(request,response);
        }else if(("editDepartment").equals(op)){
            doEditDepartment(request,response);
        }else if(("updateDepartment").equals(op)){
            doUpdateDepartment(request,response);
        }else if(("leaveManage").equals(op)){
            doManageLeave(request,response);
        }else if(("updateNoteState").equals(op)){
            doUpdateNoteState(request,response);
        }else if(("logManage").equals(op)){
            doLogManage(request,response);
        }else if(("logInfo").equals(op)){
                doLogInfo(request,response);
        }else if(("signin").equals(op)){
            doSignin(request,response);
        }else if(("punchCardManage").equals(op)){
            doPunchCardManage(request,response);
        }
    }

    private void doPunchCardManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPageStr=request.getParameter("currentPage");
        if(currentPageStr==null){
            currentPageStr="1";
        }
        PageBean pageBean=new PageBean();
        int currentPage=Integer.parseInt(currentPageStr);
        int pageSize=5;
        Map<String, String[]> properties = request.getParameterMap();
        ConditionLog condition=new ConditionLog();
        try {
            BeanUtils.populate(condition,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        try {
            pageBean=manageService.findPunchCardForPageBean(currentPage,pageSize,condition);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("condition",condition);
        request.setAttribute("mainPage","/admin/punchCardManage.jsp");
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
    }

    private void doSignin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("mainPage","/admin/signin.jsp");
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
    }

    private void doLogManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPageStr=request.getParameter("currentPage");
        if(currentPageStr==null){
            currentPageStr="1";
        }
        PageBean pageBean=new PageBean();
        int currentPage=Integer.parseInt(currentPageStr);
        int pageSize=5;
        Map<String, String[]> properties = request.getParameterMap();
        ConditionLog condition=new ConditionLog();
        try {
            BeanUtils.populate(condition,properties);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        try {
            pageBean=manageService.findLogForPageBean(currentPage,pageSize,condition);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("condition",condition);
        request.setAttribute("mainPage","/admin/logManage.jsp");
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
    }
    
    
    private void doLogInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String e_name=request.getParameter("e_name");
    	ManageDao dao= new ManageDao();
        Worklog log= null;
        try {
            log = dao.getWorklogByName(e_name);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("log",log);
        request.setAttribute("mainPage","/admin/logInfo.jsp");
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
    }

    private void doUpdateNoteState(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String n_num=request.getParameter("e_num");
        String n_state = request.getParameter("n_state");
        try {
            int i = manageService.updateNoteState(n_num,n_state);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/ManageServlet?op=leaveManage&n_state=0");

    }

    private void doManageLeave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPageStr=request.getParameter("currentPage");
        if(currentPageStr==null){
            currentPageStr="1";
        }
        PageBean pageBean=new PageBean();
        int currentPage=Integer.parseInt(currentPageStr);
        int pageSize=3;
        Map<String, String[]> properties = request.getParameterMap();
        ConditionNote condition=new ConditionNote();
        try {
            BeanUtils.populate(condition,properties);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        try {
            pageBean=manageService.findNoteForPageBean(currentPage,pageSize,condition);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("condition",condition);
        request.setAttribute("mainPage","/admin/leaveManage.jsp");
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
    }

    private void doUpdateDepartment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, String[]> property = request.getParameterMap();
        Department currentDepartment=new Department();
        try {
            BeanUtils.populate(currentDepartment,property);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        try {
            int i = manageService.updateDepartment(currentDepartment);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/ManageServlet?op=departmentManage");
    }

    private void doEditDepartment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String d_num=request.getParameter("d_num");
        Department currentDepartment=null;
        try {
           currentDepartment=manageService.findDepartmentByNum(d_num);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("currentDepartment",currentDepartment);
        request.getRequestDispatcher("/admin/editDepartment.jsp").forward(request,response);
    }

    private void doUpdateEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, String[]> property = request.getParameterMap();
        Employee currentEmployee=new Employee();
        try {
            BeanUtils.populate(currentEmployee,property);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        try {
            int i = manageService.updateEmployee(currentEmployee);
            response.sendRedirect(request.getContextPath()+"/ManageServlet?op=employeeManage");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void doEditEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long e_id = Long.parseLong(request.getParameter("e_id"));
        Employee currentEmployee=null;
        try {
            currentEmployee=manageService.findEmployeeById(e_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("currentEmployee",currentEmployee);
        request.getRequestDispatcher("/admin/editEmployee.jsp").forward(request,response);
    }

    private void doAddEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, String[]> property = request.getParameterMap();
        Employee currentEmployee=new Employee();
        try {
            BeanUtils.populate(currentEmployee,property);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        try {
            int i = manageService.addEmployee(currentEmployee);
            response.sendRedirect(request.getContextPath()+"/ManageServlet?op=employeeManage");

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void doDelteDepartment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String d_num=request.getParameter("d_num");
        try {
            manageService.deleteDepartmentByNum(d_num);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/ManageServlet?op=departmentManage");

    }

    private void doDelteDepartmentCheck(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String d_num=request.getParameter("d_num");
        Msg msg=null;
        try {
            int count = manageService.getCountInDepartment(d_num);
            if(count==0){
                msg=new Msg("0","当前部门没有员工,可以删除");
            }else{
                msg=new Msg("1","当前部门包含"+count+"名员工,不能忍心删除");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Gson gson=new Gson();
        String json=gson.toJson(msg);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(json);
    }

    private void doDelteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long e_id = Long.parseLong(request.getParameter("e_id"));
        try {
            int i = manageService.deleteEmployeeById(e_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/ManageServlet?op=employeeManage");

    }

    private void doManageEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Department> departmentList= null;
        try {
            departmentList = manageService.findAllDepartment();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("departmentList",departmentList);


        String currentPageStr=request.getParameter("currentPage");
        if(currentPageStr==null){
            currentPageStr="1";
        }
        PageBean pageBean=new PageBean();
        int currentPage=Integer.parseInt(currentPageStr);
        int pageSize=5;
        Map<String, String[]> properties = request.getParameterMap();
        Condition condition=new Condition();
        try {
            BeanUtils.populate(condition,properties);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        try {
            pageBean=manageService.findEmployeeInfoForPageBean(currentPage,pageSize,condition);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("condition",condition);
        request.setAttribute("mainPage","/admin/employeeManage.jsp");
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
    }

    private void doManageDepartment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String currentPageStr=request.getParameter("currentPage");
        String keywords=request.getParameter("keywords");
        if(currentPageStr==null){
            currentPageStr="1";
        }
        PageBean pageBean=null;
        int currentPage=Integer.parseInt(currentPageStr);
        int pageSize=5;
        try {
            pageBean = manageService.findDepartmentPageBeanBykeywords(currentPage, pageSize, keywords);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("keywords",keywords);
        request.setAttribute("mainPage","/admin/departmentManage.jsp");
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
    }

    private void doExit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        Cookie[] cookies=request.getCookies();
        for(int i=0;cookies!=null && i<cookies.length;i++){
            if(cookies[i].getName().equals("e_name")||cookies[i].getName().equals("e_num")){
                Cookie cookie = new Cookie(cookies[i].getName(), null);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        response.sendRedirect(request.getContextPath()+"/login.jsp");
    }





    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
