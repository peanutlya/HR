package vo;

public class Condition {
    private String e_name;
    private String e_gender;
    private String d_name;

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

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public Condition(String e_name, String e_gender, String d_name) {
        this.e_name = e_name;
        this.e_gender = e_gender;

        this.d_name = d_name;
    }

    public Condition() {

    }
    @Override
    public String toString() {
        return "Condition{" +
                "e_name='" + e_name + '\'' +
                ", e_gender='" + e_gender + '\'' +
                ", d_name='" + d_name + '\'' +
                '}';
    }

}
