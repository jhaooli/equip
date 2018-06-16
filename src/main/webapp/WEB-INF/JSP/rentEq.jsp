<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>租借器材</title>
    
	

  </head>
  
  <body>
    <h1>已租借器材</h1>
    
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
<br>
<br>
<br>
 <h1>器材租借</h1>
    
  
<table border='1' >
    <tr>
       
        <td>器材名称</td>
        <td>可借器材数量</td>
        <td>器材租借价钱（单个）</td>
        <td>租借</td>
    </tr>
    <c:forEach items="${es}" var="c" varStatus="st">
        <tr>
            <td>${c.eqName}</td>
            <td>${c.eqAmount}</td>
            <td>${c.price}</td>
            <td><a>租借</a></td>
        </tr>
    </c:forEach>
</table>
  </body>
</html>
