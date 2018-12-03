package com.chatRobot.service.impl;

import com.chatRobot.dao.BookDao;
import com.chatRobot.dao.MyOrderDao;
import com.chatRobot.model.Book;
import com.chatRobot.model.MyOrder;
import com.chatRobot.service.BookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

@Service("bookService")
public class BookServiceImpl implements BookService {
    @Resource
    private BookDao bookDao;
    @Resource
    private MyOrderDao myOrderDao;

    public Book selectBookById(String book_id) {
        int id = Integer.parseInt(book_id);
        return this.bookDao.selectBookById(id);

    }


    public String canBorrow(int book_id, int user_id) {

        int book_num = this.bookDao.usableNum(book_id);
        int user_num = this.myOrderDao.borrowCount(user_id);
        int exists = this.myOrderDao.bookBorrowExists(user_id, book_id);
       if (book_num <= 0)
            return "书本数量不足";

            if (user_num >= 5)
               return "借书达到上限5本！";

      if (exists==1)
           return "你已借阅此书尚未归还！";

           return "1";


}

    @Override
    public String borrow(int book_id,int user_id) {

        String mess = canBorrow(book_id,user_id);
        if ("1".equals(mess)) {
            this.bookDao.borrow(book_id);   //数量-1
            //插入借阅记录
            MyOrder myOrder = new MyOrder();
            myOrder.setBook_id(book_id);

            myOrder.setUser_id(user_id);
            Date time_out = new Date(System.currentTimeMillis());
            Calendar cal = Calendar.getInstance();
            cal.setTime(time_out);
            cal.add(Calendar.DATE, 30);
            java.sql.Date last_time = new java.sql.Date(cal.getTime().getTime());
            myOrder.setLast_time(last_time);
            myOrder.setTime_out(time_out);
            this.myOrderDao.insertOrder(myOrder);
            return "1";
        }
        else
            return mess;





    }

    @Override
    public int usableNum(int book_id) {
        return this.bookDao.usableNum(book_id);

    }

    @Override
    public List<Book> selectBook(String book_name,String actor_name,int page) {
        return this.bookDao.selectBook(book_name,actor_name,page);
    }


}
