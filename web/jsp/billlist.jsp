<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>

<div class="layui-fluid">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-body ">
					<form method="get" class="layui-form layui-col-space5" action="${pageContext.request.contextPath }/user.do">
						<div class="layui-inline layui-show-xs-block">
							<input name="method" value="query" class="input-text" type="hidden">
							<input name="queryProductName" class="layui-input" placeholder="商品名称" type="text" value="${queryProductName }">
						</div>
						<div class="layui-inline layui-show-xs-block">
							<select name="queryProviderId">
								<c:if test="${providerList != null }">
								   <option value="0">--请选择供应商--</option>
								   <c:forEach var="provider" items="${providerList}">
										<option <c:if test="${provider.id == queryProviderId }">selected="selected"</c:if>
										value="${provider.id}">${provider.proName}</option>
								   </c:forEach>
								</c:if>
       						</select>
						</div>
						<div class="layui-inline layui-show-xs-block">
							<select name="queryIsPayment">
								<option value="0">--请选择是否付款--</option>
								<option value="1" ${queryIsPayment == 1 ? "selected=\"selected\"":"" }>未付款</option>
								<option value="2" ${queryIsPayment == 2 ? "selected=\"selected\"":"" }>已付款</option>
							</select>
						</div>
						<div class="layui-inline layui-show-xs-block">
							<button type="submit" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
						</div>
						<div class="layui-card-header" id="card-header">
							<button class="layui-btn"><i class="layui-icon"></i><a href="${pageContext.request.contextPath }/jsp/billadd.jsp" >添加订单</a></button>
						</div>
		</form>
       </div>
       <!--账单表格 样式和供应商公用-->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="10%">订单编码</th>
              <th width="20%">商品名称</th>
              <th width="10%">供应商</th>
              <th width="10%">订单金额</th>
              <th width="10%">是否付款</th>
              <th width="10%">创建时间</th>
              <th width="30%">操作</th>
          </tr>
          <c:forEach var="bill" items="${billList }" varStatus="status">
				<tr>
					<td>
					<span>${bill.billCode }</span>
					</td>
					<td>
					<span>${bill.productName }</span>
					</td>
					<td>
					<span>${bill.providerName}</span>
					</td>
					<td>
					<span>${bill.totalPrice}</span>
					</td>
					<td>
					<span>
						<c:if test="${bill.isPayment == 1}">未付款</c:if>
						<c:if test="${bill.isPayment == 2}">已付款</c:if>
					</span>
					</td>
					<td>
					<span>
					<fmt:formatDate value="${bill.creationDate}" pattern="yyyy-MM-dd"/>
					</span>
					</td>
					<td>
					<a class="viewBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode }><i class="layui-icon">&#xe63c;</i></a></a>
					<a class="modifyBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode}><i class="layui-icon">&#xe642;</i></a>
					<a class="deleteBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode}><i class="layui-icon">&#xe640;</i></a>
					</td>
				</tr>
			</c:forEach>
      </table>
	<input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
	<c:import url="rollpage.jsp">
		<c:param name="totalCount" value="${totalCount}"/>
		<c:param name="currentPageNo" value="${currentPageNo}"/>
		<c:param name="totalPageCount" value="${totalPageCount}"/>
	</c:import>
  </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>
		</div>
	</div>
</div>

<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="../js/billlist.js"></script>