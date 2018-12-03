package com.chatRobot.dao;

import com.chatRobot.model.MyOrder;
import com.chatRobot.model.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyOrderDao {
    void insertOrder(MyOrder myOrder);
    int borrowCount(@Param("user_id") int user_id);
    int bookBorrowExists(@Param("user_id") int user_id,@Param("book_id") int book_id);

    List<Record> reBorrow(@Param("order_id") int order_id);
    int selectOrderState(@Param("order_id") int order_id);
    List<MyOrder> selectAllOrder(@Param("user_id") int user_id);
    List<MyOrder> selectIncompleteOrder(@Param("user_id") int user_id);
   List<Record> selectRecord(@Param("user_id") int user_id,int page,
                             @Param("book_name") String selectBookName);
}
