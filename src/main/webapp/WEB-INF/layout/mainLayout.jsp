<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title><sitemesh:write property="title" /></title>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/css/style.css" rel="stylesheet">
    <sitemesh:write property="head" />
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="blog-masthead">
      <div class="container">
        <nav class="blog-nav">
          <a class="blog-nav-item" href="#">首页</a>
          <a class="blog-nav-item" href="${ctx}/house/new">新房</a>
          <a class="blog-nav-item" href="${ctx}/house/used">二手房</a>
          <a class="blog-nav-item" href="#">写字楼</a>
          <a class="blog-nav-item" href="#">商铺</a>
        </nav>
      </div>
    </div>

    <!-- /.container -->
    <div class="container">
      <sitemesh:write property="body" />
    </div>
    <!-- /.container -->

    <footer class="blog-footer">
      <p>Copyright © 1996-2016 IFANG Corporation, All Rights Reserved</p>
      <p>爱房科技　版权所有</p>
    </footer>
    <!-- js -->
    <script src="${ctx}/js/jquery.min.js" ></script>
    <script src="${ctx}/js/bootstrap.min.js"></script>
    <script>
    $(document).ready(function() {
    	var href = window.location.href;
      $(".blog-nav-item").removeClass("active");
      $(".blog-nav-item").each(function() {
        var $this = $(this);
        var $href = $this.attr("href");
        if (href.indexOf($href) != -1) {
          $this.addClass("active");
        }
      });
    });
    </script>
    <sitemesh:write property="jscript" />
    <!-- js -->
  </body>
</html>