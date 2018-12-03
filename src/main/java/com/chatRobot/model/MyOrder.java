package com.chatRobot.model;

import java.sql.Date;

public class MyOrder {
    private int order_id;
    private int user_id;
    private int book_id;
    private Date time_in;
    private Date time_out;
    private int order_state;
    private Date last_time;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public Date getTime_in() {
        return time_in;
    }

    public void setTime_in(Date time_in) {
        this.time_in = time_in;
    }

    public Date getTime_out() {
        return time_out;
    }

    public void setTime_out(Date time_out) {
        this.time_out = time_out;
    }

    public Date getLast_time() {
        return last_time;
    }

    public void setLast_time(Date last_time) {
        this.last_time = last_time;
    }

    public int getOrder_state() {
        return order_state;
    }

    public void setOrder_state(int order_state) {
        this.order_state = order_state;
    }


}
