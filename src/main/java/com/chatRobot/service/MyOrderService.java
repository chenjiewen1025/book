package com.chatRobot.service;

import com.chatRobot.model.MyOrder;
import com.chatRobot.model.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MyOrderService {
    void insertOrder(MyOrder myOrder);
    int borrowCount(int user_id);
    int bookBorrowExists(int user_id,int book_id);
    void reBorrow(int order_id);
    int selectOrderState(int order_id);
    List<MyOrder> selectAllOrder(int user_id);
    List<MyOrder> selectIncompleteOrder(int user_id);
    List<Record> selectRecord(int user_id,int page,String selectBookName);

}
