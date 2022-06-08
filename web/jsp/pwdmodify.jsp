<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<%
    String attribute = (String)request.getAttribute("message");
%>

<div class="layui-fluid" style="margin-left: 30%;margin-top: 7%">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
                <form id="userForm" name="userForm" method="post" class="layui-form" action="${pageContext.request.contextPath}/jsp/user.do">
                    <input type="hidden" name="method" value="savepwd">
                    <!--div的class 为error是验证错误，ok是验证成功-->
                    <div class="info">${message}</div>
<%--                    <div class="layui-form-item">--%>
<%--                        <label class="layui-form-label">密码框</label>--%>
<%--                        <div class="layui-input-inline">--%>
<%--                            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">--%>
<%--                        </div>--%>
<%--                        <div class="layui-form-mid layui-word-aux">辅助文字</div>--%>
<%--                    </div>--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label" for="oldPassword">旧密码：</label>
                        <div class="layui-input-inline">
                        <input type="password" name="oldpassword" id="oldpassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="">
                        </div>
						<font color="red"></font>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" for="newPassword">新密码：</label>
                        <div class="layui-input-inline">
                        <input type="password" name="newpassword" id="newpassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="">
                        </div>
						<font color="red"></font>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" for="newPassword">确认新密码：</label>
                        <div class="layui-input-inline">
                        <input type="password" name="rnewpassword" id="rnewpassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="">
                        </div>
						<font color="red"></font>
                    </div>
                    <div class="providerAddBtn">
                        <!--<a href="#">保存</a>-->
                        <button type="submit" name="save" id="save" value="保存" class="layui-btn " style="position: relative;right: 125px;width: 150px">保存</button>
                    </div>
                </form>
    </section>
        </div>
    </div>
</div>
<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="../js/pwdmodify.js"></script>