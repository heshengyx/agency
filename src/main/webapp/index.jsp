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
	</div>

	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/carousel.min.js"></script>
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
 </script>
</body>
</html>
