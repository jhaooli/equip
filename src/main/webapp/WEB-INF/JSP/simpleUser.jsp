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
    <title>器材模块</title>
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
              Welcome to the equipment query page. Here, you can look up the equipment you need.
            </p>
            <p>
              <a class="btn btn-primary btn-large" onclick="alert('jhaooli@163.com')">Learn more</a>
            </p>
          </div>
        </div>
      </div>
      <div class="row clearfix">
        <div class="col-md-4 column">
          <form action="${base }/toSimpleUser/toExaminationEq">
            <button class="btn btn-default btn-block">
              <h3>查询器材</h3>

            </button>
          </form>

        </div>
        <div class="col-md-4 column">
          <form action="${base }/toSimpleUser/toRentEq">
            <button class="btn btn-default btn-block">
              <h3>租借器材</h3>
            </button>
          </form>

        </div>
        <div class="col-md-4 column">
          <form action="${base }/toSimpleUser/toReturnEq">
            <button class="btn btn-default btn-block">
              <h3>归还器材</h3>

            </button>
          </form>

        </div>
      </div>
    </div>
  </body>
</html>
