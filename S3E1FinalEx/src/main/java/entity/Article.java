package entity;

public class Article {
    private int id;
    private String title;
    private String content;

    // 构造函数
    public Article(int id, String title, String content) {
        this.id = id;
        this.title = title;
        this.content = content;
    }

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
