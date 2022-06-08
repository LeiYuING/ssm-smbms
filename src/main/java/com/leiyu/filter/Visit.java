package com.leiyu.filter;

import com.leiyu.pojo.User;
import com.leiyu.util.Constants;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Visit implements HandlerInterceptor {//由于静态资源释放出问题了，所以这里只能过滤请求，无法过滤静态资源
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        System.out.println(uri);
        if (!uri.matches("/unnamed/login")&&!uri.matches("/unnamed/loginError")&&uri.matches("/unnamed/logout")){
            User attribute = (User) request.getSession().getAttribute(Constants.USER_SESSION);
            if (attribute==null){
                response.sendRedirect("loginError.jsp");
                return false;
            }
        }
            return true;

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
