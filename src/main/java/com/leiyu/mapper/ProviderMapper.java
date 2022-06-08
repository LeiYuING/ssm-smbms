package com.leiyu.mapper;

import com.leiyu.pojo.Pro;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface ProviderMapper {
    //查询供应商总数
    int getProCount(Map map);
    //根据id获得供应商信息
    Pro getProByID(@Param("id")int proID);
    //获取供应商列表
    List<Pro> getProList(Map map);
    //添加供应商
    int addPro(Pro pro);
    //更新供应商信息
    int updatePro(Pro pro);
    //通过id删除供应商
    int deletePro(@Param("id")int pid);
    //获得全部Pro
    List<Pro> getAllProList();
}
