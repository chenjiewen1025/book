package com.chatRobot.service;


import com.chatRobot.model.Book;
import com.chatRobot.model.MyOrder;

import java.util.List;

public interface BookService {
    Book selectBookById(String book_id);
    String canBorrow(int book_id, int user_id);
    String borrow (int book_id, int user_id);
    int usableNum(int book_id);
    List<Book> selectBook(String book_name,String actor_name,int page);

}
