package com.leiyu.service;

import com.leiyu.mapper.UserMapper;
import com.leiyu.pojo.User;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService{
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public User getLoginUser(Map userMap) {
        return userMapper.getLoginUser(userMap);
    }

    @Override
    public User getUserByID(int userID) {
        return userMapper.getUserByID(userID);
    }

    @Override
    public List<User> getUserList(Map map) {
        return userMapper.getUserList(map);
    }

    @Override
    public int getUserCount(Map map) {
        return userMapper.getUserCount(map);
    }

    @Override
    public int deleteUser(int uid) {
        return userMapper.deleteUser(uid);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public User ucExist(String userCode) {
        return userMapper.ucExist(userCode);
    }

    @Override
    public int updatePwd(Map map) {
        return userMapper.updatePwd(map);
    }
}
