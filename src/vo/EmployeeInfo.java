package vo;

public class EmployeeInfo {
    private String e_id;
    private String e_num;
    private String e_name;
    private String e_gender;
    private String e_idcard;

    @Override
    public String toString() {
        return "EmployeeInfo{" +
                "e_id='" + e_id + '\'' +
                ", e_num='" + e_num + '\'' +
                ", e_name='" + e_name + '\'' +
                ", e_gender='" + e_gender + '\'' +
                ", e_idcard='" + e_idcard + '\'' +
                ", e_tellnumber='" + e_tellnumber + '\'' +
                ", d_name='" + d_name + '\'' +
                '}';
    }

    public EmployeeInfo(String e_id, String e_num, String e_name, String e_gender, String e_idcard, String e_tellnumber, String d_name) {
        this.e_id = e_id;
        this.e_num = e_num;
        this.e_name = e_name;
        this.e_gender = e_gender;
        this.e_idcard = e_idcard;
        this.e_tellnumber = e_tellnumber;
        this.d_name = d_name;
    }

    public EmployeeInfo() {

    }

    private String e_tellnumber;
    private String d_name;

    public String getE_id() {
        return e_id;
    }

    public void setE_id(String e_id) {
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

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }
}
