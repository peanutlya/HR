package entity;

import java.util.Date;

public class PunchCard {
    private Long id;
    private String e_num;
    private String e_name;
    private Date p_date;

    public PunchCard(Long id, String e_num, String e_name, Date p_date) {
        this.id = id;
        this.e_num = e_num;
        this.e_name = e_name;
        this.p_date = p_date;
    }

    public PunchCard() {

    }

    public Long getId() {

        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Date getP_date() {
        return p_date;
    }

    public void setP_date(Date p_date) {
        this.p_date = p_date;
    }
}
