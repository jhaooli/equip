<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>器材查询</title>
    
	

  </head>
  
  <body>
    <h1>器材查询</h1>
    
  
<table  >
    <tr>
       
        <td>器材名称</td>
        <td>可借器材数量</td>
        <td>器材租借价钱（单个）</td>
        <td>租借</td>
    </tr>
    <c:forEach items="${es}" var="c" varStatus="st">
        <tr>

            <form action="${base}/toSimpleUser/rent" method="post">
            <td><input type="text"  name="name" value="${c.eqName}"/></td>
            <td><input type="text"  name="amount" value="${c.eqAmount}"/></td>
            <td><input type="text"  name="price" readonly="readonly" value="${c.price}"/></td>
            <td><input type="submit" value="租借"></td>
            </form>
        </tr>
    </c:forEach>
</table>
  </body>
</html>
