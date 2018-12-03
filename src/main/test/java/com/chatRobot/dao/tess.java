package com.chatRobot.dao;

import com.chatRobot.model.Record;
import com.chatRobot.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class tess {


    @Autowired
    private MyOrderDao bookDao;



@Test
        public  void  go() {
//
//
//      List<Record> a =  bookDao.selectRecord(201599);
//      System.out.println(a.hashCode());
//      for (Record b:a){
//         System.out.println( b.getBook_id());
//      }
//
        }

    }

