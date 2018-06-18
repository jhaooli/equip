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

    <title>更改信息</title>
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
                    Welcome to the equipment query page. Here, you can look up the equipment you need.
                </p>
                <p>
                    <a class="btn btn-primary btn-large" onclick="alert('jhaooli@163.com')">Learn more</a>
                </p>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>更改器材信息</h3>
            <table class="table table-striped" >
                <tr>

                    <td>器材名称</td>
                    <td>可借器材数量</td>
                    <td>单个器材租借价钱</td>
                    <td>更改</td>
                </tr>
                <c:forEach items="${es}" var="c" varStatus="st">
                    <tr>
                        <form action="${base}/toSuperUser/UpdateEq" method="post">
                            <td><input class="form-control" type="text" id="name" name="name" value="${c.eqName}"/></td>
                            <td><input class="form-control" type="text" id="amount" name="amount" value="${c.eqAmount}"/></td>
                            <td><input class="form-control" type="text" id="price" name="price" value="${c.price}"/></td>
                            <td><button class="btn btn-default" type="submit">更改 </button></td>
                        </form>
                    </tr>

                </c:forEach>

            </table>
        </div>

    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>更改器材租借信息</h3>
            <table class="table table-striped" >
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
                            <td><input class="form-control" type="text"  name="name" value="${c.eqName}"/></td>
                            <td><input class="form-control" type="text"  name="rentAmount" value="${c.rentAmount}"/></td>
                            <td><input class="form-control" type="text"  name="price" value="${c.price}"/></td>
                            <td><input class="form-control" type="text"  name="usernamed" value="${c.usernamed}"/></td>
                            <td><input class="form-control" type="text"  readonly="readonly" name="startDate" value="${c.startDate}"/></td>
                            <td><input class="form-control" type="text"  readonly="readonly" name="endDate" value="${c.endDate}"/></td>

                            <td><button class="btn btn-default" type="submit">更改 </button></td>
                        </form>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>更改器材维护信息</h3>
            <table class="table table-striped" >
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
                            <td><input class="form-control" type="text"  name="name" value="${c.eqName}"/></td>
                            <td><input class="form-control" type="text"  name="amount" value="${c.amount}"/></td>
                            <td><input class="form-control" type="text"  name="startDate" readonly="readonly" value="${c.startDate}"/></td>
                            <td><input class="form-control" type="text"  name="endDate" readonly="readonly" value="${c.endDate}"/></td>
                            <td><button class="btn btn-default" type="submit">更改 </button> </td>
                        </form>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>更改器材损坏信息</h3>
            <table class="table table-striped" >
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
                            <td><input class="form-control" type="text"  name="name" value="${c.eqName}"/></td>
                            <td><input class="form-control" type="text"  name="amount" value="${c.amount}"/></td>
                            <td><input class="form-control" type="text"  name="usernamed" value="${c.usernamed}"/></td>
                            <td><input class="form-control" type="text"  name="date" value="${c.date}"/></td>
                            <td><textarea rows="5" cols="25" name="remarks">${c.remarks}</textarea></td>
                            <td><button class="btn btn-default" type="submit">更改 </button> </td>
                        </form>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>更改器材丢失信息</h3>
            <table class="table table-striped" >
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
                            <td><input class="form-control" type="text"  name="name" value="${c.eqName}"/></td>
                            <td><input class="form-control" type="text"  name="name" value="${c.amount}"/></td>
                            <td><input class="form-control" type="text"  name="name" value="${c.usernamed}"/></td>
                            <td><input class="form-control" type="text"  name="name" value="${c.date}"/></td>
                            <td><textarea rows="5" cols="25" name="remarks">${c.remarks}</textarea></td>
                            <td><button class="btn btn-default" type="submit">更改 </button></td>
                        </form>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </div>
</div>


</body>

</html>
