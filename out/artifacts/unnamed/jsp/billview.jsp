<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <table class="layui-table">
                    <tbody>
                    <tr>
                        <th><strong>订单编号：</strong></th>
                        <th><span>${bill.billCode }</span></th>
                    </tr>
                    <tr>
                        <th><strong>商品名称：</strong></th>
                        <th><span>${bill.productName }</span></th>
                    </tr>
                    <tr>
                        <td><strong>商品单位：</strong></td>
                        <td><span>${bill.productUnit }</span></td>
                    </tr>
                    <tr>
                        <td><strong>商品数量：</strong></td>
                        <td><span>${bill.productCount }</span></td>
                    </tr>
                    <tr>
                        <th><strong>总金额：</strong></th>
                        <th><span>${bill.totalPrice }</span></th>
                    </tr>
                    <tr>
                        <th><strong>供应商：</strong></th>
                        <th><span>${bill.providerName }</span></th>
                    </tr>
                    <tr>
                        <th><strong>是否付款：</strong></th>
                        <th><span><c:if test="${bill.isPayment == 1}">未付款</c:if>
				<c:if test="${bill.isPayment == 2}">已付款</c:if></span></th>
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
<script type="text/javascript" src="../js/billview.js"></script>