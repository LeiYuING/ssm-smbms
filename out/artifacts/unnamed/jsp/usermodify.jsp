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
            <% if(attribute==null){}else{%><%=attribute%><%}%>
			<input type="hidden" name="method" value="modifyexe">
			<input type="hidden" name="id" value="${user.id }"/>
            <div class="layui-form-item">
                <label class="layui-form-label">用户名称：</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" id="userName" required  lay-verify="required"  autocomplete="off" class="layui-input" value="${user.userName }">
                </div>
					<font color="red"></font>
             </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户性别:</label>
                <div class="layui-input-inline">
                    <select name="gender" id="gender">
						<c:choose>
							<c:when test="${user.gender == 1 }">
								<option value="1" selected="selected">男</option>
					    		<option value="2">女</option>
							</c:when>
							<c:otherwise>
								<option value="1">男</option>
					    		<option value="2" selected="selected">女</option>
							</c:otherwise>
						</c:choose>
					 </select>
                </div>
             </div>
            <div class="layui-form-item">
                <label class="layui-form-label" for="data">出生日期：</label>
                <div class="layui-input-inline">
                    <input type="text" required  lay-verify="required"  autocomplete="off" class="layui-input" id="birthday" name="birthday" value="${user.birthday }"
					readonly="readonly" onclick="WdatePicker();">
                </div>
                    <font color="red"></font>
              </div>

            <div class="layui-form-item">
                <label class="layui-form-label" for="userphone">用户电话：</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" id="phone" required  lay-verify="required"  autocomplete="off" class="layui-input" value="${user.phone }">
                </div>
                    <font color="red"></font>
               </div>
            <div class="layui-form-item">
                <label class="layui-form-label" for="userAddress">用户地址：</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" id="address" required  lay-verify="required"  autocomplete="off" class="layui-input" value="${user.address }">
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
<script type="text/javascript" src="../js/usermodify.js"></script>
