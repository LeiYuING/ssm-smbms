package com.leiyu.service;

import com.leiyu.mapper.BillMapper;
import com.leiyu.pojo.Bill;

import java.util.List;
import java.util.Map;

public class BillServiceImpl implements BillService{
    private BillMapper billMapper;

    public void setBillMapper(BillMapper billMapper) {
        this.billMapper = billMapper;
    }

    @Override
    public List getBillList(Map map) {
        return billMapper.getBillList(map);
    }

    @Override
    public int getBillCount(Map map) {
        return billMapper.getBillCount(map);
    }

    @Override
    public int addBill(Bill bill) {
        return billMapper.addBill(bill);
    }

    @Override
    public Bill getBillById(int id) {
        return billMapper.getBillById(id);
    }

    @Override
    public int updateBill(Bill bill) {
        return billMapper.updateBill(bill);
    }

    @Override
    public int deleteBill(int id) {
        return billMapper.deleteBill(id);
    }


}
