package dao;

import java.sql.Date;

public class Article {
    private int id;
    private String title;
    private Date subDate;

    public Article(int id, String title, Date subDate) {
        this.id = id;
        this.title = title;
        this.subDate = subDate;
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
    

    
}
