package entity;

import java.util.Date;

public class Worklog {
    private Long w_id;
    private String e_num;
    private String e_name;
    private String w_contentscompleted;
    private String w_unfinished;
    private String w_selfassessment;
    private String w_note;
    private Date w_subtime;

    public Worklog(Long w_id, String e_num, String e_name, String w_contentscompleted, String w_unfinished, String w_selfassessment, String w_note, Date w_subtime) {
        this.w_id = w_id;
        this.e_num = e_num;
        this.e_name = e_name;
        this.w_contentscompleted = w_contentscompleted;
        this.w_unfinished = w_unfinished;
        this.w_selfassessment = w_selfassessment;
        this.w_note = w_note;
        this.w_subtime = w_subtime;
    }

    public Worklog() {

    }

    public Long getW_id() {
        return w_id;
    }

    public void setW_id(Long w_id) {
        this.w_id = w_id;
    }

    public String getE_num() {
        return e_num;
    }

    public void setE_num(String e_num) {
        this.e_num = e_num;
    }

    public Worklog(String e_num, String e_name, String w_contentscompleted, String w_unfinished, String w_selfassessment, String w_note, Date w_subtime) {
        this.e_num = e_num;
        this.e_name = e_name;
        this.w_contentscompleted = w_contentscompleted;
        this.w_unfinished = w_unfinished;
        this.w_selfassessment = w_selfassessment;
        this.w_note = w_note;
        this.w_subtime = w_subtime;
    }

    public String getE_name() {
        return e_name;
    }

    public void setE_name(String e_name) {
        this.e_name = e_name;
    }

    public String getW_contentscompleted() {
        return w_contentscompleted;
    }

    public void setW_contentscompleted(String w_contentscompleted) {
        this.w_contentscompleted = w_contentscompleted;
    }

    public String getW_unfinished() {
        return w_unfinished;
    }

    public void setW_unfinished(String w_unfinished) {
        this.w_unfinished = w_unfinished;
    }

    public String getW_selfassessment() {
        return w_selfassessment;
    }

    public void setW_selfassessment(String w_selfassessment) {
        this.w_selfassessment = w_selfassessment;
    }

    public String getW_note() {
        return w_note;
    }

    public void setW_note(String w_note) {
        this.w_note = w_note;
    }

    public Date getW_subtime() {
        return w_subtime;
    }

    public void setW_subtime(Date w_subtime) {
        this.w_subtime = w_subtime;
    }
}
