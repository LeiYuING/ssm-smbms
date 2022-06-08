package com.leiyu.service;

import com.leiyu.mapper.ProviderMapper;
import com.leiyu.pojo.Pro;

import java.util.List;
import java.util.Map;

public class ProviderServiceImpl implements ProviderService{
    private ProviderMapper providerMapper;

    public void setProviderMapper(ProviderMapper providerMapper) {
        this.providerMapper = providerMapper;
    }


    @Override
    public int getProCount(Map map) {
        return providerMapper.getProCount(map);
    }

    @Override
    public Pro getProByID(int proID) {
        return providerMapper.getProByID(proID);
    }

    @Override
    public List<Pro> getProList(Map map) {
        return providerMapper.getProList(map);
    }

    @Override
    public int addPro(Pro pro) {
        return providerMapper.addPro(pro);
    }

    @Override
    public int updatePro(Pro pro) {
        return providerMapper.updatePro(pro);
    }

    @Override
    public int deletePro(int pid) {
        return providerMapper.deletePro(pid);
    }

    @Override
    public List<Pro> getAllProList() {
        return providerMapper.getAllProList();
    }
}
