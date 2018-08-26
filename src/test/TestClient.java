package test;

import dao.ManageDao;
import entity.Worklog;
import vo.ConditionLog;

import java.sql.SQLException;
import java.util.List;

public class TestClient {
    public static void main(String[] args) throws SQLException {
        ManageDao manageDao=new ManageDao();
        ConditionLog condition=new ConditionLog(null,null,null);
        List<Worklog> logList = manageDao.findLogForPageBean(1, 5, condition);
        System.out.println(logList);
    }
}
