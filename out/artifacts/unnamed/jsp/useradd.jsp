<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%
    String attribute = (String)request.getAttribute("message");
%>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
            <form class="layui-form" id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user.do">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <input type="hidden" name="method" value="add">
                <div class="layui-form-item">
                    <% if(attribute==null){}else{%><%=attribute%><%}%>
                    <label class="layui-form-label" for="userCode">用户编码：</label>
                        <div class="layui-input-inline">
                    <input type="text" name="userCode" id="userCode" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                            <!-- 放置提示信息 --></div>
					<font color="red"></font>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" for="userName">用户名称：</label>
                    <div class="layui-input-inline">
                    <input type="text" name="userName" id="userName" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                    </div>
					<font color="red"></font>
                </div>
                <div class="layui-form-item">
                    <label for="userPassword" class="layui-form-label">用户密码:</label>
                    <div class="layui-input-inline">
                        <input type="password" name="userPassword" id="userPassword" value="" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        <font color="red"></font>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="ruserPassword" class="layui-form-label">确认密码:</label>
                    <div class="layui-input-inline">
                        <input type="password" name="ruserPassword" id="ruserPassword" value="" required lay-verify="required" placeholder="确认密码" autocomplete="off" class="layui-input">
                        <font color="red"></font>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">用户性别:</label>
                    <div class="layui-input-inline">
                        <select name="gender" id="gender" lay-verify="required">
                            <option value="1" selected="selected">男</option>
                            <option value="2">女</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" for="birthday">出生日期：</label>
                    <div class="layui-input-inline">
                    <input type="text" required  lay-verify="required"  autocomplete="off" class="layui-input" id="birthday" name="birthday"
					readonly="readonly" onclick="WdatePicker();">
                    </div>
					<font color="red"></font>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" for="phone">用户电话：</label>
                    <div class="layui-input-inline">
                    <input type="text" name="phone" id="phone" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                    </div>
					<font color="red"></font>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" for="address">用户地址：</label>
                    <div class="layui-input-inline">
                   <input name="address" id="address" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
</div>
            </div>
        </div>
</section>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

    });
</script>

<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="../js/userAdd.js"></script>
