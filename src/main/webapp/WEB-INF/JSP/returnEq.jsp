<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
      <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
            integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
      <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
              integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
      <title>器材归还</title>
  </head>
  <body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="${base}/toSimpleUser">Home</a></li>
                        <li><a onclick="alert('jhaooli@163.com')">About</a></li>
                        <li><a onclick="alert('jhaooli@163.com')">Contact</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="${base}/toSimpleUser/toExaminationEq">查询器材</a></li>
                                <li><a href="${base}/toSimpleUser/toRentEq">租借器材</a></li>
                                <li><a href="${base}/toSimpleUser/toReturnEq">归还器材</a></li>

                            </ul>
                        </li>
                    </ul>
                </div><!--/.nav-collapse -->
                <div class="jumbotron">
                    <h1>
                        Hello!
                    </h1>
                    <p>
                        Welcome to the equipment return page. Here, you can return the equipment you had.
                    </p>
                    <p>
                        <a class="btn btn-primary btn-large" onclick="alert('jhaooli@163.com')">Learn more</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <h1>器材归还</h1>
                <table class="table table-striped">
                    <tr>

                        <td>器材名称</td>
                        <td>已租器材数量</td>
                        <td>器材租借价钱</td>
                        <td>归还</td>
                    </tr>
                    <c:forEach items="${esr}" var="c" varStatus="st">
                        <form action="${base}/toSimpleUser/returnEq" method="post">
                            <td><input class="form-control" type="text"  name="name" readonly="readonly" value="${c.eqName}"/></td>
                            <td><input class="form-control" type="text"  name="amount" readonly="readonly" value="${c.rentAmount}"/></td>
                            <td><input class="form-control" type="text"  name="price" readonly="readonly" value="${c.price}"/></td>
                            <td><input class="btn btn-default" type="submit" value="归还"></td>
                        </form>
                    </c:forEach>
                </table>



            </div>

        </div>
    </div>




  </body>
</html>
