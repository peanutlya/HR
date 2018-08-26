package entity;

public class Department {
    public Department(String d_num, String d_name, String d_manager, String d_describe) {
        this.d_num = d_num;
        this.d_name = d_name;
        this.d_manager = d_manager;
        this.d_describe = d_describe;
    }

    public Department(Long d_id, String d_num, String d_name, String d_manager, String d_describe) {
        this.d_id = d_id;
        this.d_num = d_num;
        this.d_name = d_name;
        this.d_manager = d_manager;
        this.d_describe = d_describe;

    }

    public Department() {

    }

    private Long d_id;
    private String d_num;
    private String d_name;
    private String d_manager;
    private String d_describe;

    public Long getD_id() {
        return d_id;
    }

    public void setD_id(Long d_id) {
        this.d_id = d_id;
    }

    public String getD_num() {
        return d_num;
    }

    public void setD_num(String d_num) {
        this.d_num = d_num;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public String getD_manager() {
        return d_manager;
    }

    public void setD_manager(String d_manager) {
        this.d_manager = d_manager;
    }

    public String getD_describe() {
        return d_describe;
    }

    public void setD_describe(String d_describe) {
        this.d_describe = d_describe;
    }
}
