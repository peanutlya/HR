package dao;

import entity.*;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.DataSourceUtils;
import vo.Condition;
import vo.ConditionLog;
import vo.ConditionNote;
import vo.EmployeeInfo;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ManageDao {
   public Employee queryCountByKeywords(Employee currentEmployee) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="select * from t_employees where e_num=? and e_name=?";
       Employee employee=qr.query(sql,new BeanHandler<Employee>(Employee.class),currentEmployee.getE_num(),currentEmployee.getE_name());
       return employee;
   }

   public List<Department> findDepartmentForPageBean(int currentPage,int pageSize,String keywords) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql=null;
       if(keywords==null||("").equals(keywords)){
           sql="select * from t_department limit ?,?";
       }else{
           sql="select * from t_department where d_num like "+ "'%"+keywords+"%'"+"or d_name like "+" '%"+keywords+"%'"+" limit ?,?";
       }
       int index=(currentPage-1)*pageSize;
       return qr.query(sql,new BeanListHandler<Department>(Department.class),index,pageSize);
   }

   public int getTotalDepartmentCount(String keywords) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql=null;
       if(keywords==null||("").equals(keywords)){
           sql="select count(*) from t_department";
       }else{
           sql="select count(*) from t_department where d_num like "+ "'%"+keywords+"%'"+"or d_name like"+"'%"+keywords+"%'";
       }
       Long result=(Long)qr.query(sql,new ScalarHandler());
       return result.intValue();
   }

   public int getTotalEmployeeInfoForPageBean(Condition condition) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="SELECT count(*) from t_employees e INNER JOIN " +
               "t_department d on e.d_num=d.d_num where 1=1 ";
       List list=new ArrayList();
       if(condition.getE_name()!=null&&!condition.getE_name().trim().equals("")){
           sql+=" and e_name like ?";
           list.add("%"+condition.getE_name().trim()+"%");
       }
       if(condition.getE_gender()!=null&&!condition.getE_gender().trim().equals("")){
           sql+=" and e_gender=?";
           list.add(condition.getE_gender().trim());
       }
       if(condition.getD_name()!=null&&!condition.getD_name().trim().equals("")){
           sql+=" and d_name=?";
           list.add(condition.getD_name());
       }
       Long value=(Long)qr.query(sql, new ScalarHandler(), list.toArray());
       return value.intValue();
   }

   public List<Department> findAllDepartment() throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="select * from t_department";
       return qr.query(sql,new BeanListHandler<Department>(Department.class));
   }

   public List<EmployeeInfo> findEmployeeInfoForPageBean(int currentPage, int pageSize, Condition condition) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="SELECT e.e_id,e.e_num,e.e_name,e.e_gender,e.e_idcard,e.e_tellnumber,d.d_name from t_employees e INNER JOIN\n" +
               "t_department d on e.d_num=d.d_num where 1=1";
       List list=new ArrayList();
       if(condition.getE_name()!=null&&!condition.getE_name().trim().equals("")){
           sql+=" and e_name like ?";
           list.add("%"+condition.getE_name().trim()+"%");
       }
       if(condition.getE_gender()!=null&&!condition.getE_gender().trim().equals("")){
           sql+=" and e_gender=?";
           list.add(condition.getE_gender().trim());
       }
       if(condition.getD_name()!=null&&!condition.getD_name().trim().equals("")){
           sql+=" and d_name=?";
           list.add(condition.getD_name());
       }
       sql+=" limit ?,?";
       int index=(currentPage-1)*pageSize;
       list.add(index);
       list.add(pageSize);
       return qr.query(sql,new BeanListHandler<EmployeeInfo>(EmployeeInfo.class),list.toArray());
   }

   public int getCountInDepartment(String d_num) throws SQLException {
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="SELECT count(*) from t_employees e INNER JOIN t_department d on e.d_num= ? GROUP BY d.d_num ";
       Long result = (Long)qr.query(sql, new ScalarHandler(),d_num);
       if(result==null){
           return 0;
       }else {
           return result.intValue();
       }

   }

   public int deleteEmployeeById(Long e_id) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="delete from t_employees where e_id = ?";
       return  qr.update(sql,e_id);
   }

   public int deleteDepartmentByNum(String d_num) throws SQLException{
        QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="delete from t_department where d_num = ?";
        return  qr.update(sql,d_num);
    }

   public int addEmployee(Employee currentEmployee) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="insert into t_employees (e_id,e_num,e_name,e_gender,e_idcard,e_tellnumber,d_num) values (null,?,?,?,?,?,?)";
       String s=currentEmployee.toString();
       Object[] params= s.split(",");
       return qr.update(sql,params);
    }

   public Employee findEmployeeById(Long e_id) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="select * from t_employees where e_id =?";
       return qr.query(sql,new BeanHandler<Employee>(Employee.class),e_id);
    }

   public int updateEmployee(Employee currentEmployee) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="update t_employees set e_num =? ,e_name=?,e_gender=?,e_idcard=?,e_tellnumber=? ,d_num=? " +
               "WHERE e_num=?";
       int i=qr.update(sql,currentEmployee.getE_num(),currentEmployee.getE_name(),currentEmployee.getE_gender(),currentEmployee.getE_idcard(),currentEmployee.getE_tellnumber(),currentEmployee.getD_num(),currentEmployee.getE_num());
       return i;

    }

   public int updateDepartment(Department currentDepartment) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="update t_department set d_manager=?,d_describe=? where d_num=?";
        int i = qr.update(sql, currentDepartment.getD_manager(), currentDepartment.getD_describe(), currentDepartment.getD_num());
        return i;
    }

   public List<Employee> findEmployeeInDepartment(String d_num) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="SELECT e.* from t_employees e INNER JOIN " +
               "t_department d on e.d_num=d.d_num WHERE d.d_num =?";
       return qr.query(sql,new BeanListHandler<Employee>(Employee.class),d_num);

   }

   public Department findDepartmentByNum(String d_num) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="select * from t_department where d_num =?";
       return qr.query(sql,new BeanHandler<Department>(Department.class),d_num);
   }

   public boolean checkEmployeeByNum(String e_num) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="select * from t_employees where e_num=?";
       Employee employee = qr.query(sql, new BeanHandler<Employee>(Employee.class), e_num);
       if(employee!=null){
           return true;
       }else{
           return false;
       }
   }

   public int getTotalNoteForPageBean(ConditionNote condition) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="SELECT count(*) from t_note where 1=1";
        List list=new ArrayList();
       if(condition.getE_name()!=null&&!condition.getE_name().trim().equals("")){
           sql+=" and e_name like ?";
           list.add("%"+condition.getE_name().trim()+"%");
       }
       if(condition.getN_state()!=null&&!condition.getN_state().trim().equals("")){
           sql+=" and n_state=?";
           list.add(condition.getN_state().trim());
       }
        Long value=(Long)qr.query(sql, new ScalarHandler(), list.toArray());
        return value.intValue();
    }

   public List<Note> findNoteForPageBean(int currentPage,int pageSize,ConditionNote condition) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="SELECT * from t_note where 1=1";
       List list=new ArrayList();
       if(condition.getE_name()!=null&&!condition.getE_name().trim().equals("")){
           sql+=" and e_name like ?";
           list.add("%"+condition.getE_name().trim()+"%");
       }
       if(condition.getN_state()!=null&&!condition.getN_state().trim().equals("")){
           sql+=" and n_state=?";
           list.add(condition.getN_state().trim());
       }
       sql+=" order by n_starttime DESC limit ?,?";
       int index=(currentPage-1)*pageSize;
       list.add(index);
       list.add(pageSize);
       return qr.query(sql,new BeanListHandler<Note>(Note.class),list.toArray());
    }

   public int updateNoteState(String e_num,String n_state) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="update t_note set n_state=? where e_num=?";
       int i=qr.update(sql,n_state,e_num);
       return i;
   }

   public int getTotalLogForPageBean(ConditionLog condition) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="SELECT count(*) from t_worklog where 1=1";
       if(condition.getW_endtime()==null||condition.getW_endtime().trim().equals("")){
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
           condition.setW_endtime(sdf.format(new Date()));
       }
       if(condition.getW_starttime()==null){
           condition.setW_starttime("");
       }
       List list=new ArrayList();
       if(condition.getE_name()!=null&&!condition.getE_name().trim().equals("")){
           sql+=" and e_name like ?";
           list.add("%"+condition.getE_name().trim()+"%");
       }

       sql+=" and date_format(w_subtime,'%Y-%m-%d') between ? and ? order by(w_subtime) desc";
       list.add(condition.getW_starttime().trim());
       list.add(condition.getW_endtime().trim());

       Long value=(Long)qr.query(sql, new ScalarHandler(), list.toArray());
       return value.intValue();
   }
   public int getTotalPunchCardForPageBean(ConditionLog condition) throws SQLException{
        QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="SELECT count(*) from t_punchCard where 1=1";
        if(condition.getW_endtime()==null||condition.getW_endtime().trim().equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
            condition.setW_endtime(sdf.format(new Date()));
        }
        if(condition.getW_starttime()==null){
            condition.setW_starttime("");
        }
        List list=new ArrayList();
        if(condition.getE_name()!=null&&!condition.getE_name().trim().equals("")){
            sql+=" and e_name like ?";
            list.add("%"+condition.getE_name().trim()+"%");
        }

        sql+=" and date_format(p_date,'%Y-%m-%d') between ? and ? order by(p_date) desc";
        list.add(condition.getW_starttime().trim());
        list.add(condition.getW_endtime().trim());

        Long value=(Long)qr.query(sql, new ScalarHandler(), list.toArray());
        return value.intValue();
    }

    public Worklog getWorklogByName(String e_name) throws SQLException {
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="SELECT * from t_worklog where e_name=?";
       return qr.query(sql,new BeanHandler<Worklog>(Worklog.class),e_name);
    }

 /*  public Worklog getWorklogByName(String e_name){
	   String sql="SELECT * from t_worklog where e_name=?";
	   Worklog log=null;
	   try {
		CachedRowSet rowSet=DBUtils.executesQuery(sql, e_name);
		if (rowSet.next()) {
		
		     
		    String w_contentscompleted=rowSet.getString("w_contentscompleted");
		    String w_unfinished=rowSet.getString("w_unfinished");
		    String w_selfassessment=rowSet.getString("w_selfassessment");
		     String w_note=rowSet.getString("w_note");
		     Date w_subtime=rowSet.getDate("w_subtime");
		     log =new Worklog(null, e_name, w_contentscompleted, w_unfinished, w_selfassessment, w_note, w_subtime);
		     
		}
		return log;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
	   
   }*/

   public List<Worklog> findLogForPageBean(int currentPage, int pageSize, ConditionLog condition) throws SQLException{
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="SELECT * from t_worklog where 1=1";
       if(condition.getW_endtime()==null||condition.getW_endtime().trim().equals("")){
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
           condition.setW_endtime(sdf.format(new Date()));
       }
       if(condition.getW_starttime()==null){
           condition.setW_starttime("");
       }

       List list=new ArrayList();
       if(condition.getE_name()!=null&&!condition.getE_name().trim().equals("")){
           sql+=" and e_name like ?";
           list.add("%"+condition.getE_name().trim()+"%");
       }

       sql+=" and date_format(w_subtime,'%Y-%m-%d') between ? and ? order by(w_subtime) desc limit ?,?";
       list.add(condition.getW_starttime().trim());
       list.add(condition.getW_endtime().trim());

       int index=(currentPage-1)*pageSize;
       list.add(index);
       list.add(pageSize);
       return qr.query(sql,new BeanListHandler<Worklog>(Worklog.class),list.toArray());
   }

    public List<PunchCard> findPunchCardForPageBean(int currentPage, int pageSize, ConditionLog condition) throws SQLException{
        QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="SELECT * from t_punchCard where 1=1";
        if(condition.getW_endtime()==null||condition.getW_endtime().trim().equals("")){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
            condition.setW_endtime(sdf.format(new Date()));
        }
        if(condition.getW_starttime()==null){
            condition.setW_starttime("");
        }

        List list=new ArrayList();
        if(condition.getE_name()!=null&&!condition.getE_name().trim().equals("")){
            sql+=" and e_name like ?";
            list.add("%"+condition.getE_name().trim()+"%");
        }

        sql+=" and date_format(p_date,'%Y-%m-%d') between ? and ? order by(p_date) desc limit ?,?";
        list.add(condition.getW_starttime().trim());
        list.add(condition.getW_endtime().trim());

        int index=(currentPage-1)*pageSize;
        list.add(index);
        list.add(pageSize);
        return qr.query(sql,new BeanListHandler<PunchCard>(PunchCard.class),list.toArray());
    }


    public int addPunchCard(PunchCard punchCard) throws SQLException {
       QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
       String sql="insert into t_punchCard values(null,?,?,?)";
       return qr.update(sql,punchCard.getE_num(),punchCard.getE_name(),punchCard.getP_date());
   }















}
