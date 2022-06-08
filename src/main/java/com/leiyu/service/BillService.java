package com.leiyu.service;

import com.leiyu.pojo.Bill;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BillService {
    //获取订单列表
    List getBillList(Map map);
    //获取订单总数
    int getBillCount(Map map);
    //添加订单
    int addBill(Bill bill);
    //通过id得到订单
    Bill getBillById(int id);
    //更新订单信息
    int updateBill(Bill bill);
    //删除订单
    int deleteBill(int id);

}
