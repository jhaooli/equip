<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <title>移除器材</title>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="${base}/toSuperUser">Home</a></li>
                    <li><a onclick="alert('jhaooli@163.com')">About</a></li>
                    <li><a onclick="alert('jhaooli@163.com')">Contact</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${base}/toSuperUser/toCreateEq">添加器材有关信息</a></li>
                            <li><a href="${base}/toSuperUser/toDeleteEq">删除器材</a></li>
                            <li><a href="${base}/toSuperUser/toUpdateEq">更改器材信息</a></li>
                            <li><a href="${base}/toSuperUser/toExaminationEq">查询器材有关信息</a></li>

                        </ul>
                    </li>
                </ul>
            </div><!--/.nav-collapse -->
            <div class="jumbotron">
                <h1>
                    Hello!
                </h1>
                <p>
                    Welcome to the equipment delete page. Here, you can delete the equipment you want.
                    欢迎来到删除器材信息页面。在这里，你可以删除有关器材的信息。
                </p>
                <p>
                    <a class="btn btn-primary btn-large" onclick="alert('jhaooli@163.com')">Learn more</a>
                </p>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>移除器材</h3>
            <table class="table table-striped" >
                <tr>

                    <td>器材名称</td>
                    <td>可借器材数量</td>
                    <td>单个器材租借价钱</td>
                    <td>移除</td>
                </tr>
                <c:forEach items="${es}" var="c" varStatus="st">
                    <tr>
                        <td><input class="form-control" type="text"  name="name" readonly="readonly" value="${c.eqName}"/></td>
                        <td><input class="form-control" type="text"  name="name" readonly="readonly" value="${c.eqAmount}"/></td>
                        <td><input class="form-control" type="text"  name="name" readonly="readonly" value="${c.price}"/></td>
                        <td><a href="${base}/toSuperUser/DeleteEq?oid=${c.oid}">移除</a></td>
                    </tr>
                </c:forEach>
            </table>



        </div>

    </div>
</div>


</body>
</html>
