package com.chatRobot.dao;

import com.chatRobot.model.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    User selectUser(int user_id);
    void updatePassword(@Param("password") String password, @Param("user_id") int user_id);
}
