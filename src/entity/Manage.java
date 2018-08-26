package entity;

public class Manage {
    private Long m_id;
    private String m_name;
    private String m_password;

    public Long getM_id() {
        return m_id;
    }

    public void setM_id(Long m_id) {
        this.m_id = m_id;
    }

    public String getM_name() {
        return m_name;
    }

    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    public String getM_password() {
        return m_password;
    }

    public void setM_password(String m_password) {
        this.m_password = m_password;
    }

    public Manage() {

    }

    public Manage(Long m_id, String m_name, String m_password) {
        this.m_id = m_id;
        this.m_name = m_name;
        this.m_password = m_password;
    }

    public Manage(String m_name, String m_password) {
        this.m_name = m_name;
        this.m_password = m_password;
    }
}
