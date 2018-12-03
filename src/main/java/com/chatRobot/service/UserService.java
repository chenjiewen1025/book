package com.chatRobot.service;

import com.chatRobot.model.User;

public interface UserService {
     User selectUser(String user_id);
     void updatePassword(String password,int user_id);
}
