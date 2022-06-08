<%@ page import="com.leiyu.util.Constants" %>
<%@ page import="com.leiyu.pojo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>

<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" />
    <script>
        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function(){
            var element = layui.element;

            //…
        });
    </script>
</head>

<div class="container">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/jsp/frame.jsp">SMBMS</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
<%--    <ul class="layui-nav right"  lay-filter="">--%>
<%--        <li class="layui-nav-item">--%>
<%--            <a href="javascript:;" >admin</a>--%>
<%--            <dl class="layui-nav-child">--%>
<%--                <!-- 二级菜单 -->--%>
<%--                <dd>--%>
<%--                    <a href="${pageContext.request.contextPath}/logout.do">退出</a></dd>--%>
<%--            </dl>--%>
<%--        </li>--%>
<%--    </ul>--%>
</div>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="${pageContext.request.contextPath}/bill.do?method=query">
                    <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe723;</i>
                    <cite>订单管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/provider.do?method=query">
                    <i class="iconfont left-nav-li" lay-tips="供应商管理">&#xe723;</i>
                    <cite>供应商管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/user.do?method=query">
                    <i class="iconfont left-nav-li" lay-tips="用户管理">&#xe726;</i>
                    <cite>用户管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/jsp/pwdmodify.jsp">
                    <i class="iconfont left-nav-li" lay-tips="其它页面">&#xe6b4;</i>
                    <cite>修改密码</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout.do">
                    <i class="iconfont left-nav-li" lay-tips="退出登录">&#xe6b4;</i>
                    <cite>退出登录</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
            </li>
        </ul>
    </div>
</div>


<!--头部-->
<%--    <header class="publicHeader">--%>
<%--        <h1>超市订单管理系统</h1>--%>
<%--        <div class="publicHeaderR">--%>
<%--            <p><span>下午好！</span><span style="color: #fff21b"> </span></p>--%>
<%--            <a href="${pageContext.request.contextPath}/logout.do">退出</a>--%>
<%--        </div>--%>
<%--    </header>--%>
<%--<!--时间-->--%>
<%--    <section class="publicTime">--%>
<%--        <span id="time" >2015年1月1日 11:11  星期一</span>--%>
<%--        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>--%>
<%--    </section>--%>
<%-- <!--主体内容-->--%>
<%-- <section class="publicMian ">--%>
<%--     <div class="left">--%>
<%--         <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>--%>
<%--         <nav>--%>
<%--             <ul class="list">--%>
<%--                 <li ><a href="${pageContext.request.contextPath}/bill.do?method=query">订单管理</a></li>--%>
<%--              <li><a href="${pageContext.request.contextPath}/provider.do?method=query">供应商管理</a></li>--%>
<%--              <li><a href="${pageContext.request.contextPath}/user.do?method=query">用户管理</a></li>--%>
<%--              <li><a href="${pageContext.request.contextPath}/jsp/pwdmodify.jsp">密码修改</a></li>--%>
<%--              <li><a href="${pageContext.request.contextPath}/logout.do">退出系统</a></li>--%>
<%--             </ul>--%>
<%--         </nav>--%>
<%--     </div>--%>
<%--     <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>--%>
<%--     <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>--%>