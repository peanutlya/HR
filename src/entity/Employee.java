package entity;

public class Employee {
    private Long e_id;
    private String e_num;
    private String e_name;
    private String e_gender;
    private String e_idcard;
    private String e_tellnumber;
    private String d_num;
    private int e_type;

    public int getE_type() {
        return e_type;
    }

    public void setE_type(int e_type) {
        this.e_type = e_type;
    }

    public Employee() {
    }

    public Employee(Long e_id, String e_num, String e_name, String e_gender, String e_idcard, String e_tellnumber, String d_num) {
        this.e_id = e_id;
        this.e_num = e_num;
        this.e_name = e_name;
        this.e_gender = e_gender;
        this.e_idcard = e_idcard;
        this.e_tellnumber = e_tellnumber;
        this.d_num = d_num;
    }

    public Employee(String e_num, String e_name, String e_gender, String e_idcard, String e_tellnumber, String d_num) {

        this.e_num = e_num;
        this.e_name = e_name;
        this.e_gender = e_gender;
        this.e_idcard = e_idcard;
        this.e_tellnumber = e_tellnumber;
        this.d_num = d_num;
    }

    public Long getE_id() {
        return e_id;
    }

    public void setE_id(Long e_id) {
        this.e_id = e_id;
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

    public String getE_gender() {
        return e_gender;
    }

    public void setE_gender(String e_gender) {
        this.e_gender = e_gender;
    }

    public String getE_idcard() {
        return e_idcard;
    }

    public void setE_idcard(String e_idcard) {
        this.e_idcard = e_idcard;
    }

    public String getE_tellnumber() {
        return e_tellnumber;
    }

    public void setE_tellnumber(String e_tellnumber) {
        this.e_tellnumber = e_tellnumber;
    }

    public String getD_num() {
        return d_num;
    }

    public void setD_num(String d_num) {
        this.d_num = d_num;
    }

    public Employee(String e_num, String e_name) {
        this.e_num = e_num;
        this.e_name = e_name;
    }

    @Override

    public String toString() {
        return
                e_num +
                "," + e_name +
                "," + e_gender +
                "," + e_idcard +
                "," + e_tellnumber +
                "," + d_num;
    }
}
