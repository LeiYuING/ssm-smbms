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
         <form class="layui-form" id="billForm" name="billForm" method="post" action="${pageContext.request.contextPath }/bill.do">
             <!--div的class 为error是验证错误，ok是验证成功-->
             <input type="hidden" name="method" value="add">
<%--             <div class="layui-form-item">--%>
<%--                 <label class="layui-form-label" for="userName">用户名称：</label>--%>
<%--                 <div class="layui-input-inline">--%>
<%--                     <input type="text" name="userName" id="userName" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">--%>
<%--                 </div>--%>
<%--                 <font color="red"></font>--%>
<%--             </div>--%>
             <div class="layui-form-item">
                 <% if(attribute==null){}else{%><%=attribute%><%}%>
                 <label class="layui-form-label" for="billCode">订单编码：</label>
                     <div class="layui-input-inline">
                         <input type="text" name="billCode"  id="billCode" required  lay-verify="required"  autocomplete="off" class="layui-input text" value="">
                     </div>
				 <!-- 放置提示信息 -->
				 <font color="red"></font>
             </div>
             <div class="layui-form-item">
                 <label class="layui-form-label" for="productName">商品名称：</label>
                 <div class="layui-input-inline">
                 <input type="text" name="productName" id="productName" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                 </div>
				 <font color="red"></font>
             </div>
             <div class="layui-form-item">
                 <label class="layui-form-label" for="productUnit">商品单位：</label>
                 <div class="layui-input-inline">
                 <input type="text" name="productUnit" id="productUnit" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                 </div>
				 <font color="red"></font>
             </div>
             <div class="layui-form-item">
                 <label class="layui-form-label" for="productCount">商品数量：</label>
                 <div class="layui-input-inline">
                 <input type="text" name="productCount" id="productCount" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                 </div>
				 <font color="red"></font>
             </div>
             <div class="layui-form-item">
                 <label class="layui-form-label" for="totalPrice">总金额：</label>
                 <div class="layui-input-inline">
                 <input type="text" name="totalPrice" id="totalPrice" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                 </div>
				 <font color="red"></font>
             </div>

             <div class="layui-form-item">
                 <label class="layui-form-label" >是否付款：</label>
                 <input type="radio" name="isPayment" value="1" checked="checked">未付款
				 <input type="radio" name="isPayment" value="2" >已付款
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
<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="../js/billadd.js"></script>