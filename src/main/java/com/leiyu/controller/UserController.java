package com.leiyu.controller;

import com.leiyu.pojo.Role;
import com.leiyu.pojo.User;
import com.leiyu.service.RoleService;
import com.leiyu.service.UserService;
import com.leiyu.util.Constants;
import com.leiyu.util.PageSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes(Constants.USER_SESSION)
public class UserController {

    private UserService userService;

    @Autowired
    @Qualifier(value = "RoleService")
    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    private RoleService roleService;

    @Autowired
    @Qualifier(value = "UserService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/logout.do")
    public ModelAndView loginOut(ModelAndView modelAndView, SessionStatus status){
        status.setComplete();
        modelAndView.setViewName("redirect:login.jsp");
        return modelAndView;
    }
    @RequestMapping("/login")
    @ResponseBody
    public Map userLogin(HttpSession session,ModelAndView model,@RequestBody Map<String,Object> map){
        HashMap<String, String> hashMap = new HashMap<>();
        User loginUser = userService.getLoginUser(map);
        if(loginUser==null){
            hashMap.put("message","notexist");
            return hashMap;
        }else {
            //最好是使用@SessionAttributes注解来设置session
            session.setAttribute(Constants.USER_SESSION,loginUser);
            hashMap.put("message","true");
            return hashMap;
        }
    }

    //显示用户列表
    @RequestMapping(value = "/user.do",params = "method=query")
    public ModelAndView userList(ModelAndView model, @RequestParam(value = "queryname",defaultValue = "")@Nullable String queryname, @RequestParam("queryUserRole")@Nullable String queryUserRole, @RequestParam(value = "pageIndex",defaultValue = "1")@Nullable String pageIndex){
        //查询框
        int userRoleID = 0;//前端传递过来的角色id
        int pageSize = 10;//页面容量
        int currentPageNo = 1;//当前页码

        if (queryUserRole!=null&&!queryUserRole.equals("")){
            userRoleID=Integer.parseInt(queryUserRole);
        }//将前端传递过来的角色id转化为整型

        if (queryname==null){
            queryname = "";
        }//如果前端传递过来的用户名为空时，将空字符串传递给queryname，以便于后续查询使用

        if (pageIndex!=null){//如果当前页数为空
            currentPageNo = Integer.parseInt(pageIndex);
        }
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("queryname",queryname);
        map.put("userRoleID",userRoleID);
        int totalCount = userService.getUserCount(map);//用户总数

        PageSupport pageSupport = new PageSupport();
        pageSupport.setCurrentPageNo(currentPageNo);
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);

        int totalPageCount = pageSupport.getTotalPageCount();//总页面数

        if(currentPageNo<1){
            currentPageNo=1;
        }else if (currentPageNo>totalPageCount){
            currentPageNo=totalPageCount;
        }
        int startIndex = (currentPageNo-1)*pageSize;//当前页开始数

        List<Role> roleList = roleService.getRoleList();
        model.addObject("roleList",roleList);

        map.put("startIndex",startIndex);
        map.put("pageSize",pageSize);
        if (queryname!=null){
            model.addObject("queryname",queryname);
        }
        if (queryUserRole!=null){
            model.addObject("queryUserRole",queryUserRole);
        }
        List<User> userList = userService.getUserList(map);
        model.addObject("userList",userList);

        model.addObject("totalCount", totalCount);//用户总数
        model.addObject("currentPageNo",currentPageNo);//当前页数
        model.addObject("totalPageCount",totalPageCount);//页面数

        model.setViewName("jsp/userlist");
        return model;
    }

    //删除用户
    @RequestMapping(value = "/user.do",params = "method=deluser")
    public ModelAndView deleteUser(@RequestParam("uid")String uid,ModelAndView modelAndView){
        int i = userService.deleteUser(Integer.parseInt(uid));
        User user = userService.getUserByID(Integer.parseInt(uid));
        Map<String, String> map = new HashMap<>();
        if (user==null){
            map.put("delResult","notexist");
        }else {
            if (i>0){
                modelAndView.addObject(Constants.USER_SESSION,user);
                map.put("delResult","true");
            }else {
                map.put("delResult","false");
            }
        }
        return modelAndView;
    }

    //跳转到修改用户界面
    @RequestMapping(value = "/user.do",params = "method=modify")
    public ModelAndView toModifyUser(ModelAndView modelAndView,@RequestParam("uid")String uid){
        User user = userService.getUserByID(Integer.parseInt(uid));
        modelAndView.addObject("user",user);
        modelAndView.setViewName("jsp/usermodify");
        return modelAndView;
    }

    //修改用户信息
    @RequestMapping(value = "/user.do",params = "method=modifyexe")
    public ModelAndView modifyUser(ModelAndView modelAndView,@ModelAttribute User user){
        int i = userService.updateUser(user);
        if (user.getUserName()==null){
            modelAndView.addObject("message","用户姓名不能为空");
            modelAndView.setViewName("jsp/usermodify");
        }else {
            if (i>0){
                modelAndView.setViewName("redirect:/user.do?method=query");
            }else {
                modelAndView.addObject("message","修改信息失败");
                modelAndView.setViewName("jsp/usermodify");
            }
        }

        return modelAndView;
    }

    //查看用户信息
    @RequestMapping(value = "/user.do",params ={"method=view"})
    public ModelAndView viewUser(ModelAndView modelAndView,@RequestParam("uid")String uid){
        User user = userService.getUserByID(Integer.parseInt(uid));
        modelAndView.addObject("user",user);
        modelAndView.setViewName("jsp/userview");
        return modelAndView;
    }

    //添加用户
    @RequestMapping(value = "/user.do",params = "method=add")
    public ModelAndView addUser(ModelAndView modelAndView,@ModelAttribute User user){
        int i = userService.addUser(user);
        if (user.getUserName()==null||user.getUserCode()==null||user.getUserPassword()==null){
            modelAndView.addObject("message","请检查输入信息");
            modelAndView.setViewName("jsp/useradd");
        }else {
            if (i<1){
                modelAndView.addObject("message","添加失败");
                modelAndView.setViewName("jsp/useradd");
            }else {
                modelAndView.setViewName("redirect:/user.do?method=query");
            }
        }
        return modelAndView;
    }

    //判断userCode是否存在
    @RequestMapping(value = "/user.do",params = "method=ucexist")
    @ResponseBody
    @CrossOrigin(origins = "*", maxAge = 3600)
    public Map ucExist(@RequestParam("userCode")String userCode, HttpServletResponse response){
        User user = userService.ucExist(userCode);
        Map<String, String> map = new HashMap<>();
        if (user!=null){
            map.put("userCode","exist");
        }
//        response.setHeader("Access-Control-Allow-Origin", "*");
        return map;
    }

    //修改用户密码
    @RequestMapping(value = "/user.do",params = "method=savepwd")
    public ModelAndView savePwd(ModelAndView modelAndView, HttpSession session,@RequestParam("newpassword")String password){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Map<String, Object> map = new HashMap<>();
        map.put("id",user.getId());
        map.put("userPassword",password);
        int i = userService.updatePwd(map);
        if (i>0){
            modelAndView.addObject("message","密码修改成功，请退出重新登录！");
            session.removeAttribute(Constants.USER_SESSION);
            modelAndView.setViewName("jsp/pwdmodify");
        }else {
            modelAndView.addObject("message","密码修改失败");
            modelAndView.setViewName("jsp/pwdmodify");
        }
        return modelAndView;
    }

    //验证密码
    @RequestMapping(value = "/user.do",params = "method=pwdmodify")
    @ResponseBody
    public Map verifyPwd(@RequestParam("oldpassword")String oldpassword,HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Map<String, String> map = new HashMap<>();
        if (user==null){
            map.put("result","sessionerror");
        }else{
            if (oldpassword==null){
                map.put("result","error");
            }else{
                if (user.getUserPassword().equals(oldpassword)){
                    map.put("result","true");
                }else{
                    map.put("result","false");
                }
            }
        }

        return map;

    }

}
