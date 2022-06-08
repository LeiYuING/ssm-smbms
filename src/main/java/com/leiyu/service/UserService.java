package com.leiyu.service;

import com.leiyu.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserService {
    //得到要登录的用户
    User getLoginUser(Map userMap);
    //通过ID得到用户
    User getUserByID(int userID);
    //得到用户列表
    List<User> getUserList(Map map);
    //获取用户总数
    int getUserCount(Map map);
    //删除用户
    int deleteUser(int uid);
    //修改用户
    int  updateUser(User user);
    //添加用户
    int addUser(User user);
    //判断userCode是否存在
    User ucExist(String userCode);
    //修改用户密码
    int updatePwd(Map map);
}
