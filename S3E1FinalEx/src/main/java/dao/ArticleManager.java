package dao;

import java.sql.Date;

public class ArticleManager {
	private int id;
    private String title;
    private String subName;
    private Date subDate;

    public ArticleManager(int id, String title,String subName ,Date subDate) {
        this.id = id;
        this.title = title;
        this.subDate = subDate;
        this.subName = subName;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public Date getSubDate() {
        return subDate;
    }
    
    public String getSubName() {
        return subName;
    }
}
