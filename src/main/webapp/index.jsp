<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'index.jsp' starting page</title>
	
  </head>
  
  <body>
    <br>
    <a href="${base }/toSimpleUser">跳转到simpleUser界面</a>
    <a href="${base }/toSuperUser">跳转到superUser界面</a>
  </body>
</html>
