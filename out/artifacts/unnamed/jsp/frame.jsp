<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.leiyu.util.Constants" %>
<%@ page import="com.leiyu.pojo.User" %>
<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page import="org.springframework.ui.ModelMap" %>
<%@include file="common/head.jsp"%>

<%
    User user = (User) request.getSession().getAttribute(Constants.USER_SESSION);
%>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
<div class="layui-col-md12">
    <div class="layui-card">
        <div class="layui-card-body ">
            <blockquote class="layui-elem-quote">欢迎来到超市订单管理系统!
                <span class="x-red"><%=user.getUserName()%></span>
            </blockquote>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">系统信息</div>
                <div class="layui-card-body ">
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <th>xxx版本</th>
                            <td>1.0.180420</td></tr>
                        <tr>
                            <th>操作系统</th>
                            <td>WINNT</td></tr>
                        <tr>
                            <th>运行环境</th>
                            <td>Apache/2.4.23 (Win32) OpenSSL/1.0.2j mod_fcgid/2.3.9</td></tr>
                        <tr>
                            <th>MYSQL版本</th>
                            <td>5.5.53</td></tr>
                        <tr>
                            <th>ThinkPHP</th>
                            <td>5.0.18</td></tr>
                        <tr>
                            <th>上传附件限制</th>
                            <td>2M</td></tr>
                        <tr>
                            <th>剩余空间</th>
                            <td>86015.2M</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">开发团队</div>
                <div class="layui-card-body ">
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <th>版权所有</th>
                            <td>xuebingsi(xuebingsi)
                                <a href="http://x.xuebingsi.com/" target="_blank">访问官网</a></td>
                        </tr>
                        <tr>
                            <th>开发者</th>
                            <td>雷宇(1259702047@qq.com)</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <style id="welcome_style"></style>
        <div class="layui-col-md12">
            <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,百度Echarts,jquery,本系统由x-admin提供技术支持。</blockquote></div>
    </div>
    </div>
</div>
    </div>
</div>
<%--<div class="right">--%>
<%--    <img class="wColck" src="../images/clock.jpg" alt=""/>--%>
<%--    <div class="wFont">--%>
<%--        <h2><%=user.getUserName()%></h2>--%>
<%--        <p>欢迎来到超市订单管理系统!</p>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</section>--%>

