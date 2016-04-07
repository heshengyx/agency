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
	.search-left {
    /* width: 70px; */
    margin-right: -30px;
	}
	
	@media (min-width: 1200px) {
	  .col-left {margin-right: -30px;}
	}
	
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
        <div class="col-md-1 search-left"><div class="search-title"><strong>位置：</strong></div></div>
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
				      <ul class="list-inline" id="districts">
							  <li><button type="button" class="btn btn-danger btn-xs" onclick="queryRegions('0', '', this);">不限</button></li>
							  <c:forEach var="data" items="${regions}">
							  <li><button type="button" class="btn btn-link btn-xs" onclick="queryRegions('${data.id}', '${data.name}', this);">${data.name}</button></li>
							  </c:forEach> 
							</ul>
							<div id="townsPane">
								<hr>
								<ul class="list-inline" id="towns">
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
        <div class="col-md-1 search-left"><div class="search-title"><strong>价格：</strong></div></div>
        <div class="col-md-11">
          <div class="search-pane">
	          <ul class="list-inline" id="prices">
	            <li><button type="button" class="btn btn-danger btn-xs" onclick="addActivedName('prices', '0', '', this);">不限</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('prices', '100:lt', '100万以下', this);">100万以下</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('prices', '100-200', '100万-200万', this);">100万-200万</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('prices', '200-300', '200万-300万', this);">200万-300万</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('prices', '300-400', '300万-400万', this);">300万-400万</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('prices', '400-500', '400万-500万', this);">400万-500万</button></li>
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('prices', '500-700', '500万-700万', this);">500万-700万</button></li>
	          </ul>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-1 search-left"><div class="search-title"><strong>户型：</strong></div></div>
        <div class="col-md-11">
          <div class="search-pane">
            <ul class="list-inline" id="patterns">
              <li><button type="button" class="btn btn-danger btn-xs" onclick="addActivedName('patterns', '0', '', this);">不限</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '1', '一室', this);">一室</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '2', '二室', this);">二室</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '3', '三室', this);">三室</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '4', '四室', this);">四室</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '5', '五室', this);">五室</button></li>
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('patterns', '5:gt', '五室以上', this);">五室以上</button></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-1 search-left"><div class="search-title"><strong>面积：</strong></div></div>
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
        <div class="col-md-1 search-left"><div class="search-title"><strong>条件：</strong></div></div>
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
	  </div>
	</div>
	
  <input id="districtsName" type="hidden">
  <input id="townsName" type="hidden">
  <input id="pricesName" type="hidden">
  <input id="patternsName" type="hidden">
  <input id="areasName" type="hidden">
  
  <div class="row">
    <div class="col-md-9 content-main">
    
      <table class="table table-hover table-striped table-data" id="tableData" width="100%">
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
      </table>

      <!-- <nav class="pager-nav">
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
			</nav> -->

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
  var d = null;
  var table = null;
  $(document).ready(function() {
	  $("#conditionsPane").hide();
	  $("#townsPane").hide();
	  
	  d = dialog({
		  title: '房源载入中...'
    });
    d.showModal();
    table = $('#tableData').DataTable({
		  "paging":    true,
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
		  "dom": "rt<'bottom'<'row'<'col-md-12'p>><'clear'>>",
		  //"dom": "<'toolbar'>rt<'bottom'<'row'<'col-xs-2'i><'col-xs-10'p>><'clear'>>",
		  "pagingType":  "full_numbers",
		  "filter":     false,
		  "processing": true,
		  "serverSide": true,
		  "ajax": {
			  "url": "${ctx}/trade/queryData",
		    "type": "POST"
		  },
		  "columnDefs": [
      {
        "render": function(data, type, row) {
        	var symbol = "万";
        	if (data.type == "2") {
        		symbol = "元";
        	}
        	var content = "";
        	content += "<div class=\"row\">";
        	content += "  <div class=\"col-sm-4 col-md-4 col-left\">";
        	content += "    <img class=\"img-icon\" src=\"${ctx}/pictures/" + data.url + "\">";
        	content += "  </div>";
        	//content += "  <div class=\"col-sm-1 col-md-1 col-md-offset-1\"></div>";
        	content += "  <div class=\"col-sm-8 col-md-8\">";
        	content += "    <h3 class=\"text-primary text-title\">" + data.title + "</h3>";
        	content += "    <h4 class=\"text-warning\">" + jmoney(data.area) + "<small>㎡&nbsp;&nbsp;3室2厅&nbsp;&nbsp;|&nbsp;&nbsp;12/19层&nbsp;&nbsp;|&nbsp;&nbsp;南北向&nbsp;&nbsp;|&nbsp;&nbsp;建筑年代：2004</small></h4>";
        	content += "    <h5 class=\"text-info\">" + data.buildingName + "&nbsp;&nbsp;<small><span class=\"glyphicon glyphicon-map-marker\" aria-hidden=\"true\"></span>宝安中心区-" + data.buildingAddress + "</small></h5>";
        	content += "    <h3 class=\"text-danger\">" + jmoney(data.price) + "&nbsp;&nbsp;<small>" + symbol + "</small></h3>";
        	content += "    <a class=\"btn btn-info btn-xs\" href=\"#\" role=\"button\">地铁房</a>";
        	content += "    <a class=\"btn btn-success btn-xs\" href=\"#\" role=\"button\">学位房</a>";
        	content += "  </div>";
        	content += "</div>";
          return content;
        },
        "targets": [0]
      }],
		  "columns": [
        { "data": null }
      ],
      initComplete: function () {
    	  d.close();
      }
	  });
	  //$('#tableData').removeAttr("style");
    $("#search-btn").click(function() {
        var search = "?";
        search += "provinceId=" + $("#s-inputProvince").val();
        search += "&cityId=" + $("#s-inputCity").val();
        search += "&districtId=" + $("#s-inputDistrict").val();
        search += "&townId=" + $("#s-inputTown").val();
        search += "&buildingName=" + $("#s-inputBuildingName").val();
        search += "&startDate=" + $("#s-inputStartDate").val();
        search += "&endDate=" + $("#s-inputEndDate").val();
      table.ajax.url("${ctx}/manage/building/list" + search).load();
    });
  });
  
  function queryRegions(regionId, name, _this) {
	  addActivedName("districts", regionId, name, _this);
	  var $districts = $("#towns");
	  $("#towns li").remove();
	  if (regionId != "0") {
		  var url = "${ctx}/house/region?random="+ Math.random();
	    var params = {
	      parentId: regionId
	    };
	    var $htmlLi = $("<li><button type=\"button\" class=\"btn btn-danger btn-xs\" onclick=\"addActivedName('towns', '0', '', this);\">不限</button></li>");
	    $districts.append($htmlLi);
	    
	    $.post(url, params, function(result) {
	      if ("500" != result.code) {
	        for (var i=0; i<result.data.length; i++) {
	          $htmlLi = $("<li><button type=\"button\" class=\"btn btn-link btn-xs\" onclick=\"addActivedName('towns', '" + result.data[i].id + "', '" + result.data[i].name + "', this);\">" + result.data[i].name + "</button></li>");
	          $districts.append($htmlLi);
	        }
	        $("#townsPane").show();
	      }
	    }, "json");
	  } else {
		  $("#townsPane").hide();
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
		  var townsName = $("#townsName").val();
		  if (townsName) {
			  addActived("towns", townsName);
		  } else {
			  var districtsName = $("#districtsName").val();
	      if (districtsName) {
	        addActived("districts", districtsName);
	      }
		  }
		  
	    var pricesName = $("#pricesName").val();
	    if (pricesName) {
	      addActived("prices", pricesName);
	    } 
		  var patternsName = $("#patternsName").val();
	    if (patternsName) {
	      addActived("patterns", patternsName);
	    }
		  var areasName = $("#areasName").val();
		  if (areasName) {
			  addActived("areas", areasName);
		  }
	  }  
	  
	  d = dialog({
		  title: '房源载入中1...'
	  });
	  d.showModal();
	  
	  queryHouse();
  }
  function addActived(fieldId, name) {
	  var $htmlBtn = $("<button type=\"button\" class=\"close close-btn\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button>");
    var $htmlDiv = $("<div class=\"alert alert-warning alert-dismissible fade in alert-btn\" id=\"alert_" + fieldId + "\" role=\"alert\"></div>");
    $htmlDiv.append($htmlBtn);
    $htmlDiv.append($("<span>" + name + "</span>"));
    var $htmlLi = $("<li class=\"" + fieldId + "\"></li>");
    $htmlLi.append($htmlDiv);
    $("#conditions").append($htmlLi);
    $("#conditionsPane").show();
    
    $("#alert_" + fieldId).bind("close.bs.alert", function () {
      var $parentLi = $(this).parent();
      $parentLi.remove();
      var parentId = $parentLi.attr("class");
      $("#" + parentId + "Name").val("");
      $("#" + parentId + " li>button.btn-danger").removeClass("btn-danger").addClass("btn-link");
      $("#" + parentId + " li:first-child>button").removeClass("btn-link").addClass("btn-danger");

      dialog({
        title: '房源载入中...'
      }).showModal();
      
      var length = $("#conditions li").length;
      if(!length) {
    	  $("#conditionsPane").hide();
      }
    });
  }
  function queryHouse() {
	  //var search = "";
	  //table.clear().draw();
	  //table.ajax.url("${ctx}/trade/queryData" + search).load();
	  //d.close();
	  var url = "${ctx}/trade/queryData?random="+ Math.random();
    var params = {
    	draw: 0,
    	length: 10
    };
	  $.post(url, params, function(result) {
		  table.clear().draw();
		  //table.rows.add(result.data).draw();
	    d.close();
    }, "json");
  }
  </script>
  </jscript>
</body>
</html>
