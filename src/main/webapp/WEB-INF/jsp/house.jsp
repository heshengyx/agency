<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>爱房网-首页</title>
	<link href="${ctx}/css/jquery.dataTables.min.css" rel="stylesheet">
</head>

<body>
	<div class="blog-header">
    <h1 class="blog-title">The Bootstrap Blog</h1>
    <p class="lead blog-description">The official example template of creating a blog with Bootstrap.</p>
  </div>

  <div class="row">
    <div class="col-sm-8 blog-main">
    
      <div class="blog-post">
        <h2 class="blog-post-title">Sample blog post</h2>
        <p class="blog-post-meta">January 1, 2014 by <a href="#">Mark</a></p>       
      </div><!-- /.blog-post -->

      <table class="table" id="tableDatas">
        <thead>
          <tr>
            <th>图片</th>
            <th>楼盘</th>
            <th>年利率</th>
            <th>金额</th>
            <th>期限</th>
            <th>进度</th>
            <th></th>
          </tr>
        </thead>
      </table>
      
      <nav>
        <ul class="pager">
          <li><a href="#">Previous</a></li>
          <li><a href="#">Next</a></li>
        </ul>
      </nav>

    </div><!-- /.blog-main -->

    <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
      <div class="sidebar-module sidebar-module-inset">
        <h4>About</h4>
        <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
      </div>
      <div class="sidebar-module">
        <h4>Archives</h4>
        <ol class="list-unstyled">
          <li><a href="#">March 2014</a></li>
          <li><a href="#">February 2014</a></li>
          <li><a href="#">January 2014</a></li>
          <li><a href="#">December 2013</a></li>
          <li><a href="#">November 2013</a></li>
          <li><a href="#">October 2013</a></li>
          <li><a href="#">September 2013</a></li>
          <li><a href="#">August 2013</a></li>
          <li><a href="#">July 2013</a></li>
          <li><a href="#">June 2013</a></li>
          <li><a href="#">May 2013</a></li>
          <li><a href="#">April 2013</a></li>
        </ol>
      </div>
      <div class="sidebar-module">
        <h4>Elsewhere</h4>
        <ol class="list-unstyled">
          <li><a href="#">GitHub</a></li>
          <li><a href="#">Twitter</a></li>
          <li><a href="#">Facebook</a></li>
        </ol>
      </div>
    </div><!-- /.blog-sidebar -->

  </div><!-- /.row -->
  <jscript>
  <script src="${ctx}/js/format.js"></script>
  <script src="${ctx}/js/jquery.dataTables.min.js"></script>
  <script>
  $(document).ready(function() {
	  $('#tableDatas').DataTable({
		  "paging":    false,
		  "ordering":  false,
		  "searching": false,
		  "info":      false,
		  "language": {
			  "processing":  "处理中...",
			  "lengthMenu":  "每页 _MENU_ 条记录",
			  "zeroRecords": "没有找到记录",
			  "infoEmpty":   "无记录",
			  "paginate": {
				  "first":     "首页",
	        "previous":  "上页 ",
	        "next":      "下页 ",
	        "last":      "末页 "
			  }
		  },
		  "filter":     false,
		  "processing": true,
		  "ajax": {
			  "url": "${ctx}/trade/queryData?page=1&rows=30",
		    "type": "POST"
		  },
		  "columns": [
        { "data": null },
        { "data": "buildingName" },
        { "data": null },
        { "data": null },
        { "data": null },
        { "data": null },
        { "data": null }
      ]
	  });
  });
  </script>
  </jscript>
</body>
</html>
