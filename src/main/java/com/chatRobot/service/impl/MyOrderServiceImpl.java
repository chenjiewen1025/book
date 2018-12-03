package com.chatRobot.service.impl;

import com.chatRobot.dao.BookDao;
import com.chatRobot.dao.MyOrderDao;
import com.chatRobot.model.MyOrder;
import com.chatRobot.model.Record;
import com.chatRobot.service.MyOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.jws.WebService;
import java.util.List;

@Service("myOrderService")
public class MyOrderServiceImpl implements MyOrderService {

    @Resource
    private MyOrderDao myOrderDao;
    @Override
    public void insertOrder(MyOrder myOrder) {

        this.myOrderDao.insertOrder(myOrder);
    }

    @Override
    public int borrowCount(int user_id) {

        return this.myOrderDao.borrowCount(user_id);
    }

    @Override
    public int bookBorrowExists(int user_id, int book_id) {
        return this.myOrderDao.bookBorrowExists(user_id,book_id);
    }




    @Override
    public void reBorrow(int order_id) {
        this.myOrderDao.reBorrow(order_id);
    }

    @Override
    public int selectOrderState(int order_id) {
        return this.myOrderDao.selectOrderState(order_id);
    }

    @Override
    public List<MyOrder> selectAllOrder(int user_id) {
        return this.myOrderDao.selectAllOrder(user_id);
    }

    @Override
    public List<MyOrder> selectIncompleteOrder(int user_id) {
        return this.myOrderDao.selectIncompleteOrder(user_id);
    }

    @Override
    public List<Record> selectRecord(int user_id,int page,String selectBookName) {
        return this.myOrderDao.selectRecord(user_id,page,selectBookName);
    }
}
