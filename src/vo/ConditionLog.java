package vo;

public class ConditionLog {
    private String e_name;
    private String w_starttime;
    private String w_endtime;

    public ConditionLog(String e_name, String w_starttime, String w_endtime) {
        this.e_name = e_name;
        this.w_starttime = w_starttime;
        this.w_endtime = w_endtime;
    }

    public ConditionLog() {

    }

    public String getE_name() {
        return e_name;
    }

    public void setE_name(String e_name) {
        this.e_name = e_name;
    }

    public String getW_starttime() {
        return w_starttime;
    }

    public void setW_starttime(String w_starttime) {
        this.w_starttime = w_starttime;
    }

    public String getW_endtime() {
        return w_endtime;
    }

    public void setW_endtime(String w_endtime) {
        this.w_endtime = w_endtime;
    }
}
