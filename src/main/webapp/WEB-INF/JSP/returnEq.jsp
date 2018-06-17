<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>器材归还</title>
    
	

  </head>
  
  <body>
    <h1>器材归还</h1>
    <br>
    <br>
    <table >
    <tr>
       
        <td>器材名称</td>
        <td>已租器材数量</td>
        <td>器材租借价钱</td>
        <td>归还</td>
    </tr>
    <c:forEach items="${esr}" var="c" varStatus="st">
        <form action="${base}/toSimpleUser/returnEq" method="post">
            <td><input type="text"  name="name" readonly="readonly" value="${c.eqName}"/></td>
            <td><input type="text"  name="amount" readonly="readonly" value="${c.rentAmount}"/></td>
            <td><input type="text"  name="price" readonly="readonly" value="${c.price}"/></td>
            <td><input type="submit" value="归还"></td>
        </form>
    </c:forEach>
</table>
  </body>
</html>
