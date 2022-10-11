<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退货信息</title>
<script type="text/javascript">
	$(function(){
		
		$(".deleteConfirm").click(function(){
			if(confirm("确认删除吗？") == false){
				return false;
			}
		});
	});
		
</script>
</head>
<%@ include file="/WEB-INF/include/base.jsp"%>
<body>
	<!-- 需要c_id -->
	<div>
		<table>
			<tr>
				<td>ISBN</td>
				<td>退货时间</td>
				<td>退货原因</td>
				<td>退货申请状态</td>
				<td colspan="2">操作</td>
			</tr>
			<c:forEach items="${requestScope.returnmessage.list}"
				var="returnmessage">
				<tr>
					<td>${returnmessage.r_id }</td>
					<td>${returnmessage.r_time}</td>
					<td>${returnmessage.reason}</td>
					<td>${returnmessage.state}</td>
					<td><a class="deleteConfirm"
						href="ReturnMessageServlet?method=deleteReturnMessage&r_id=${returnmessage.r_id }">删除</a></td>
				</tr>
			</c:forEach>
		</table>
		<!-- 编辑按钮 -->
	</div>
</body>

</html>