<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
           <form id="providerForm" class="layui-form" name="providerForm" method="post" action="${pageContext.request.contextPath }/provider.do">
			<input type="hidden" name="method" value="add">
                <!--div的class 为error是验证错误，ok是验证成功-->
<%--               <div class="layui-form-item">--%>
<%--                   <label class="layui-form-label" for="userName">用户名称：</label>--%>
<%--                   <div class="layui-input-inline">--%>
<%--                       <input type="text" name="userName" id="userName" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">--%>
<%--                   </div>--%>
<%--                   <font color="red"></font>--%>
<%--               </div>--%>
               <div class="layui-form-item">
                    <label class="layui-form-label" for="proCode">供应商编码：</label>
                   <div class="layui-input-inline">
                    <input type="text" name="proCode" id="proCode" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                   </div>
					<!-- 放置提示信息 -->
					<font color="red"></font>
                </div>
               <div class="layui-form-item">
                    <label class="layui-form-label" for="proName">供应商名称：</label>
                   <div class="layui-input-inline">
                   <input type="text" name="proName" id="proName" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                   </div>
					<font color="red"></font>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" for="proContact">联系人：</label>
                    <div class="layui-input-inline">
                    <input type="text" name="proContact" id="proContact" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                    </div>
					<font color="red"></font>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" for="proPhone">联系电话：</label>
                    <div class="layui-input-inline">
                    <input type="text" name="proPhone" id="proPhone"  required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                    </div>
					<font color="red"></font>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" for="proAddress">联系地址：</label>
                    <div class="layui-input-inline">
                    <input type="text" name="proAddress" id="proAddress" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                    </div>
                </div>
               <div class="layui-form-item">
                   <label class="layui-form-label" for="proFax">传真：</label>
                   <div class="layui-input-inline">
                    <input type="text" name="proFax" id="proFax" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
                   </div>
                </div>
               <div class="layui-form-item">
                    <label class="layui-form-label" for="proDesc">描述：</label>
                   <div class="layui-input-inline">
                    <input type="text" name="proDesc" id="proDesc" required  lay-verify="required"  autocomplete="off" class="layui-input" value="">
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
<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="../js/provideradd.js"></script>
