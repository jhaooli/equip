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
    <table border='1' >
    <tr>
       
        <td>器材名称</td>
        <td>已租器材数量</td>
        <td>器材租借价钱（单个）</td>
        <td>归还</td>
    </tr>
    <c:forEach items="${esr}" var="c" varStatus="st">
        <tr>
            <td>${c.eqName}</td>
            <td>${c.rentAmount}</td>
            <td>${c.price}</td>
            <td><a>归还</a></td>
        </tr>
    </c:forEach>
</table>
  </body>
</html>
