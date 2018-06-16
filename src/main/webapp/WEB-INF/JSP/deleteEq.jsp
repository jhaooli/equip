<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>移除器材</title>
</head>
<body>
<h3>移除器材</h3>
<table  >
    <tr>

        <td>器材名称</td>
        <td>可借器材数量</td>
        <td>单个器材租借价钱</td>
        <td>移除</td>
    </tr>
    <c:forEach items="${es}" var="c" varStatus="st">
        <tr>
            <td>${c.eqName}</td>
            <td>${c.eqAmount}</td>
            <td>${c.price}</td>
            <td><a href="${base}/toSuperUser/DeleteEq?oid=${c.oid}">移除</a></td>
        </tr>
    </c:forEach>
</table>
<br>
<br>
<br>


</body>
</html>
