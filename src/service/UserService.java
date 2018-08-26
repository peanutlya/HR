package service;

import dao.UserDao;
import entity.Note;
import entity.PageBean;
import entity.Worklog;
import vo.EmployeeInfo;

import java.sql.SQLException;
import java.util.List;

public class UserService {
    public EmployeeInfo showPersonalMessage(String e_num) throws SQLException{
        UserDao userDao=new UserDao();
        return userDao.showPersonalMessage(e_num);
    }
    public int addNote(Note note) throws SQLException{
        UserDao userDao=new UserDao();
        return userDao.addNote(note);
    }
    public int addWorkLog(Worklog worklog) throws SQLException{
        UserDao userDao=new UserDao();
        return userDao.addWorkLog(worklog);
    }
    public PageBean findNoteByNum(int currentPage,int pageSize,String e_num) throws SQLException{
        UserDao userDao=new UserDao();
        PageBean pageBean=new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageSize(pageSize);
        int totalCount=userDao.getCountInNote(e_num);
        int totalPage=(int)Math.ceil(1.0*totalCount/pageSize);
        pageBean.setTotalPage(totalPage);
        pageBean.setTotalCount(totalCount);
        List<Note> noteList = userDao.findNoteByNum(currentPage, pageSize, e_num);
        pageBean.setPageList(noteList);
        return pageBean;
    }

    public PageBean findWorkLogByNum(int currentPage,int pageSize,String e_num) throws SQLException{
        UserDao userDao=new UserDao();
        PageBean pageBean=new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageSize(pageSize);
        //int totalCount=userDao.getCountInNote(e_num);
        int totalCount=userDao.getCountInWorkLog(e_num);
        int totalPage=(int)Math.ceil(1.0*totalCount/pageSize);
        pageBean.setTotalPage(totalPage);
        pageBean.setTotalCount(totalCount);
        //List<Note> noteList = userDao.findNoteByNum(currentPage, pageSize, e_num);
        List<Worklog> workLogList = userDao.findWorkLogByNum(currentPage, pageSize, e_num);
        pageBean.setPageList(workLogList);
        return pageBean;
    }






}
