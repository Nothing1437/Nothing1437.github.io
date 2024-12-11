package dao;


public class UserManager {
	private String id;
    private String pwd;
    private String name;

    public UserManager(String id, String pwd,String name ) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public String getPwd() {
        return pwd;
    }

    public String getName() {
        return name;
    }
}
