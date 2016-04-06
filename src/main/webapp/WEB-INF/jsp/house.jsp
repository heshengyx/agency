<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>爱房网-首页</title>
	<link href="${ctx}/css/ui-dialog.css" rel="stylesheet">
	<link href="${ctx}/css/jquery.dataTables.min.css" rel="stylesheet">
	<style>
	.table-data {margin-bottom: 0;}
	.table-data tbody tr td {
    padding-top: 20px;
    padding-bottom: 15px;
	}
	.text-title {font-weight: bold;}
	.panel-search {margin-top: 20px;}
	
	.search-title {margin-top: 12px;}
	.search-content {
    border-left: 1px solid #ddd;
    border-right: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
	}
	.search-pane {
    margin-left: 10px;
    margin-right: 10px;
    padding-top: 10px;
	}
	.search-pane hr {
    margin-top: 5px;
    margin-bottom: 10px;
	}
	.search-condition {border-top: 1px solid #ddd;}
	
	.img-icon {margin-bottom: 5px;}
	
	.alert-btn {
    padding: 3px;
    margin-bottom: 0;
	}
	.alert-dismissible .close-btn {right: -2px;}
	</style>
</head>

<body>
  <div class="panel panel-default panel-search">
	  <div class="panel-body">
      <div class="row">
        <div class="col-md-1"><div class="search-title"><strong>位置：</strong></div></div>
        <div class="col-md-11">
          <ul class="nav nav-tabs" role="tablist">
				    <li role="presentation" class="active"><a href="#area" aria-controls="area" role="tab" data-toggle="tab">区域</a></li>
				    <li role="presentation"><a href="#subway" aria-controls="subway" role="tab" data-toggle="tab">地铁</a></li>
				    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">学区</a></li>
				    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">地图</a></li>
				  </ul>

				  <!-- Tab panes -->
				  <div class="tab-content search-content">
				    <div role="tabpanel" class="tab-pane active search-pane" id="area">
				      <ul class="list-inline" id="citys">
							  <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('0', this);">不限</button></li>
							  <c:forEach var="data" items="${regions}">
							  <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', this);">${data.name}</button></li>
							  </c:forEach> 
							</ul>
							<div id="districtsPane">
								<hr>
								<ul class="list-inline" id="districts">
	                <li><button type="button" class="btn btn-danger btn-xs">不限</button></li>
	              </ul>
              </div>
				    </div>
				    <div role="tabpanel" class="tab-pane search-pane" id="subway">
				      <ul class="list-inline">
                <li><button type="button" class="btn btn-danger btn-xs">不限</button></li>
                <li><button type="button" class="btn btn-link btn-xs">1号线</button></li>
                <li><button type="button" class="btn btn-link btn-xs">2号线</button></li>
                <li><button type="button" class="btn btn-link btn-xs">3号线</button></li>
                <li><button type="button" class="btn btn-link btn-xs">4号线</button></li>
              </ul>
				    </div>
				    <div role="tabpanel" class="tab-pane" id="messages">...</div>
				    <div role="tabpanel" class="tab-pane" id="settings">...</div>
				  </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-1"><div class="search-title"><strong>价格：</strong></div></div>
        <div class="col-md-11">
          <div class="search-pane">
	          <ul class="list-inline" id="prices">
	            <li><button type="button" class="btn btn-danger btn-xs" onclick="addActived('prices', '0', this);">不限</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActived('prices', '0', this);">100万以下</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActived('prices', '0', this);">100万-200万</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActived('prices', '0', this);">200万-300万</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActived('prices', '0', this);">300万-400万</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActived('prices', '0', this);">400万-500万</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActived('prices', '0', this);">500万-700万</button></li>
	          </ul>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-1"><div class="search-title"><strong>户型：</strong></div></div>
        <div class="col-md-11">
          <div class="search-pane">
            <ul class="list-inline" id="patterns">
              <li><button type="button" class="btn btn-danger btn-xs" onclick="addActivedName('patterns', '0', '', this);">不限</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '0', '一室', this);">一室</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '0', '二室', this);">二室</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '0', '三室', this);">三室</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '0', '四室', this);">四室</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '0', '五室', this);">五室</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '0', '五室以上', this);">五室以上</button></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-1"><div class="search-title"><strong>面积：</strong></div></div>
        <div class="col-md-11">
          <div class="search-pane">
            <ul class="list-inline" id="areas">
              <li><button type="button" class="btn btn-danger btn-xs" onclick="addActivedName('areas', '0', '', this);">不限</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('areas', '50', '50平米以下', this);">50平米以下</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('areas', '50-70', '50-70平米', this);">50-70平米</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('areas', '70-90', '70-90平米', this);">70-90平米</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('areas', '90-120', '90-120平米', this);">90-120平米</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('areas', '120-150', '120-150平米', this);">120-150平米</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('areas', '150-200', '150-200平米', this);">150-200平米</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('areas', '200-300', '200-300平米', this);">200-300平米</button></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row search-condition" id="conditionsPane">
        <div class="col-md-1"><div class="search-title"><strong>条件：</strong></div></div>
        <div class="col-md-11">
          <div class="search-pane">
            <ul class="list-inline" id="conditions">
              <li>
                <div class="alert alert-warning alert-dismissible fade in alert-btn" role="alert">
                  <button type="button" class="close close-btn" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                  <span>南山</span>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <input id="pricesName" type="hidden">
      <input id="patternsName" type="hidden">
      <input id="areasName" type="hidden">
	  </div>
	</div>

  <div class="row">
    <div class="col-md-9 content-main">
    
      <table class="table table-hover table-striped table-data">
        <thead>
          <tr>
            <td>
              <div class="row">
                <div class="col-sm-8 col-md-6">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="小区名称">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                      </button>
                    </span>
                  </div>
                </div>
                <div class="col-sm-4 col-md-3 col-md-offset-3">
	                <div class="text-right">
	                 <button type="button" class="btn btn-link btn-sm">价格<span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span></button>
	                 <button type="button" class="btn btn-link btn-sm">面积<span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span></button></div>
	              </div>
              </div>
            </td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
            <div class="row">
			        <div class="col-sm-4 col-md-3">
			          <img class="img-icon" src="${ctx}/pictures/FpW5nXd5jnIpe-T0EWmceMlfycdY.jpg">
			        </div>
			        <div class="col-sm-8 col-md-8 col-md-offset-1">
                <h3 class="text-primary text-title">成熟小区 超值产业 配套齐全 适合住家</h3>
                <h4 class="text-warning">106㎡&nbsp;&nbsp;<small>3室2厅&nbsp;&nbsp;|&nbsp;&nbsp;12/19层&nbsp;&nbsp;|&nbsp;&nbsp;南北向&nbsp;&nbsp;|&nbsp;&nbsp;建筑年代：2004</small></h4>
                <h5 class="text-info">金汇名园&nbsp;&nbsp;<small><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>宝安中心区-宝安宝城41区翻身大道与甲岸路之交汇处</small></h5>
                <h3 class="text-danger">349&nbsp;&nbsp;<small>万</small></h3>
                <a class="btn btn-info btn-xs" href="#" role="button">地铁房</a>
                <a class="btn btn-success btn-xs" href="#" role="button">学位房</a>
			        </div>
			      </div>
            </td>
          </tr>
          <tr>
            <td>
            <div class="row">
              <div class="col-sm-4 col-md-3">
                <img class="img-icon" src="${ctx}/pictures/dcq2_jg9HbEuTUN9sVHEIov88R8.jpg">
              </div>
              <div class="col-sm-8 col-md-8 col-md-offset-1">
                <h3 class="text-primary text-title">日出印象坐享沃尔玛与九方购物中心</h3>
                <h4 class="text-warning">76㎡&nbsp;&nbsp;<small>2室2厅&nbsp;&nbsp;|&nbsp;&nbsp;2/11层&nbsp;&nbsp;|&nbsp;&nbsp;南向&nbsp;&nbsp;|&nbsp;&nbsp;建筑年代：2004</small></h4>
                <h5 class="text-info">金港豪庭&nbsp;&nbsp;<small><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>龙华-龙华镇人民南路与布龙路交汇处</small></h5>
                <h3 class="text-danger">480&nbsp;&nbsp;<small>万</small></h3>
                <a class="btn btn-info btn-xs" href="#" role="button">地铁房</a>
                <a class="btn btn-success btn-xs" href="#" role="button">优质教育</a>
                <a class="btn btn-info btn-xs" href="#" role="button">精装</a>
              </div>
            </div>
            </td>
          </tr>
          <tr>
            <td>
            <div class="row">
              <div class="col-sm-4 col-md-3">
                <img class="img-icon" src="${ctx}/pictures/FpW5nXd5jnIpe-T0EWmceMlfycdY.jpg">
              </div>
              <div class="col-sm-8 col-md-8 col-md-offset-1">
                <h3 class="text-primary text-title">成熟小区 超值产业 配套齐全 适合住家</h3>
                <h4 class="text-warning">106㎡&nbsp;&nbsp;<small>3室2厅&nbsp;&nbsp;|&nbsp;&nbsp;12/19层&nbsp;&nbsp;|&nbsp;&nbsp;南北向&nbsp;&nbsp;|&nbsp;&nbsp;建筑年代：2004</small></h4>
                <h5 class="text-info">金汇名园&nbsp;&nbsp;<small><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>宝安中心区-宝安宝城41区翻身大道与甲岸路之交汇处</small></h5>
                <h3 class="text-danger">349&nbsp;&nbsp;<small>万</small></h3>
                <a class="btn btn-info btn-xs" href="#" role="button">地铁房</a>
                <a class="btn btn-success btn-xs" href="#" role="button">学位房</a>
              </div>
            </div>
            </td>
          </tr>
          <tr>
            <td>
            <div class="row">
              <div class="col-sm-4 col-md-3">
                <a href="${ctx}/house/detail/jg9HbEuTUN9sVHEIov88R8" target="_blank"><img class="img-icon" src="${ctx}/pictures/dcq2_jg9HbEuTUN9sVHEIov88R8.jpg"></a>
              </div>
              <div class="col-sm-8 col-md-8 col-md-offset-1">
                <h3 class="text-primary text-title">日出印象坐享沃尔玛与九方购物中心</h3>
                <h4 class="text-warning">76㎡&nbsp;&nbsp;<small>2室2厅&nbsp;&nbsp;|&nbsp;&nbsp;2/11层&nbsp;&nbsp;|&nbsp;&nbsp;南向&nbsp;&nbsp;|&nbsp;&nbsp;建筑年代：2004</small></h4>
                <h5 class="text-info">金港豪庭&nbsp;&nbsp;<small><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>龙华-龙华镇人民南路与布龙路交汇处</small></h5>
                <h3 class="text-danger">480&nbsp;&nbsp;<small>万</small></h3>
                <a class="btn btn-info btn-xs" href="#" role="button">地铁房</a>
                <a class="btn btn-success btn-xs" href="#" role="button">优质教育</a>
                <a class="btn btn-info btn-xs" href="#" role="button">精装</a>
              </div>
            </div>
            </td>
          </tr>
        </tbody>
      </table>

      <nav class="pager-nav">
			  <ul class="pagination pagination-sm">
			    <li>
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li class="active"><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li>
			      <a href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>

    </div><!-- /.blog-main -->

    <div class="col-sm-12 col-md-3 hidden-sm hidden-xs">
      <div class="panel panel-default">
			  <div class="panel-heading">热点房源</div>
			  <table class="table">
         <tbody>
           <tr>
             <td><h6>蘅芳苑小区 <small>龙岗-布吉</small></h6></td>
             <td class="text-right">售1130套</td>
           </tr>
           <tr>
             <td><h6>麒麟花园三期 <small>龙岗-布吉</small></h6></td>
             <td class="text-right">售59套</td>
           </tr>
           <tr>
             <td><h6>大冲城市花园 <small>龙岗-布吉</small></h6></td>
             <td class="text-right">售80套</td>
           </tr>
           <tr>
             <td><h6>熙龙湾一期 <small>龙岗-宝安中心区</small></h6></td>
             <td class="text-right">售213套</td>
           </tr>
           <tr>
             <td><h6>西城上筑 <small>龙岗-布吉</small></h6></td>
             <td class="text-right">售23套</td>
           </tr>
           <tr>
             <td><h6>大冲城市花园 <small>龙岗-布吉</small></h6></td>
             <td class="text-right">售34套</td>
           </tr>
           <tr>
             <td><h6>大冲城市花园 <small>龙岗-布吉</small></h6></td>
             <td class="text-right">售46套</td>
           </tr>
           <tr>
             <td><h6>蘅芳苑小区 <small>龙岗-布吉</small></h6></td>
             <td class="text-right">售1130套</td>
           </tr>
           <tr>
             <td><h6>麒麟花园三期 <small>龙岗-布吉</small></h6></td>
             <td class="text-right">售59套</td>
           </tr>
           <tr>
             <td><h6>大冲城市花园 <small>龙岗-布吉</small></h6></td>
             <td class="text-right">售80套</td>
           </tr>
           <tr>
             <td><h6>熙龙湾一期 <small>龙岗-宝安中心区</small></h6></td>
             <td class="text-right">售213套</td>
           </tr>
         </tbody>
        </table>
			</div>
    </div><!-- /.blog-sidebar -->

  </div><!-- /.row -->
  <jscript>
  <script src="${ctx}/js/format.js"></script>
  <script src="${ctx}/js/dialog-min.js"></script>
  <script src="${ctx}/js/jquery.dataTables.min.js"></script>
  <script>
  $(document).ready(function() {
	  $("#conditionsPane").hide();
	  $("#districtsPane").hide();
	  
	  /* var d = dialog({
        title: '欢迎',
        content: '欢迎使用 artDialog 对话框组件！'
    });
    d.showModal(); */
	  /* $('#tableDatas').DataTable({
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
	  }); */
	  //addActived("prices");
	  //addActived("patterns");
	  //addActived("areas");
	  
  });
  
  function queryRegions(regionId, _this) {
	  addActived("citys", regionId, _this);
	  var $districts = $("#districts");
	  $("#districts li").remove();
	  if (regionId != "0") {
		  var url = "${ctx}/house/region?random="+ Math.random();
		    var params = {
		      parentId: regionId
		    };
		    var $htmlLi = $("<li><button type=\"button\" class=\"btn btn-danger btn-xs\" onclick=\"addActived('districts', '0', this);\">不限</button></li>");
		    $districts.append($htmlLi);
		    
		    $.post(url, params, function(result) {
		      if ("500" != result.code) {
		        for (var i=0; i<result.data.length; i++) {
		          $htmlLi = $("<li><button type=\"button\" class=\"btn btn-link btn-xs\" onclick=\"addActived('districts', '', this);\">" + result.data[i].name + "</button></li>");
		          $districts.append($htmlLi);
		        }
		        $("#districtsPane").show();
		      }
		    }, "json");
	  } else {
		  $("#districtsPane").hide();
	  }
  }
  /* function addActived(fieldId, val, _this) {
	  $("#" + fieldId + " li>button.btn-danger").removeClass("btn-danger").addClass("btn-link");
    $(_this).removeClass("btn-link").addClass("btn-danger");
    $("#conditionsPane").show();
  } */
  function addActivedName(fieldId, val, name, _this) {
	  $("#" + fieldId + " li>button.btn-danger").removeClass("btn-danger").addClass("btn-link");
	  $(_this).removeClass("btn-link").addClass("btn-danger");
	  
	  if (name) {
		  $('.alert').unbind('close.bs.alert');
		  $("#" + fieldId + "Name").val(name);
		  $("#conditions li").remove();
		  var patternsName = $("#patternsName").val();
	    if (patternsName) {
	      addActived("patterns", patternsName);
	    }
		  var areasName = $("#areasName").val();
		  if (areasName) {
			  addActived("areas", areasName);
		  }
	  }  
	  
	  dialog({
		  title: '房源载入中...'
	  }).showModal();
  }
  function addActived(fieldId, name) {
	  var $htmlBtn = $("<button type=\"button\" class=\"close close-btn\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button>");
    var $htmlDiv = $("<div class=\"alert alert-warning alert-dismissible fade in alert-btn\" role=\"alert\"></div>");
    $htmlDiv.append($htmlBtn);
    $htmlDiv.append($("<span>" + name + "</span>"));
    var $htmlLi = $("<li class=\"" + fieldId + "\"></li>");
    $htmlLi.append($htmlDiv);
    $("#conditions").append($htmlLi);
    $("#conditionsPane").show();
    
    $('.alert').bind('close.bs.alert', function () {
      var $parentLi = $(this).parent();
      $parentLi.remove();
      var parentId = $parentLi.attr("class");
      $("#" + parentId + "Name").val("");
      $("#" + fieldId + " li>button.btn-danger").removeClass("btn-danger").addClass("btn-link");
    });
  }
  </script>
  </jscript>
</body>
</html>
