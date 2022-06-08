package com.leiyu.controller;

import com.leiyu.pojo.Pro;
import com.leiyu.service.ProviderService;
import com.leiyu.util.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProviderController {
    private ProviderService providerService;

    @Autowired
    @Qualifier("ProviderService")
    public void setProviderService(ProviderService providerService) {
        this.providerService = providerService;
    }
    //查询供应商
    @RequestMapping(value = "provider.do",params = {"method=query"})
    public ModelAndView query(ModelAndView modelAndView, @RequestParam("queryProCode")@Nullable String queryProCode, @RequestParam("queryProName")@Nullable String queryProName, @RequestParam("pageIndex")@Nullable String pageIndex){
        int currentPageNo = 1;//当前页码
        int pageSize = 5;//页面容量
        if (pageIndex!=null){
            currentPageNo = Integer.parseInt(pageIndex);
        }//当传递过来的页码不为空时，赋值给currentPageNo
        if (queryProCode==null){
            queryProCode="";
        }//当传递过来的供应商编码为空时，将其转变为空字符串
        if (queryProName==null){
            queryProName="";
        }
        Map<String, Object> map = new HashMap<>();
        map.put("ProCode",queryProCode);
        map.put("ProName",queryProName);
        int totalCount = providerService.getProCount(map);//获得供应商总数

        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(pageSize);//页面容量
        pageSupport.setTotalCount(totalCount);//供应商总数
        pageSupport.setCurrentPageNo(currentPageNo);//当前页码

        int totalPageCount = pageSupport.getTotalPageCount();

        if (currentPageNo<1){
            currentPageNo = 1;
        }
        if (currentPageNo>totalPageCount){
            currentPageNo = totalPageCount;
        }

        int startIndex = (currentPageNo-1)*pageSize;//当前页起始数

        map.put("startIndex",startIndex);
        map.put("pageSize",pageSize);

        if (queryProCode!=null){
            modelAndView.addObject("queryProCode",queryProCode);
        }
        if (queryProName!=null){
            modelAndView.addObject("queryProName",queryProName);
        }

        List<Pro> proList = providerService.getProList(map);
        modelAndView.addObject("providerList",proList);

        modelAndView.addObject("totalCount",totalCount);//用户总数
        modelAndView.addObject("currentPageNo",currentPageNo);//当前页数
        modelAndView.addObject("totalPageCount",totalPageCount);//页面总数

        modelAndView.setViewName("jsp/providerlist");
        return modelAndView;
    }
    //添加供应商
    @RequestMapping(value = "/provider.do",params = {"method=add"})
    public ModelAndView add(ModelAndView modelAndView,@ModelAttribute Pro pro){
        int i = providerService.addPro(pro);
        if (i<1){
            modelAndView.addObject("message","添加失败");
            modelAndView.setViewName("jsp/provideradd");
        }else {
            modelAndView.setViewName("redirect:/provider.do?method=query");
        }
        return modelAndView;
    }
    //跳转到修改供应商界面
    @RequestMapping(value = "/provider.do",params = {"method=modify"})
    public ModelAndView modify(ModelAndView modelAndView,@RequestParam("proid")String id){
        Pro pro = providerService.getProByID(Integer.parseInt(id));
        modelAndView.addObject("provider",pro);
        modelAndView.setViewName("jsp/providermodify");
        return modelAndView;
    }
    //提交修改用户表单
    @RequestMapping(value = "provider.do",params = {"method=modifyexe"})
    public ModelAndView modifyexe(ModelAndView modelAndView,@ModelAttribute Pro pro){
        int i = providerService.updatePro(pro);
        if (i>0){
            modelAndView.setViewName("redirect:/provider.do?method=query");
        }else {
            modelAndView.addObject("message","修改信息失败");
            modelAndView.setViewName("jsp/usermodify");
        }
        return modelAndView;
    }
    //查看供应商信息
    @RequestMapping(value = "/provider.do",params = {"method=view"})
    public ModelAndView view(ModelAndView modelAndView,@RequestParam("proid")String id){
        Pro pro = providerService.getProByID(Integer.parseInt(id));
        modelAndView.addObject("provider",pro);
        modelAndView.setViewName("jsp/providerview");
        return  modelAndView;
    }
    //删除供应商信息
    @RequestMapping(value = "/provider.do",params = {"method=delprovider"})
    @ResponseBody
    public Map delprovider(@RequestParam("proid") String proid){
        Pro pro = providerService.getProByID(Integer.parseInt(proid));
        int i = providerService.deletePro(Integer.parseInt(proid));
        Map<String, String> map = new HashMap<>();
        if (pro==null){
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
