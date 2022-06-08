package com.leiyu;

import com.leiyu.pojo.Books;
import com.leiyu.pojo.Pro;
import com.leiyu.pojo.User;
import com.leiyu.service.BillService;
import com.leiyu.service.BillServiceImpl;
import com.leiyu.service.ProviderService;
import com.leiyu.service.UserService;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class test {
    @Test
    public void test01(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicontext.xml");
        UserService userService1 = context.getBean("UserService", UserService.class);
        Map<String, Object> map = new HashMap<>();

        SqlSessionFactory sqlSessionFactoryBean = (SqlSessionFactory) new SqlSessionFactoryBean();
        map.put("queryname",null);
        map.put("userRoleID",null);
        map.put("startIndex",0);
        map.put("pageSize",5);
        List<User> userList = userService1.getUserList(map);
        for (User user : userList) {
            System.out.println(user);
        }


    }
}
