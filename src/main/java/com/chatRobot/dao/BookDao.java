package com.chatRobot.dao;

import com.chatRobot.model.Book;
import com.chatRobot.model.MyOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDao {
    Book selectBookById(int book_id);

    void borrow (int book_id);

    int usableNum(int book_id);

    List<Book> selectBook(@Param("book_name")String book_name,
                                @Param("actor_name") String actor_name,int page);


}
