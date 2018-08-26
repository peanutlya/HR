package entity;

import java.util.Date;

public class Note {
    private Long n_id;
    private String e_num;
    private String e_name;
    private Date n_starttime;
    private Date n_endtime;
    private String n_type;
    private String n_forreason;
    private String n_state;

    public Long getN_id() {
        return n_id;
    }

    public void setN_id(Long n_id) {
        this.n_id = n_id;
    }

    public String getE_num() {
        return e_num;
    }

    public void setE_num(String e_num) {
        this.e_num = e_num;
    }

    public String getE_name() {
        return e_name;
    }

    public void setE_name(String e_name) {
        this.e_name = e_name;
    }

    public Date getN_starttime() {
        return n_starttime;
    }

    public void setN_starttime(Date n_starttime) {
        this.n_starttime = n_starttime;
    }

    public Date getN_endtime() {
        return n_endtime;
    }

    public void setN_endtime(Date n_endtime) {
        this.n_endtime = n_endtime;
    }

    public String getN_type() {
        return n_type;
    }

    public void setN_type(String n_type) {
        this.n_type = n_type;
    }

    public String getN_forreason() {
        return n_forreason;
    }

    public void setN_forreason(String n_forreason) {
        this.n_forreason = n_forreason;
    }

    public String getN_state() {
        return n_state;
    }

    public void setN_state(String n_state) {
        this.n_state = n_state;
    }

    public Note() {

    }

    public Note(String e_num, String e_name, Date n_starttime, Date n_endtime, String n_type, String n_forreason, String n_state) {
        this.e_num = e_num;
        this.e_name = e_name;
        this.n_starttime = n_starttime;
        this.n_endtime = n_endtime;
        this.n_type = n_type;
        this.n_forreason = n_forreason;
        this.n_state = n_state;
    }

    public Note(Long n_id, String e_num, String e_name, String n_type, String n_forreason, String n_state) {
        this.n_id = n_id;
        this.e_num = e_num;
        this.e_name = e_name;
        this.n_type = n_type;
        this.n_forreason = n_forreason;
        this.n_state = n_state;
    }

    @Override
    public String toString() {
        return n_id +
                "," + e_num +
                "," + e_name +
                "," + n_starttime +
                "," + n_endtime +
                "," + n_type +
                "," + n_forreason +

                "," + n_state;
    }
}
