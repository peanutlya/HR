package control;

import com.google.gson.Gson;
import entity.Department;
import entity.Employee;
import entity.Msg;
import entity.PunchCard;
import service.AuthService;
import service.ManageService;
import sun.misc.BASE64Decoder;
import utils.Base64Util;
import utils.GsonUtils;
import utils.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet(name = "AjaxServlet",urlPatterns = "/AjaxServlet")
public class AjaxServlet extends HttpServlet {
    private ManageService manageService=new ManageService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op=request.getParameter("op");
        if(("findAllDepartment").equals(op)){
            doFindAllDepartment(request,response);
        }else if(("findEmployeeInDepartment").equals(op)){
            doFindEmployeeInDepartment(request,response);
        }else if(("checkEmployeeByNum").equals(op)){
            doCheckEmployeeByNum(request,response);
        }else if(("signin").equals(op)){
            doSignin(request,response);
        }

    }

    private void doSignin(HttpServletRequest request, HttpServletResponse response) {
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/search";
        String imageDataUrl = request.getParameter("head_image");
        String e_num = request.getParameter("e_num");
        String e_name=request.getParameter("e_name");
        try {
            BASE64Decoder decoder = new BASE64Decoder();
            byte[] bytes = decoder.decodeBuffer(imageDataUrl);
            String image = Base64Util.encode(bytes);
            Map<String, Object> map = new HashMap<>();
            map.put("image", image);
            map.put("liveness_control", "NORMAL");
            map.put("group_id_list", "employee");
            map.put("image_type", "BASE64");
            map.put("quality_control", "LOW");

            String param = GsonUtils.toJson(map);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = AuthService.getAuth();

            String result = HttpUtil.post(url, accessToken, "application/json", param);

            Map<String, Object> mymap = GsonUtils.changeGsonToMaps(result);
            if(mymap.get("error_msg").equals("SUCCESS")){
                PunchCard punchCard=new PunchCard();
                punchCard.setE_num(e_num);
                punchCard.setE_name(e_name);
                punchCard.setP_date(new Date());
                manageService.addPunchCard(punchCard);
            }


            response.getWriter().write(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void doCheckEmployeeByNum(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String e_num=request.getParameter("e_num");
        try {
            boolean flag = manageService.checkEmployeeByNum(e_num);
            Msg result=null;
            if(flag){
                result=new Msg("Error","此员工编号已存在");
            }else {
                result=new Msg("Right","OK");
            }
            String json=(new Gson()).toJson(result);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void doFindEmployeeInDepartment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String d_num = request.getParameter("d_num");
        List<Employee> employeeList=null;
        try {
            employeeList=manageService.findEmployeeInDepartment(d_num);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String json=(new Gson()).toJson(employeeList);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(json);
    }


    private void doFindAllDepartment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Department> departmentList=null;
        try {
            departmentList=manageService.findAllDepartment();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String json=(new Gson()).toJson(departmentList);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}















