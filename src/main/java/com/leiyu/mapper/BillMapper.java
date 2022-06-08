package com.leiyu.mapper;

import com.alibaba.fastjson.support.geo.LineString;
import com.leiyu.pojo.Bill;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BillMapper {
    //获取订单列表
    List getBillList(Map map);
    //获取订单总数
    int getBillCount(Map map);
    //添加订单
    int addBill(Bill bill);
    //通过id得到订单
    Bill getBillById(@Param("id")int id);
    //更新订单信息
    int updateBill(Bill bill);
    //删除订单
    int deleteBill(@Param("id")int id);
}
