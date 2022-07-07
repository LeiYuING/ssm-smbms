package com.leiyu.controller;

import com.leiyu.pojo.Bill;
import com.leiyu.pojo.Pro;
import com.leiyu.service.BillService;
import com.leiyu.service.ProviderService;
import com.leiyu.util.PageSupport;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class BillController{
    private BillService billService;
    private ProviderService providerService;

    @Autowired
    @Qualifier("ProviderService")
    public void setProviderService(ProviderService providerService) {
        this.providerService = providerService;
    }

    @Autowired
    @Qualifier("BillService")
    public void setBillService(BillService billService) {
        this.billService = billService;
    }

    //查询订单列表
    @RequestMapping(value = "bill.do",params = {"method=query"})
    public ModelAndView query(ModelAndView modelAndView, @RequestParam("queryProductName")@Nullable String queryProductName,@RequestParam("queryProviderId")@Nullable String queryProviderId,@RequestParam("queryIsPayment")@Nullable String queryIsPayment,@RequestParam("pageIndex")@Nullable String pageIndex){
        int currentPageNo = 1;//当前页面
        int pageSize = 5;//页面容量
        int isPayment = 0;//是否付款
        int providerId = 0;//供应商ID
        if (queryProductName==null){
            queryProductName = "";
        }//将生产名赋空字符串
        if (queryProviderId!=null&&!queryProviderId.equals("")){
            providerId = Integer.parseInt(queryProviderId);
        }//将供应商id赋值
        if (queryIsPayment!=null&&!queryIsPayment.equals("")){
            isPayment = Integer.parseInt(queryIsPayment);
        }//将是否付款信息赋值
        if (pageIndex!=null&&!queryIsPayment.equals("")){
            currentPageNo = Integer.parseInt(pageIndex);
        }//将当前页面数赋值

        Map<String, Object> map = new HashMap<>();
        map.put("productName",queryProductName);
        map.put("providerId",queryProviderId);
        map.put("isPayment",isPayment);
        int totalCount = billService.getBillCount(map);//查询订单总数

        PageSupport pageSupport = new PageSupport();
        pageSupport.setCurrentPageNo(currentPageNo);
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);
        int totalPageCount = pageSupport.getTotalPageCount();//获得页面总数


        if (currentPageNo<1){
            currentPageNo = 1;
        }
        if (currentPageNo>totalPageCount){
            currentPageNo = totalPageCount;
        }

        int startIndex = (currentPageNo-1)*pageSize;//当前页面起始数
        map.put("startIndex",startIndex);
        map.put("pageSize",pageSize);
        List billList = billService.getBillList(map);//获取订单列表

        modelAndView.addObject("billList",billList);

        List<Pro> proList = providerService.getAllProList();
        modelAndView.addObject("providerList",proList);

        if (queryProviderId!=null){
            modelAndView.addObject("queryProviderId",queryProviderId);
        }
        if (queryIsPayment!=null){
            modelAndView.addObject("queryIsPayment",queryIsPayment);
        }
        if (queryProductName!=null){
            modelAndView.addObject("queryProductName",queryProductName);
        }
        modelAndView.addObject("totalPageCount",totalPageCount);
        modelAndView.addObject("totalCount",totalCount);
        modelAndView.addObject("currentPageNo",currentPageNo);

        modelAndView.setViewName("jsp/billlist");
        return modelAndView;
    }
    //添加订单
    @RequestMapping(value = "bill.do",params = "method=add")
    public ModelAndView add(ModelAndView modelAndView, @ModelAttribute Bill bill){
        int i = billService.addBill(bill);
        if (bill.getProviderId()==null){
            modelAndView.addObject("message","供应商ID不能为空");
            modelAndView.setViewName("jsp/billadd");
        }else {
            if (i<1){
                modelAndView.addObject("message","添加失败");
                modelAndView.setViewName("jsp/billadd");
            }else {
                modelAndView.setViewName("redirect:/bill.do?method=query");
            }
        }
        return modelAndView;
    }
    //得到供应商列表
    @RequestMapping(value = "bill.do",params = "method=getproviderlist")
    @ResponseBody
    public List getProviderList(){
        List<Pro> allProList = providerService.getAllProList();
        return allProList;
    }
    //访问订单信息
    @RequestMapping(value = "bill.do",params = "method=view")
    public ModelAndView view(ModelAndView modelAndView,@RequestParam("billid")String id){
        Bill bill = billService.getBillById(Integer.parseInt(id));
        modelAndView.addObject("bill",bill);
        modelAndView.setViewName("jsp/billview");
        return modelAndView;
    }
    //转发至订单页面
    @RequestMapping(value = "bill.do",params = "method=modify")
    public ModelAndView modify(ModelAndView modelAndView,@RequestParam("billid")String id){
        Bill bill = billService.getBillById(Integer.parseInt(id));
        modelAndView.addObject("bill",bill);
        log.info("转发至订单页面");
        modelAndView.setViewName("jsp/billmodify");

        return modelAndView;
    }
    //修改订单信息
    @RequestMapping(value = "bill.do",params = "method=modifysave")
    public ModelAndView modifysave(ModelAndView modelAndView, @ModelAttribute Bill bill){
        int i = billService.updateBill(bill);
        if (i>0){
            modelAndView.setViewName("redirect:/bill.do?method=query");
        }else {
            modelAndView.setViewName("jsp/billmodify");
        }
        return modelAndView;
    }
    //删除订单
    @RequestMapping(value = "bill.do",params = "method=delbill")
    @ResponseBody
    public Map delbill(@RequestParam("billid")String id){
        Bill bill = billService.getBillById(Integer.parseInt(id));
        int i = billService.deleteBill(Integer.parseInt(id));
        Map<String, String> map = new HashMap<>();
        if (bill==null){
            map.put("delResult","notexist");
        }else {
            if (i>0){
                map.put("delResult","true");
            }else {
                map.put("delResult","false");
            }
        }
        return map;
    }

}
