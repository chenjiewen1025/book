package com.chatRobot.service.impl;

import com.chatRobot.dao.UserDao;
import com.chatRobot.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements com.chatRobot.service.UserService {

    @Resource
    private UserDao userDao;

    public User selectUser(String user_id) {
        int id = Integer.parseInt(user_id);
        return this.userDao.selectUser(id);
    }

    @Override
    public void updatePassword(String password, int user_id) {

       this.userDao.updatePassword(password,user_id);
    }

}