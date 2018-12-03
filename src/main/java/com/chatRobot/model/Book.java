package com.chatRobot.model;

public class Book {
  private int book_id;
  private String book_name;
    private int total_num;
    private int usable_num;
    private String book_actor;
    private String content;
    private String address;

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public int getTotal_num() {
        return total_num;
    }

    public void setTotal_num(int total_num) {
        this.total_num = total_num;
    }

    public int getUsable_num() {
        return usable_num;
    }

    public void setUsable_num(int usable_num) {
        this.usable_num = usable_num;
    }

    public String getBook_actor() {
        return book_actor;
    }

    public void setBook_actor(String book_actor) {
        this.book_actor = book_actor;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
