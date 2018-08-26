package vo;

public class ConditionNote {
    private String e_name;
    private String n_state;

    public String getE_name() {
        return e_name;
    }

    public void setE_name(String e_name) {
        this.e_name = e_name;
    }

    public String getN_state() {
        return n_state;
    }

    public void setN_state(String n_state) {
        this.n_state = n_state;
    }

    public ConditionNote(String e_name, String n_state) {
        this.e_name = e_name;
        this.n_state = n_state;
    }

    public ConditionNote() {

    }
}
