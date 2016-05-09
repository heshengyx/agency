<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<%@ taglib uri="/WEB-INF/tld/image-tag.tld" prefix="ImageTag" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>${detail.buildingName}-爱房网</title>
	<link href="${ctx}/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="${ctx}/css/carousel.css" rel="stylesheet">
	<link href="${ctx}/css/tabbable.css" rel="stylesheet">
	<style>
	.head-title {margin-top: 20px;}
	.table-unbordered>tbody>tr>td {border: 0;}
	
	.td-title {width: 55px;}
	.td-content {margin-left: -10px;}
	.text-icon {
    margin-top: 10px;
    margin-left: -10px;
    margin-right: -15px;
  }
  .tab-box {padding: 15px 15px 15px 0;}
  .bg-badge {background-color: #337ab7;}

  #mapLocation {
    width: 100%;
    height: 500px;
    overflow: hidden;
    margin: 0;
  }
  .nav-tabs>li>a {
	  border-bottom: 0;
	}
	.tabbable-content {
	  border-right: 1px solid #ddd;
	  height: 800px;
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
				        <li><a href="#"><img class="img-responsive" src="${imageUrl}/${image.url}"></a><div class="label-tip">${image.title}</div></li>
				        </c:forEach>
				        <c:forEach var="image" items="${houseImages}">
                <li><a href="#"><img class="img-responsive" src="${imageUrl}/${image.url}"></a><div class="label-tip">${image.title}</div></li>
                </c:forEach>
                <c:forEach var="image" items="${buildingImages}">
                <li><a href="#"><img class="img-responsive" src="${imageUrl}/${image.url}"></a><div class="label-tip">${image.title}</div></li>
                </c:forEach>
				      </ul>
				    </div>
				    <div class="small-box">
				      <span class="btn left-btn"></span>
				      <div class="small-list">
				        <ul>
				          <c:forEach var="image" items="${images}" varStatus="status">
                  <li<c:if test="${status.first}"> class="on"</c:if>><a href="#"><ImageTag:image src="${image.url}" width="110" height="73" path="${uploadFolder}" base="${imageUrl}/"/></a><div class="active-bg"></div></li>
                  </c:forEach>
                  <c:forEach var="image" items="${houseImages}">
                  <li><a href="#"><ImageTag:image src="${image.url}" width="110" height="73" path="${uploadFolder}" base="${imageUrl}/"/></a><div class="active-bg"></div></li>
                  </c:forEach>
                  <c:forEach var="image" items="${buildingImages}">
                  <li><a href="#"><ImageTag:image src="${image.url}" width="110" height="73" path="${uploadFolder}" base="${imageUrl}/"/></a><div class="active-bg"></div></li>
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
      <c:forEach var="image" items="${houseImages}">
      <c:set var="imagesNum" value="${imagesNum + 1}" />
      </c:forEach>
      <c:forEach var="image" items="${buildingImages}">
      <c:set var="imagesNum" value="${imagesNum + 1}" />
      </c:forEach>
      
      <div class="tabbable tabs-right">
        <ul class="nav nav-tabs" id="myTab3">
          <li class="active"><a data-toggle="tab" href="#home3">房源描述</a></li>
          <li><a data-toggle="tab" href="#profile3">房源图片<span class="badge bg-badge">${imagesNum}</span></a></li>
          <li><a data-toggle="tab" href="#dropdown13"></a></li>
        </ul>

        <div class="tab-content tabbable-content">
          <div id="home3" class="tab-pane in active">
            <h3 class="page-header">房源描述</h3>
            <p>${detail.content}</p>
          </div>

          <div id="profile3" class="tab-pane">
            <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
            <p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
          </div>

          <div id="dropdown13" class="tab-pane">
            <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade.</p>
            <p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
          </div>
        </div>
      </div>

      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#content" data-toggle="tab" role="tab" aria-controls="content">房源描述</a></li>
        <li role="presentation"><a href="#images" data-toggle="tab" role="tab" aria-controls="images">房源图片<span class="badge bg-badge">${imagesNum}</span></a></li>
        <li role="presentation"><a href="#location" data-toggle="tab" role="tab" aria-controls="location">地图位置</a></li>
        <li role="presentation"><a href="#settings" data-toggle="tab" role="tab" aria-controls="settings">小区简介</a></li>
      </ul>
      
      <!-- Tab panes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active tab-box" id="content">
          <p>${detail.content}</p>       
        </div>
        <div role="tabpanel" class="tab-pane tab-box" id="images">
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
        </div>
        <div role="tabpanel" class="tab-pane tab-box" id="location">
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
