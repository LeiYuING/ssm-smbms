<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <table class="layui-table">
                    <tr>
                        <th><strong>用户编号：</strong></th>
                        <th><span>${user.userCode }</span></th>
                    </tr>
                    <tbody>
                    <tr>
                        <td><strong>用户名称：</strong></td>
                        <td><span>${user.userName }</span></td>
                    </tr>
                    <tr>
                        <td><strong>用户性别：</strong></td>
                        <td><c:if test="${user.gender == 1 }">男</c:if>
                            <c:if test="${user.gender == 2 }">女</c:if></td>
                    </tr>
                    <tr>
                        <th><strong>出生日期：</strong></th>
                        <th><span>${user.birthday }</span></th>
                    </tr>
                    <tr>
                        <th><strong>用户电话：</strong></th>
                        <th><span>${user.phone }</span></th>
                    </tr>
                    <tr>
                        <th><strong>用户地址：</strong></th>
                        <th><<span>${user.address }</span></th>
                    </tr>
                    </tbody>
                </table>
                <div class="layui-inline layui-show-xs-block">
                    <button type="submit" class="layui-btn" id="back" name="back" value="返回"  lay-submit="" lay-filter="sreach">返回</button>
                </div>
            </div>
        </div>
    </div>
</div>
</section>
<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="../js/userview.js"></script>