<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>器材信息</title>
</head>
<body>
<h3>器材信息</h3>
<table  >
    <tr>

        <td>器材名称</td>
        <td>可借器材数量</td>
        <td>单个器材租借价钱</td>

    </tr>
    <c:forEach items="${es}" var="c" varStatus="st">
        <tr>
            <td>${c.eqName}</td>
            <td>${c.eqAmount}</td>
            <td>${c.price}</td>

        </tr>
    </c:forEach>
</table>
<br>
<br>
<br>
<h3>器材租借信息</h3>
<table  >
    <tr>

        <td>器材名称</td>
        <td>器材租借数量</td>
        <td>单个器材租借价钱</td>
        <td>租借人</td>
        <td>租借日期</td>
        <td>归还日期</td>

    </tr>
    <c:forEach items="${listRent}" var="c" varStatus="st">
        <tr>
            <td>${c.eqName}</td>
            <td>${c.rentAmount}</td>
            <td>${c.price}</td>
            <td>${c.usernamed}</td>
            <td>${c.startDate}</td>
            <td>${c.endDate}</td>
        </tr>
    </c:forEach>
</table>
<br>
<br>
<br>
<h3>器材维护信息</h3>
<table  >
    <tr>

        <td>器材名称</td>
        <td>器材数量</td>
        <td>维护日期</td>
        <td>结束日期</td>

    </tr>
    <c:forEach items="${listMaintain}" var="c" varStatus="st">
        <tr>
            <td>${c.eqName}</td>
            <td>${c.eqAmount}</td>
            <td>${c.startDate}</td>
            <td>${c.endDate}</td>
        </tr>
    </c:forEach>
</table>
<br>
<br>
<br>
<h3>器材损坏信息</h3>
<table  >
    <tr>

        <td>器材名称</td>
        <td>器材数量</td>
        <td>申报人</td>
        <td>申报日期</td>

    </tr>
    <c:forEach items="${listDamage}" var="c" varStatus="st">
        <tr>
            <td>${c.eqName}</td>
            <td>${c.amount}</td>
            <td>${c.usernamed}</td>
            <td>${c.date}</td>

        </tr>
    </c:forEach>
</table>
<br>
<br>
<br>
<h3>器材丢失信息</h3>
<table  >
    <tr>

        <td>器材名称</td>
        <td>器材数量</td>
        <td>申报人</td>
        <td>申报日期</td>

    </tr>
    <c:forEach items="${listLost}" var="c" varStatus="st">
        <tr>
            <td>${c.eqName}</td>
            <td>${c.amount}</td>
            <td>${c.usernamed}</td>
            <td>${c.date}</td>

        </tr>
    </c:forEach>
</table>

</body>
</html>
