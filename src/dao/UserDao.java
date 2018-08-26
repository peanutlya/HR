package dao;

import entity.Note;
import entity.Worklog;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.DataSourceUtils;
import vo.EmployeeInfo;

import java.sql.SQLException;
import java.util.List;

public class UserDao {
    public EmployeeInfo showPersonalMessage(String e_num) throws SQLException{
        QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="SELECT e.e_id,e.e_num,e.e_name,e.e_gender,e.e_idcard,e.e_tellnumber,d.d_name from t_employees e INNER JOIN" +
                " t_department d on e.d_num=d.d_num where e_num=?";
        return qr.query(sql,new BeanHandler<EmployeeInfo>(EmployeeInfo.class),e_num);
    }
    public int addNote(Note note) throws SQLException{
        QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="insert into t_note values(null,?,?,?,?,?,?,?)";
        return qr.update(sql,note.getE_num(),note.getE_name(),note.getN_starttime(),note.getN_endtime(),note.getN_type(),note.getN_forreason(),0);
    }
    public int addWorkLog(Worklog worklog) throws SQLException{
        QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="insert into t_worklog values(null,?,?,?,?,?,?,?)";
        return qr.update(sql,worklog.getE_num(),worklog.getE_name(),worklog.getW_contentscompleted(),worklog.getW_unfinished(),worklog.getW_selfassessment(),worklog.getW_note(),worklog.getW_subtime());
    }
    public List<Note> findNoteByNum(int currentPage,int pageSize,String e_num) throws SQLException{
        QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from t_note where e_num=? order by n_starttime DESC limit ?,?";
        int index=(currentPage-1)*pageSize;
        return qr.query(sql,new BeanListHandler<Note>(Note.class),e_num,index,pageSize);
    }

    public int getCountInNote(String e_num) throws SQLException{
        QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select count(*) from t_note where e_num=?";
        Long result=(Long) qr.query(sql,new ScalarHandler(),e_num);
        return  result.intValue();
    }

    public int getCountInWorkLog(String e_num) throws SQLException{
        QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select count(*) from t_worklog where e_num=?";
        Long result=(Long) qr.query(sql,new ScalarHandler(),e_num);
        return  result.intValue();
    }

    public List<Worklog> findWorkLogByNum(int currentPage,int pageSize,String e_num) throws SQLException{
        QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from t_worklog where e_num=? order by w_subtime DESC limit ?,?";
        int index=(currentPage-1)*pageSize;
        return qr.query(sql,new BeanListHandler<Worklog>(Worklog.class),e_num,index,pageSize);
    }















}
