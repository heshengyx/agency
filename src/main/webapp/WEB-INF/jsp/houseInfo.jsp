<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>${detail.buildingName}-爱房网</title>
	<link href="${ctx}/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="${ctx}/css/carousel.css" rel="stylesheet">
	<style>
	.head-title {margin-top: 20px;}
	.table-unbordered>tbody>tr>td {border: 0;}
	
	.td-title {width: 55px;}
	.td-content {
    margin-left: -10px;
	}
	.text-icon {
    /* height: 50px; */
    margin-top: 10px;
    margin-left: -10px;
    margin-right: -15px;
    /* padding-left: 10px; */
  }
  .tab-box {padding: 15px 15px 15px 0;}
  .bg-badge {background-color: #337ab7;}
  #mapLocation {
    width: 100%;
    height: 500px;
    overflow: hidden;
    margin: 0;
  }
	</style>
</head>

<body>
  <h3 class="text-primary head-title">${detail.title}</h3>
  <p>
    <span>房源编号：${detail.code}</span>&nbsp;&nbsp;
    <span>房经协房源信息编码：${detail.encode}</span>&nbsp;&nbsp;
    <span>发布时间：<fmt:formatDate value="${detail.releaseTime}" pattern="yyyy-MM-dd" /></span>
  </p>

	<div class="row">
    <div class="col-md-10 content-main">
      <div class="row">
        <div class="col-sm-6 col-md-7">
          
          <div class="banner">
				    <div class="large-box">
				      <ul>
				        <c:forEach var="image" items="${images}">
				        <li><img class="img-responsive" src="${imageUrl}/${image.url}"><div class="label-tip">${image.title}</div></li>
				        </c:forEach>
				        <c:forEach var="image" items="${houseImages}">
                <li><img class="img-responsive" src="${imageUrl}/${image.url}"><div class="label-tip">${image.title}</div></li>
                </c:forEach>
				      </ul>
				    </div>
				    <div class="small-box">
				      <span class="btn left-btn"></span>
				      <div class="small-list">
				        <ul>
				          <c:forEach var="image" items="${images}" varStatus="status">
                  <li<c:if test="${status.first}"> class="on"</c:if>><img src="${imageUrl}/${image.url}" width="110" height="73"><div class="active-bg"></div></li>
                  </c:forEach>
                  <c:forEach var="image" items="${houseImages}">
                  <li><img src="${imageUrl}/${image.url}" width="110" height="73"><div class="active-bg"></div></li>
                  </c:forEach>
				        </ul>
				      </div>
				      <span class="btn right-btn"></span>
				    </div>
				  </div>
        </div>
        <div class="col-sm-6 col-md-5">
          <table class="table table-unbordered">
            <tbody>
              <tr>
                <td class="td-title text-right">价&nbsp;&nbsp;格：</td>
                <td>
                  <h3 class="text-danger td-content"><strong><fmt:formatNumber value="${detail.price/100}" pattern="#,#00.0#"/></strong><small>&nbsp;
                  <small><c:if test="${detail.type == '1'}">万<br>(<fmt:formatNumber value="${(detail.price/detail.area)*100}" pattern="#,#00.0#"/>元/㎡)</c:if></small></small></h3></td>
                <td class="td-title text-right">面&nbsp;&nbsp;积：</td>
                <td><h3 class="text-info td-content"><strong><fmt:formatNumber value="${detail.area/100}" pattern="#,#00.0#"/></strong><small><small>㎡</small></small></h3></td>
              </tr>
              <tr>
                <td class="td-title text-right">户&nbsp;&nbsp;型：</td>
                <td><div class="td-content">${detail.room}室${detail.saloon}厅${detail.toilet}卫</div></td>
                <td class="td-title text-right">朝&nbsp;&nbsp;向：</td>
                <td><div class="td-content">${detail.faceName}</div></td>
              </tr>
              <tr>
                <td class="bg-info" colspan="4">
				          <h3 class="text-icon text-center">
				            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
				            <span class="text-muted">
				              <strong>
				              <c:if test="${!empty detail.phone}">${detail.phone}</c:if>
				              <c:if test="${empty detail.phone}"><del>xxx-xxxxxxxx</del></c:if></strong>&nbsp;
				              <c:if test="${!empty detail.username}">${detail.username}</c:if>
				              <c:if test="${empty detail.username}"><del>暂无</del></c:if>
				            </span>
				          </h3>
                </td>
              </tr>
              <tr>
                <td class="td-title text-right">楼&nbsp;&nbsp;层：</td>
                <td><div class="td-content">第${detail.floor}层(共${detail.buildingFloor}层)</div></td>
                <td class="td-title text-right">年&nbsp;&nbsp;代：</td>
                <td><div class="td-content">${detail.buildingYear}</div></td>
              </tr>
              <tr>
                <td class="td-title text-right">装&nbsp;&nbsp;修：</td>
                <td><div class="td-content">${detail.fitmentName}</div></td>
                <td class="td-title text-right">类&nbsp;&nbsp;型：</td>
                <td><div class="td-content">${detail.buildingTypeName}</div></td>
              </tr>
              <tr>
                <td class="td-title text-right">产&nbsp;&nbsp;权：</td>
                <td colspan="3"><div class="td-content">${detail.ownerName}</div></td>
              </tr>
              <tr>
                <td class="td-title text-right">楼&nbsp;&nbsp;盘：</td>
                <td colspan="3"><div class="td-content">${detail.buildingName}（${detail.districtName}&nbsp;${detail.townName}）</div></td>
              </tr>
              <tr>
                <td class="td-title text-right">地&nbsp;&nbsp;址：</td>
                <td colspan="3"><div class="td-content">${detail.buildingAddress}</div></td>
              </tr>
              <tr>
                <td class="td-title text-right">学&nbsp;&nbsp;校：</td>
                <td colspan="3"><div class="td-content">螺岭小学</div></td>
              </tr>
              <tr>
                <td class="td-title text-right">配&nbsp;&nbsp;套：</td>
                <td colspan="3"><div class="td-content">花园/小院,阁楼,露台,车位/车库,电梯,宽带,煤气/天然气,水...<span class="caret"></span></div></td>
              </tr>
              <tr>
                <td colspan="4">
                  <a class="btn btn-info btn-xs" href="#" role="button">地铁房</a>
                  <a class="btn btn-success btn-xs" href="#" role="button">学位房</a>
                  <a class="btn btn-primary btn-xs" href="#" role="button">距1号线大新站约343米</a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      
      <c:set var="imagesNum" value="0" />
      <c:forEach var="image" items="${images}">
      <c:set var="imagesNum" value="${imagesNum + 1}" />
      </c:forEach>

      <nav id="navbar-example" class="navbar" role="navigation">
      <ul class="nav nav-tabs">
         <li><a href="#ios">iOS</a></li>
         <li><a href="#svn">SVN</a></li>
         <li class="dropdown">
            <a href="#" id="navbarDrop1" class="dropdown-toggle" 
               data-toggle="dropdown">Java
               <b class="caret"></b>
            </a>
            <ul class="dropdown-menu" role="menu" 
               aria-labelledby="navbarDrop1">
               <li><a href="#jmeter" tabindex="-1">jmeter</a></li>
               <li><a href="#ejb" tabindex="-1">ejb</a></li>
               <li class="divider"></li>
               <li><a href="#spring" tabindex="-1">spring</a></li>
            </ul>
         </li>
      </ul>
</nav>
<div data-spy="scroll" data-target="#navbar-example" data-offset="0" 
   style="height:200px;overflow:auto; position: relative;">
   <h4 id="ios">iOS</h4>
   <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple 
      TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。
   </p>
   <h4 id="svn">SVN</h4>
   <p>Apache Subversion，通常缩写为 SVN，是一款开源的版本控制系统软件。Subversion 由 CollabNet 公司在 2000 年创建。但是现在它已经发展为 Apache Software Foundation 的一个项目，因此拥有丰富的开发人员和用户社区。
   </p>
   <h4 id="jmeter">jMeter</h4>
   <p>jMeter 是一款开源的测试软件。它是 100% 纯 Java 应用程序，用于负载和性能测试。
   </p>
   <h4 id="ejb">EJB</h4>
   <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
   </p>
   <h4 id="spring">Spring</h4>
   <p>Spring 框架是一个开源的 Java 平台，为快速开发功能强大的 Java 应用程序提供了完备的基础设施支持。
   </p>
   <p>Spring 框架最初是由 Rod Johnson 编写的，在 2003 年 6 月首次发布于 Apache 2.0 许可证下。
   </p>
</div>
      <div class="bs-docs-sidebar1">  
			    <ul class="nav bs-docs-sidebar">  
			        <li><a href="#one">hello Bootstrp 3</a></li>  
			        <li><a href="#two">hello jQuery</a></li>  
			        <li><a href="#three">hello ScrollSpy</a></li>  
			    </ul>  
			</div> 
			<div>  
			    <h2 id="one" class="tile">This is one.</h2>  
			    <p>${detail.content}</p>
			    <p>${detail.content}</p>  
			    <h2 id="two" class="tile">This is two.</h2>  
			    <p>......</p>
			    <p>${detail.content}</p>
			    <p>${detail.content}</p>
			    <p>${detail.content}</p>  
			    <h2 id="three" class="tile">This is three.</h2>  
			    <p>......</p>  
			</div>
      
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation"><a href="#desc" aria-controls="desc">房源描述</a></li>
        <li role="presentation"><a href="#images" aria-controls="images">房源图片<span class="badge bg-badge">${imagesNum}</span></a></li>
        <li role="presentation"><a href="#location" aria-controls="location">地图位置</a></li>
        <li role="presentation"><a href="#settings" aria-controls="settings">小区简介</a></li>
      </ul>
      
      <!-- Tab panes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active tab-box">
          <p>${detail.content}</p>
          <h5 id="images" class="page-header">房源图片<span class="badge bg-badge">${imagesNum}</span></h5>
          <c:forEach var="image" items="${images}">
          <img class="img-responsive" src="${imageUrl}/${image.url}">
          <p>${image.title}</p>
          </c:forEach>
          <c:forEach var="image" items="${houseImages}">
          <img class="img-responsive" src="${imageUrl}/${image.url}">
          <P>${image.title}</P>
          </c:forEach>
          <c:forEach var="image" items="${buildingImages}">
          <img class="img-responsive" src="${imageUrl}/${image.url}">
          </c:forEach>
          <h5 id="location" class="page-header">地图位置</h5>
          <div id="mapLocation"></div>
        </div>
      </div><!-- Tab panes -->
    </div><!-- /.blog-main -->

    <div class="col-sm-12 col-md-2 hidden-sm hidden-xs">
      <div class="thumbnail">
	      <img class="img-circle" src="${imageUrl}/${profileBlank}" width="120" alt="...">
	      <div class="caption">
	        <h4 class="text-center">
	        <c:if test="${!empty detail.username}">${detail.username}</c:if>
	        <c:if test="${empty detail.username}"><del>暂无</del></c:if>
	        </h4>
	        <p><ins>您的满意是我最开心的事</ins></p>
	        <p class="text-center">
            <a href="#" class="btn btn-primary btn-xs" role="button">关注</a>
            <a href="#" class="btn btn-info btn-xs" role="button">点赞</a></p>
	      </div>
	    </div>
    </div><!-- /.blog-sidebar -->
  </div><!-- /.row -->
  <jscript>
  <script src="${ctx}/js/format.js"></script>
  <script src="${ctx}/js/jquery.dataTables.min.js"></script>
  <script src="${ctx}/js/carousel.min.js"></script>
  <script src="http://api.map.baidu.com/api?v=2.0&ak=CrfAyNgjXIv8p9Agk11UaBT2"></script>
  <script>
  $(document).ready(function() {
	  $('.tile').on('scrollSpy:enter', function() {
	    console.log('enter:', $(this).attr('id'));
	  });

	  $('.tile').on('scrollSpy:exit', function() {
	    console.log('exit:', $(this).attr('id'));
	  });
	  //$('#navbar-example').scrollspy();
	  $('body').scrollspy({ target: '#navbar-example', offset: 50});
	  $(".banner").thumbnailImg({
		  large_elem: ".large-box",
		  small_elem: ".small-list",
		  left_btn: ".left-btn",
		  right_btn: ".right-btn"
		});
	  $(".label-tip:not(':first')").hide();
	  
	  var map = new BMap.Map("mapLocation");
	  map.centerAndZoom("深圳", 16);
	  map.enableScrollWheelZoom();
	  
	  var point = new BMap.Point(114.082638, 22.530649);
	  //map.centerAndZoom(point, 16);  //初始化时，即可设置中心点和地图缩放级别。
	  //map.panTo(point);
	  
	  
	  var marker = new BMap.Marker(point);  // 创建标注
	  map.addOverlay(marker);
	  
	  /* var bs = map.getBounds();   //获取可视区域
	  var bssw = bs.getSouthWest();   //可视区域左下角
	  var bsne = bs.getNorthEast();   //可视区域右上角
	  alert("当前地图可视范围是：" + bssw.lng + "," + bssw.lat + "到" + bsne.lng + "," + bsne.lat); */
	  //0.0160 0.008
	  //map.panTo(new BMap.Point(114.066433, 22.539061));
    //GeoPpoint gpoint = new GeoPoint((int)(114.064*1e6),(int)(22.531*1e6));
    //map.getController().setCenter(gpoint);
  });
  
  </script>
  </jscript>
</body>
</html>
