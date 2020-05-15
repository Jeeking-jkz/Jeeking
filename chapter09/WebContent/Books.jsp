<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books</title>
</head>
<body>
	<h1 align="center">欢迎来到图书信息管理页面</h1>
	<table width="400" align="center">
	  <tr valign="bottom">
	    <td>
	    <form action="InsertBook" method="post">
	    <input type="text" name="bookno" placeholder="请输入图书号"/><br/>
	    <input type="text" name="bookname" placeholder="请输入图书名"/><br/>
	    <input type="text" name="author" placeholder="请输入作者"/><br/>
	    <input type="text" name="price" placeholder="请输入价格"/><br/>
	    <input type="text" name="remark" placeholder="请输入备注"/><br/>
	    <input type="submit" value="添加"/>
	    <input type="reset" value="重置"/>
	    </form>
	    </td>
	    <td>
	    <form action="FindBook" method="post">
	    <input type="text" name="bookno" placeholder="请输入图书号"/><br/>
	    <input type="radio" name="choose" value="single"/>单个
	    <input type="radio" name="choose" value="all"/>全部<br/>
	    <input type="submit" value="查询"/>
	    <input type="reset" value="重置"/>
	    </form>
	    </td>
	    <td>
	    <form action="DeleteBook" method="post">
	    <input type="text" name="bookno" placeholder="请输入图书号"/><br/>
	    <input type="submit" value="删除"/>
	    <input type="reset" value="重置"/>
	    </form>
	    </td>
	    <td>
	    <form action="UpdateBook" method="post">
	    <input type="text" name="bookno" placeholder="请输入图书号"/><br/>
	    <input type="text" name="bookname" placeholder="请输入图书名"/><br/>
	    <input type="text" name="author" placeholder="请输入作者"/><br/>
	    <input type="text" name="price" placeholder="请输入价格"/><br/>
	    <input type="text" name="remark" placeholder="请输入备注"/><br/>
	    <input type="submit" value="修改"/>
	    <input type="reset" value="重置"/>
	    </form>
	    </td>
	  </tr>
	</table>
	<c:choose>
		<c:when test="${type=='Insert'}">
			<c:if test="${msg=='ok'}">数据插入成功！<br/></c:if>
			<c:if test="${msg=='no'}">数据插入失败！请检查图书号是否重复、图书号/价格是否为整型数！<br/></c:if>
		</c:when>
		<c:when test="${type=='Find'}">
			<c:if test="${msg=='ok'}">数据查询成功！<br/>
				<c:if test="${!empty orders}">
					<table border="1" align="center" width="600px">
						<thead align="center">
							<tr>
								<th>图书号</th>
								<th>图书名</th>
								<th>作者</th>
								<th>价格</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody align="center">
							<c:forEach items="${orders}" var="order" varStatus="s">
								<tr>
									<td>${order.bookno}</td>
									<td>${order.bookname}</td>
									<td>${order.author}</td>
									<td>${order.price}</td>
									<td>${order.remark}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
				<c:if test="${empty orders}">
					图书信息为空！<br/>
				</c:if>
			</c:if>
			<c:if test="${msg=='no'}">数据查询失败！请检查图书号是否存在、是否为非整型数以及是否选择单选！<br/></c:if>
		</c:when>
		<c:when test="${type=='Delete'}">
			<c:if test="${msg=='ok'}">数据删除成功！<br/></c:if>
			<c:if test="${msg=='no'}">数据删除失败！请检查图书号是否存在、是否为非整型数！<br/></c:if>
		</c:when>
		<c:when test="${type=='Update'}">
			<c:if test="${msg=='ok'}">数据修改成功！<br/></c:if>
			<c:if test="${msg=='no'}">数据修改失败！请检查图书号是否存在、图书号/价格是否为非整型数！<br/></c:if>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
	
</body>
</html>