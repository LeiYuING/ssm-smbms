<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <table class="layui-table">
                    <tr>
                        <th><strong>供应商编码：</strong></th>
                        <th><span>${provider.proCode }</span></th>
                    </tr>
                    <tbody>
                    <tr>
                        <td><strong>供应商名称：</strong></td>
                        <td><span>${provider.proName }</span></td>
                    </tr>
                    <tr>
                        <td><strong>联系人：</strong></td>
                        <td><span>${provider.proContact }</span></td>
                    </tr>
                    <tr>
                        <th><strong>联系电话：</strong></th>
                        <th><span>${provider.proPhone }</span></th>
                    </tr>
                    <tr>
                        <th><strong>传真：</strong></th>
                        <th><span>${provider.proFax }</span></th>
                    </tr>
                    <tr>
                        <th><strong>描述：</strong></th>
                        <th><span>${provider.proDesc}</span></th>
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
<script type="text/javascript" src="../js/providerview.js"></script>
