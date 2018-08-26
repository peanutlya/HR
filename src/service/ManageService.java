package service;

import dao.ManageDao;
import entity.*;
import vo.Condition;
import vo.ConditionLog;
import vo.ConditionNote;
import vo.EmployeeInfo;

import java.sql.SQLException;
import java.util.List;

public class ManageService {
    public Employee findEmployeeById(Long e_id) throws SQLException{
        ManageDao manageDao=new ManageDao();
        return manageDao.findEmployeeById(e_id);
    }

    public int addEmployee(Employee currentEmployee) throws SQLException{
        ManageDao manageDao=new ManageDao();
        return manageDao.addEmployee(currentEmployee);
    }

    public Employee queryCountByKeywords(Employee currentEmployee) throws SQLException{
        ManageDao manageDao=new ManageDao();
        return  manageDao.queryCountByKeywords(currentEmployee);
    }

    public PageBean findDepartmentPageBeanBykeywords(int currentPage,int pageSize,String keywords) throws SQLException {
        ManageDao manageDao=new ManageDao();
        PageBean pageBean=new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageSize(pageSize);
        int totalCount=manageDao.getTotalDepartmentCount(keywords);
        int totalPage=(int)Math.ceil(1.0*totalCount/pageSize);
        pageBean.setTotalPage(totalPage);
        pageBean.setTotalCount(totalCount);
        List<Department> departmentList = manageDao.findDepartmentForPageBean(currentPage, pageSize, keywords);
        pageBean.setPageList(departmentList);
        return pageBean;
    }

    public List<Department> findAllDepartment() throws SQLException {
        ManageDao manageDao=new ManageDao();
        List<Department> departmentList = manageDao.findAllDepartment();
        return departmentList;
    }

    public PageBean findEmployeeInfoForPageBean(int currentPage, int pageSize, Condition condition) throws SQLException{
        ManageDao manageDao=new ManageDao();
        PageBean pageBean=new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageSize(pageSize);
        int totalCount=manageDao.getTotalEmployeeInfoForPageBean(condition);
        pageBean.setTotalCount(totalCount);
        int totalPage=(int)Math.ceil(1.0*totalCount/pageSize);
        pageBean.setTotalPage(totalPage);
        List<EmployeeInfo> employeeInfoList = manageDao.findEmployeeInfoForPageBean(currentPage, pageSize, condition);
        pageBean.setPageList(employeeInfoList);
        return pageBean;
    }

    public int deleteEmployeeById(Long e_id) throws SQLException {
        ManageDao manageDao=new ManageDao();
        return manageDao.deleteEmployeeById(e_id);
    }

    public int getCountInDepartment(String d_num) throws SQLException{
        ManageDao manageDao=new ManageDao();
        int i=manageDao.getCountInDepartment(d_num);
        return i;
    }

    public int deleteDepartmentByNum(String d_num) throws SQLException{
        ManageDao manageDao=new ManageDao();
        return manageDao.deleteDepartmentByNum(d_num);
    }

    public int updateEmployee(Employee currentEmployee) throws SQLException{
        ManageDao manageDao=new ManageDao();
        return manageDao.updateEmployee(currentEmployee);
    }

    public int updateDepartment(Department department) throws SQLException{
        ManageDao manageDao=new ManageDao();
        return manageDao.updateDepartment(department);
    }

    public List<Employee> findEmployeeInDepartment(String d_num) throws SQLException{
        ManageDao manageDao=new ManageDao();
        return manageDao.findEmployeeInDepartment(d_num);
    }

    public Department findDepartmentByNum(String d_num) throws SQLException{
        ManageDao manageDao=new ManageDao();
        return manageDao.findDepartmentByNum(d_num);
    }

    public boolean checkEmployeeByNum(String e_num) throws SQLException{
        ManageDao manageDao=new ManageDao();
        return manageDao.checkEmployeeByNum(e_num);
    }

    public PageBean findNoteForPageBean(int currentPage, int pageSize, ConditionNote condition) throws SQLException{
        ManageDao manageDao=new ManageDao();
        PageBean pageBean=new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageSize(pageSize);
        int totalCount=manageDao.getTotalNoteForPageBean(condition);
        pageBean.setTotalCount(totalCount);
        int totalPage=(int)Math.ceil(1.0*totalCount/pageSize);
        pageBean.setTotalPage(totalPage);
        List<Note> noteList=manageDao.findNoteForPageBean(currentPage,pageSize,condition);
        pageBean.setPageList(noteList);
        return pageBean;
    }

    public int updateNoteState(String e_num,String n_state) throws SQLException{
        ManageDao manageDao=new ManageDao();
        return manageDao.updateNoteState(e_num,n_state);
    }

    public PageBean findLogForPageBean(int currentPage, int pageSize, ConditionLog condition) throws SQLException{
        ManageDao manageDao=new ManageDao();
        PageBean pageBean=new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageSize(pageSize);
        int totalCount=manageDao.getTotalLogForPageBean(condition);
        pageBean.setTotalCount(totalCount);
        int totalPage=(int)Math.ceil(1.0*totalCount/pageSize);
        pageBean.setTotalPage(totalPage);
        List<Worklog> worklogList=manageDao.findLogForPageBean(currentPage,pageSize,condition);
        pageBean.setPageList(worklogList);
        return pageBean;
    }

    public PageBean findPunchCardForPageBean(int currentPage, int pageSize, ConditionLog condition) throws SQLException{
        ManageDao manageDao=new ManageDao();
        PageBean pageBean=new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageSize(pageSize);
        int totalCount=manageDao.getTotalPunchCardForPageBean(condition);
        pageBean.setTotalCount(totalCount);
        int totalPage=(int)Math.ceil(1.0*totalCount/pageSize);
        pageBean.setTotalPage(totalPage);
        List<PunchCard> punchCardList=manageDao.findPunchCardForPageBean(currentPage,pageSize,condition);
        pageBean.setPageList(punchCardList);
        return pageBean;
    }

    public int addPunchCard(PunchCard punchCard) throws SQLException{
        ManageDao manageDao=new ManageDao();
       return manageDao.addPunchCard(punchCard);
    }
}
