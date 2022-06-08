<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>

<div class="layui-fluid">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-body ">
        	<form method="get" class="layui-form layui-col-space5" action="${pageContext.request.contextPath }/provider.do">
				<div class="layui-inline layui-show-xs-block">
				<input name="method" value="query" type="hidden">
				<input name="queryProCode" class="layui-input" placeholder="供应商编码" type="text" value="${queryProCode }">
				</div>
				<div class="layui-inline layui-show-xs-block">
				<input class="layui-input" placeholder="供应商名称" name="queryProName" type="text" value="${queryProName }">
				</div>
				<input type="hidden" name="pageIndex" value="1"/>
				<div class="layui-inline layui-show-xs-block">
					<button type="submit" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
				</div>
				<div class="layui-card-header" id="card-header">
					<button class="layui-btn"><i class="layui-icon"></i><a href="${pageContext.request.contextPath}/jsp/provideradd.jsp" >添加供应商</a></button>
				</div>
			</form>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">供应商编码</th>
                <th width="20%">供应商名称</th>
                <th width="10%">联系人</th>
                <th width="10%">联系电话</th>
                <th width="10%">传真</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>
            <c:forEach var="provider" items="${providerList }" varStatus="status">
				<tr>
					<td>
					<span>${provider.proCode }</span>
					</td>
					<td>
					<span>${provider.proName }</span>
					</td>
					<td>
					<span>${provider.proContact}</span>
					</td>
					<td>
					<span>${provider.proPhone}</span>
					</td>
					<td>
					<span>${provider.proFax}</span>
					</td>
					<td>
					<span>
					<fmt:formatDate value="${provider.creationDate}" pattern="yyyy-MM-dd"/>
					</span>
					</td>
					<td>
					<a class="viewProvider" href="javascript:;" proid=${provider.id } proname=${provider.proName }><i class="layui-icon">&#xe63c;</i></a>
					<a class="modifyProvider" href="javascript:;" proid=${provider.id } proname=${provider.proName }><i class="layui-icon">&#xe642;</i></a>
					<a class="deleteProvider" href="javascript:;" proid=${provider.id } proname=${provider.proName }><i class="layui-icon">&#xe640;</i></a>
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
		</div>
	</div>
</div>

</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p>你确定要删除该供应商吗？</p>
           <a href="#" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div>

<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/providerlist.js"></script>
