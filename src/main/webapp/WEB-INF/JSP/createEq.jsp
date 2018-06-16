<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>新增管理</title>
</head>
<body>
    <h3>添加新器材</h3>
    <form action="${base}/toSuperUser/CreateEq" method="post">
        <table>
            <tr>
                <td>器材名称</td>
                <td><input type="text"  name="eqName"></td>
            </tr>
            <tr>
                <td>数量</td>
                <td><input type="text"  name="eqAmount"></td>
            </tr>
            <tr>
                <td>价格</td>
                <td><input type="text"  name="price"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="添加"></td>
            </tr>
        </table>
    </form>
    <br>
    <br>
    <h3>添加器材损坏信息</h3>
    <form action="${base}/toSuperUser/CreateDamageEq" method="post">
        <table>
            <tr>
                <td>器材名称</td>
                <td><input type="text"  name="eqName"></td>
            </tr>
            <tr>
                <td>数量</td>
                <td><input type="text"  name="amount"></td>
            </tr>
            <tr>
                <td>备注</td>
                <td><textarea rows="10" cols="30" name="remarks"></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="添加"></td>
            </tr>
        </table>
    </form>

    <br>
    <br>
    <h3>添加器材维护信息</h3>
    <form action="${base}/toSuperUser/CreateLostEq" method="post">
        <table>
            <tr>
                <td>器材名称</td>
                <td><input type="text"  name="eqName"></td>
            </tr>
            <tr>
                <td>数量</td>
                <td><input type="text"  name="amount"></td>
            </tr>
            <tr>
                <td>备注</td>
                <td><textarea rows="10" cols="30" name="remarks"></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="添加"></td>
            </tr>
        </table>
    </form>

    <br>
    <br>
    <h3>添加器材丢失信息</h3>
    <form action="${base}/toSuperUser/CreateLostEq" method="post">
        <table>
            <tr>
                <td>器材名称</td>
                <td><input type="text"  name="eqName"></td>
            </tr>
            <tr>
                <td>数量</td>
                <td><input type="text"  name="amount"></td>
            </tr>
            <tr>
                <td>备注</td>
                <td><textarea rows="10" cols="30" name="remarks"></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="添加"></td>
            </tr>
        </table>
    </form>
</body>
</html>
