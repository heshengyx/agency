<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>${detail.buildingName}-爱房网</title>
	<link href="${ctx}/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="${ctx}/css/jcarousel.connected-carousels.css" rel="stylesheet">
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
  
  .tab-box {
    padding: 15px;
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
          <%-- <img class="img-responsive" src="${ctx}/pictures/FpW5nXd5jnIpe-T0EWmceMlfycdY-1.jpg"> --%>
		      <div class="connected-carousels">
		        <div class="carousel carousel-stage">
		          <ul>
		            <li><img class="img-responsive" src="${ctx}/pictures/600x600_01.jpg" alt=""></li>
		            <li><img class="img-responsive" src="${ctx}/pictures/600x600_02.jpg" alt=""></li>
		            <li><img class="img-responsive" src="${ctx}/pictures/600x600_03.jpg" alt=""></li>
		          </ul>
		        </div>
		        <a href="#" class="prev prev-stage"><span>&lsaquo;</span></a> 
		        <a href="#" class="next next-stage"><span>&rsaquo;</span></a>
		
			      <div class="navigation">
			        <a href="#" class="prev prev-navigation">&lsaquo;</a> 
			        <a href="#"class="next next-navigation">&rsaquo;</a>
			        <div class="carousel carousel-navigation">
			          <ul>
			            <li><img src="${ctx}/thumbs/84x60_01.jpg" width="50" height="50" alt=""></li>
			            <li><img src="${ctx}/thumbs/84x60_02.jpg" width="50" height="50" alt=""></li>
			            <li><img src="${ctx}/thumbs/84x60_03.jpg" width="50" height="50" alt=""></li>
			          </ul>
			        </div>
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
      
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#area" aria-controls="area" role="tab" data-toggle="tab">房源描述</a></li>
        <li role="presentation"><a href="#subway" aria-controls="subway" role="tab" data-toggle="tab">房源图片</a></li>
        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">成交记录</a></li>
        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">小区简介</a></li>
      </ul>
      
      <!-- Tab panes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active tab-box" id="area">
          <p>精装公寓房 首付五成 70年产权 不限名额 带学位 全新家私 还未住人 可拎包入住 自住、出租的好房子。房子在横岗地铁站附近，有横岗中学，六约学校学位，环境优美设施齐全，绿化率高，周围有各种档次酒店饭馆，生活便利，小区物业完善，管理严格，居住安全。门口就是公交站，交通便利，出行方便。房屋朝南，户型方正，居家装修保养完好，可直接入住。高楼层，无遮挡，采光充足，视野开阔。现在房子空置，看房方便。</p>
        </div>
      </div><!-- Tab panes -->
    </div><!-- /.blog-main -->

    <div class="col-sm-12 col-md-2 hidden-sm hidden-xs">
      <div class="thumbnail">
	      <img class="img-circle" src="${ctx}/pictures/120_163517736_11.jpg" alt="...">
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
  <script src="${ctx}/js/jquery.jcarousel.min.js"></script>
  <script src="${ctx}/js/jcarousel.connected-carousels.js"></script>
  <script>
  $(document).ready(function() {
	  
  });
  </script>
  </jscript>
</body>
</html>
