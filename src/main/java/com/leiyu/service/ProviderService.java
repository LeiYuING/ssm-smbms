package com.leiyu.service;

import com.leiyu.pojo.Pro;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ProviderService {

    //查询供应商总数
    int getProCount(Map map);
    //根据id获得供应商信息
    Pro getProByID(int proID);
    //获取供应商列表
    List<Pro> getProList(Map map);
    //添加供应商
    int addPro(Pro pro);
    //更新供应商信息
    int updatePro(Pro pro);
    //通过id删除供应商
    int deletePro(int pid);
    //获得全部Pro
    List<Pro> getAllProList();
}
