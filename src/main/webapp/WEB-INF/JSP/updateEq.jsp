<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>更改信息</title>
</head>
<body>
<h3>更改器材信息</h3>
<table  >
    <tr>

        <td>器材名称</td>
        <td>可借器材数量</td>
        <td>单个器材租借价钱</td>
        <td>更改</td>
    </tr>
    <c:forEach items="${es}" var="c" varStatus="st">
        <tr>
            <form action="${base}/toSuperUser/UpdateEq" method="post">
            <td><input type="text" id="name" name="name" value="${c.eqName}"/></td>
            <td><input type="text" id="amount" name="amount" value="${c.eqAmount}"/></td>
            <td><input type="text" id="price" name="price" value="${c.price}"/></td>
            <td><button type="submit">更改 </button></td>
            </form>
        </tr>

    </c:forEach>
    <span id="updateEquip"></span>
</table>
<br>
<br>
<br>
<h3>更改器材租借信息</h3>
<table  >
    <tr>

        <td>器材名称</td>
        <td>器材租借数量</td>
        <td>单个器材租借价钱</td>
        <td>租借人</td>
        <td>租借日期</td>
        <td>归还日期</td>

        <td>更改</td>
    </tr>
    <!-- disabled="disabled"-->
    <c:forEach items="${listRent}" var="c" varStatus="st">
        <tr>
            <form action="${base}/toSuperUser/UpdateRent" method="post">
            <td><input type="text"  name="name" value="${c.eqName}"/></td>
            <td><input type="text"  name="rentAmount" value="${c.rentAmount}"/></td>
            <td><input type="text"  name="price" value="${c.price}"/></td>
            <td><input type="text"  name="usernamed" value="${c.usernamed}"/></td>
            <td><input type="text"  name="startDate" value="${c.startDate}"/></td>
            <td><input type="text"  name="endDate" value="${c.endDate}"/></td>

            <td><button type="submit">更改 </button></td>
            </form>
        </tr>
    </c:forEach>
</table>
<br>
<br>
<br>
<h3>更改器材维护信息</h3>
<table  >
    <tr>

        <td>器材名称</td>
        <td>器材数量</td>
        <td>维护日期</td>
        <td>结束日期</td>
        <td>更改</td>
    </tr>
    <c:forEach items="${listMaintain}" var="c" varStatus="st">
        <tr>
            <form action="${base}/toSuperUser/UpdateMaintain" method="post">
            <td><input type="text"  name="name" value="${c.eqName}"/></td>
            <td><input type="text"  name="amount" value="${c.amount}"/></td>
            <td><input type="text"  name="startDate" readonly="readonly" value="${c.startDate}"/></td>
            <td><input type="text"  name="endDate" readonly="readonly" value="${c.endDate}"/></td>
            <td><button type="submit">更改 </button> </td>
            </form>
        </tr>
    </c:forEach>
</table>
<br>
<br>
<br>
<h3>更改器材损坏信息</h3>
<table  >
    <tr>

        <td>器材名称</td>
        <td>器材数量</td>
        <td>申报人</td>
        <td>申报日期</td>
        <td>备注</td>
        <td>更改</td>
    </tr>
    <c:forEach items="${listDamage}" var="c" varStatus="st">
        <tr>
            <form action="${base}/toSuperUser/UpdateDamage" method="post">
            <td><input type="text"  name="name" value="${c.eqName}"/></td>
            <td><input type="text"  name="amount" value="${c.amount}"/></td>
            <td><input type="text"  name="usernamed" value="${c.usernamed}"/></td>
            <td><input type="text"  name="date" value="${c.date}"/></td>
                <td><textarea rows="10" cols="30" name="remarks">${c.remarks}</textarea></td>
                <td><button type="submit">更改 </button> </td>
            </form>
        </tr>
    </c:forEach>
</table>
<br>
<br>
<br>
<h3>更改器材丢失信息</h3>
<table  >
    <tr>

        <td>器材名称</td>
        <td>器材数量</td>
        <td>申报人</td>
        <td>申报日期</td>
        <td>备注</td>
        <td>更改</td>
    </tr>
    <c:forEach items="${listLost}" var="c" varStatus="st">
        <tr>
            <form action="${base}/toSuperUser/UpdateLost" method="post">
            <td><input type="text"  name="name" value="${c.eqName}"/></td>
            <td><input type="text"  name="name" value="${c.amount}"/></td>
            <td><input type="text"  name="name" value="${c.usernamed}"/></td>
            <td><input type="text"  name="name" value="${c.date}"/></td>
            <td><textarea rows="10" cols="30" name="remarks">${c.remarks}</textarea></td>
            <td><a href="">更改</a> </td>
            </form>
        </tr>
    </c:forEach>
</table>

</body>
<script>
    var xmlhttp;
    function onClickCreate(){
        var name = document.getElementById("name").value;
        var url = "http://localhost:8080/equip/toSuperUser/updateEq?name="+name;

        xmlhttp =new XMLHttpRequest();
        xmlhttp.onreadystatechange=checkResult; //响应函数
        xmlhttp.open("GET",url,true);   //设置访问的页面
        xmlhttp.send(null);  //执行访问
    }

    function checkResult(){
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
            document.getElementById('updateEquip').innerHTML=xmlhttp.responseText;

    }

</script>
</html>
