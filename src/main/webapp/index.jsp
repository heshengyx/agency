<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/css/style.css" rel="stylesheet">
<style type="text/css">
body,div,ul,li{margin:0;padding:0;}
ul{list-style:none;}
img{border:0;}

.banner{margin:200px auto 0;width:530px;overflow:hidden;}
.large_box{position: relative;margin-bottom:10px;width:530px;height:350px;overflow:hidden;}
.large_box img{display:block;}
.small_box{width:530px;height:73px;overflow:hidden;}
.small_list{position:relative;float:left;width:480px;height:73px;overflow:hidden;}
.small_list ul{height:73px;overflow:hidden;}
.small_list ul li{position:relative;float:left;margin-right:10px;width:110px;}
.small_list ul li img{display:block;}
.small_list ul li .bun_bg{display:none;position:absolute;top:0;left:0;width:110px;height:73px;background:#000;filter:alpha(opacity=60);-moz-opacity:0.6;-khtml-opacity:0.6;opacity:0.6;}
.small_list ul li.on .bun_bg{display:block;}
.btn{display:block;width:20px;height:73px;background-color:#777;background-repeat:no-repeat;background-position:center center;cursor:pointer;}
.btn:hover{background-color:#e7000e;}
.left_btn{float:left;margin-right:10px;background-image:url(http://www.jq22.com/demo/jQuerybanner20151216/images/left_btn.png);}
.right_btn{float:right;background-image:url(http://www.jq22.com/demo/jQuerybanner20151216/images/right_btn.png);}

.large_box .caption {position: absolute; font-size: 11px; 
      color: #fafafa; padding: 10px; text-align: right; bottom: 10px; right: 10px;}
.large_box .caption p {padding: 0; margin: 0; line-height: 14px;}
#allmap {width: 800px;height: 500px;overflow: hidden;margin:0;}
</style>
</head>

<body>
	<h2>Hello World!</h2>
	<div class="banner">
		<div class="large_box">
			<ul>
				<li><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/img1.jpg" width="530" height="350"><div class="caption">jCarousel is supported and can be integrated!</div></li>
				<li><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/img2.jpg" width="530" height="350"><div class="caption">jCarousel is with PikaChoose!</div></li>
				<li><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/img3.jpg" width="530" height="350"><div class="caption">jCarousel is supported and with PikaChoose!</div></li>
				<!-- <li><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/img4.jpg" width="530" height="350">
				</li>
				<li><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/img5.jpg" width="530" height="350">
				</li>
				<li><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/img6.jpg" width="530" height="350">
				</li> -->
			</ul>
		</div>
		<div class="small_box">
			<span class="btn left_btn"></span>
			<div class="small_list">
				<ul>
					<li class="on"><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/thum1.jpg" width="110"
						height="73">
						<div class="bun_bg"></div></li>
					<li><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/thum2.jpg" width="110" height="73">
						<div class="bun_bg"></div></li>
					<li><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/thum3.jpg" width="110" height="73">
						<div class="bun_bg"></div></li>
					<!-- <li><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/thum4.jpg" width="110" height="73">
						<div class="bun_bg"></div></li>
					<li><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/thum5.jpg" width="110" height="73">
						<div class="bun_bg"></div></li>
					<li><img src="http://www.jq22.com/demo/jQuerybanner20151216/images/thum6.jpg" width="110" height="73">
						<div class="bun_bg"></div></li> -->
				</ul>
			</div>
			<span class="btn right_btn"></span>
		</div>
		
		<div>百度地图</div>
	  <table>
	    <tr>
	      <td><input type="button" value="中心" onclick="showCenter();" /></td>
	      <td><input type="button" value="范围" onclick="showCircle();" /></td>
	      <td><input type="button" value="路径" onclick="showWay();" /></td>
	    </tr>
	  </table>
	  <div id="allmap"></div>
	      当前坐标：<input type="text" id="result" value="" />
		</div>

	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/carousel.min.js"></script>
	<script src="http://api.map.baidu.com/api?v=2.0&ak=CrfAyNgjXIv8p9Agk11UaBT2"></script>
	<script type="text/javascript">
     $(function(){
         /* 商品轮播图（带缩略图的轮播效果） */
         $(".banner").thumbnailImg({
             large_elem: ".large_box",
             small_elem: ".small_list",
             left_btn: ".left_btn",
             right_btn: ".right_btn"
         });
         
         
     });
     var map = new BMap.Map("allmap");
     var point = new BMap.Point(114.064349, 22.53145);
     map.centerAndZoom(point, 16);  //初始化时，即可设置中心点和地图缩放级别。
     map.addControl(new BMap.MapTypeControl());
     map.enableScrollWheelZoom(true);                           //启用滚轮放大缩小
  // 百度地图API功能
     /* var map = new BMap.Map("allmap");    // 创建Map实例
     map.centerAndZoom(new BMap.Point(114.064349, 22.53145), 16);  // 初始化地图,设置中心点坐标和地图级别
     map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
     map.setCurrentCity("深圳");          // 设置地图显示的城市 此项是必须设置的
     map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放 */
      
     //var marker1 = new BMap.Marker(new BMap.Point(114.04915, 22.526543));  // 创建标注
     //map.addOverlay(marker1);              // 将标注添加到地图中
     //var marker2 = new BMap.Marker(new BMap.Point(114.053534, 22.524156));  // 创建标注
     //map.addOverlay(marker2);              // 将标注添加到地图中
     //var circle = new BMap.Circle(point,500);
     //map.addOverlay(circle); //
     //var pointA = new BMap.Point(106.486654,29.490295);  // 创建点坐标A--大渡口区
     //var pointB = new BMap.Point(106.581515,29.615467);  // 创建点坐标B--江北区
     //alert('从大渡口区到江北区的距离是：'+map.getDistance(pointA,pointB)+' 米。');     //获取两点距离
      
     //var polyline = new BMap.Polyline([pointA,pointB], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
     //map.addOverlay(polyline);   //添加折线到地图上
      
     map.addEventListener("click", function(e){
       document.getElementById("result").value = e.point.lng + ", " + e.point.lat;
     });
     function showCenter() {
    	  var marker = new BMap.Marker(point);  // 创建标注
    	  map.addOverlay(marker); 
    	}
    	 
    	var limit = 500;
    	function showCircle() {
    	  var circle = new BMap.Circle(point, limit);
    	  map.addOverlay(circle); //
    	}
    	 
    	var points = new Array(8);
    	function showWay() {
    	  window.setTimeout(showOverlayB, 2000); //2秒
    	  window.setTimeout(showOverlayC, 4000); //2秒
    	  window.setTimeout(showOverlayD, 6000); //2秒
    	  window.setTimeout(showOverlayE, 8000); //2秒
    	  window.setTimeout(showOverlayF, 10000); //2秒
    	  window.setTimeout(showOverlayG, 12000); //2秒
    	  window.setTimeout(showOverlayH, 14000); //2秒
    	}
    	function alertDistince(point1, point2, limit) {
    	  var distance = map.getDistance(point1, point2);
    	  if (distance > limit) {
    	    alert('你现在的活动已超出规定范围：'+distance+' 米。');     //获取两点距离
    	  }
    	}
    	function showOverlayB() {
    	  //114.05012, 22.52701
    	  points[0] = point;
    	  points[1] = new BMap.Point(114.05012, 22.52701);  // 创建点坐标B
    	  var marker = new BMap.Marker(points[1]);  // 创建标注
    	  map.addOverlay(marker);
    	  var polyline = new BMap.Polyline([points[0], points[1]], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
    	  map.addOverlay(polyline);   //添加折线到地图上
    	  alertDistince(points[0], points[1], limit);
    	}
    	 
    	function showOverlayC() {
    	  //114.050623, 22.527378
    	  points[2] = new BMap.Point(114.050623, 22.527378);  // 创建点坐标C
    	  var marker = new BMap.Marker(points[2]);  // 创建标注
    	  map.addOverlay(marker);
    	  var polyline = new BMap.Polyline([points[1], points[2]], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
    	  map.addOverlay(polyline);   //添加折线到地图上
    	  alertDistince(points[0], points[2], limit);
    	}
    	 
    	function showOverlayD() {
    	  //114.051198, 22.527077
    	  points[3] = new BMap.Point(114.051198, 22.527077);  // 创建点坐标D
    	  var marker = new BMap.Marker(points[3]);  // 创建标注
    	  map.addOverlay(marker);
    	  var polyline = new BMap.Polyline([points[2], points[3]], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
    	  map.addOverlay(polyline);   //添加折线到地图上
    	  alertDistince(points[0], points[3], limit);
    	}
    	 
    	function showOverlayE() {
    	  //114.051881, 22.526887
    	  points[4] = new BMap.Point(114.051881, 22.526887);  // 创建点坐标
    	  var marker = new BMap.Marker(points[4]);  // 创建标注
    	  map.addOverlay(marker);
    	  var polyline = new BMap.Polyline([points[3], points[4]], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
    	  map.addOverlay(polyline);   //添加折线到地图上
    	}
    	 
    	function showOverlayF() {
    	  //114.0526, 22.526643
    	  points[5] = new BMap.Point(114.0526, 22.526643);  // 创建点坐标
    	  var marker = new BMap.Marker(points[5]);  // 创建标注
    	  map.addOverlay(marker);
    	  var polyline = new BMap.Polyline([points[4], points[5]], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
    	  map.addOverlay(polyline);   //添加折线到地图上
    	}
    	 
    	function showOverlayG() {
    	  //114.05339, 22.526309
    	  points[6] = new BMap.Point(114.05339, 22.526309);  // 创建点坐标
    	  var marker = new BMap.Marker(points[6]);  // 创建标注
    	  map.addOverlay(marker);
    	  var polyline = new BMap.Polyline([points[5], points[6]], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
    	  map.addOverlay(polyline);   //添加折线到地图上
    	}
    	 
    	function showOverlayH() {
    	  //114.054432, 22.525775
    	  points[7] = new BMap.Point(114.054432, 22.525775);  // 创建点坐标
    	  var marker = new BMap.Marker(points[7]);  // 创建标注
    	  map.addOverlay(marker);
    	  var polyline = new BMap.Polyline([points[6], points[7]], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
    	  map.addOverlay(polyline);   //添加折线到地图上
    	  alertDistince(points[0], points[7], limit);
    	}
 </script>
</body>
</html>
