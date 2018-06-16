<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>


  </head>
  
  <body>
    <br><a href="${base }/toSimpleUser/toExaminationEq">查询器材</a><br>
    <br><a href="${base }/toSimpleUser/toRentEq">租借器材</a><br>
    <br><a href="${base }/toSimpleUser/toReturnEq">归还器材</a><br>
  </body>
</html>
