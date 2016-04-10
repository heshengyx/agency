<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/include.jsp"%>  
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>二手房-爱房网</title>
	<link href="${ctx}/css/ui-dialog.css" rel="stylesheet">
	<link href="${ctx}/css/dataTables.bootstrap.css" rel="stylesheet">
	<link href="${ctx}/css/jquery.autocompleter.css" rel="stylesheet">
	<link href="${ctx}/css/autocompleter.css" rel="stylesheet">
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
	
	.order {margin-top: 5px;}
	</style>
</head>

<body>
  <div class="panel panel-default panel-search">
	  <div class="panel-body">
      <div class="row">
        <div class="col-md-1 search-left"><div class="search-title"><strong>位置：</strong></div></div>
        <div class="col-md-11">
          <ul class="nav nav-tabs" id="navTabs" role="tablist">
				    <li class="active" role="presentation"><a href="#area" aria-controls="area" role="tab" data-toggle="tab">区域</a></li>
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
				      <ul class="list-inline" id="subways">
                <li><button type="button" class="btn btn-danger btn-xs" onclick="addActivedName('subways', '0', '', this);">不限</button></li>
                <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('subways', '1', '1号线', this);">1号线</button></li>
                <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('subways', '2', '2号线', this);">2号线</button></li>
                <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('subways', '3', '3号线', this);">3号线</button></li>
                <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('subways', '4', '4号线', this);">4号线</button></li>
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
	            <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('prices', '1-100', '100万以下', this);">100万以下</button></li>
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
              <li><button type="button" class="btn btn-link btn-xs" onclick="addActivedName('areas', '1-50', '50平米以下', this);">50平米以下</button></li>
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
              <li></li>
            </ul>
          </div>
        </div>
      </div>
	  </div>
	</div>
	
	<input id="districtsValue" type="hidden">
  <input id="townsValue" type="hidden">
  <input id="pricesValue" type="hidden">
  <input id="patternsValue" type="hidden">
  <input id="areasValue" type="hidden">
  <input id="districtsName" type="hidden">
  <input id="townsName" type="hidden">
  <input id="pricesName" type="hidden">
  <input id="patternsName" type="hidden">
  <input id="areasName" type="hidden">
  <input id="subwaysValue" type="hidden">
  <input id="subwaysName" type="hidden">
  <input id="tag" type="hidden">
  <input id="sort" type="hidden" value="desc">
  
  <div class="row">
    <div class="col-md-9 content-main">
      <table class="table table-hover table-striped table-data" id="tableData" width="100%">
        <thead>
          <tr>
            <td>
              <div class="row">
                <div class="col-sm-8 col-md-6">
                  <div class="input-group field">
                    <input class="form-control" id="buildingName" type="text" placeholder="小区名称">
                    <span class="input-group-btn">
                      <button class="btn btn-default" id="search-btn" type="button">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                      </button>
                    </span>
                  </div>
                </div>
                <div class="col-sm-4 col-md-4 col-md-offset-2">
                  <div class="text-right order">
                   <button type="button" class="btn btn-link btn-xs" onclick="orders('price', this);">价格<span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span></button>
                   <button type="button" class="btn btn-link btn-xs" onclick="orders('area', this);">面积<span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span></button>
                   <button type="button" class="btn btn-info btn-xs" onclick="orders('release', this);">发布时间<span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></button>
                  </div>
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
  <script src="${ctx}/js/dataTables.bootstrap.js"></script>
  <script src="${ctx}/js/jquery.autocompleter.js"></script>
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
    //发送参数
    //draw请求次数计数器integer
    //start第一条数据的起始位置0代表第一条数据integer
    //length服务器每页显示的条数integer
    //返回的数据
    //draw强烈要求把这个转换为整数后再返回integer
    //recordsTotal即没有过滤的记录数（数据库里总共记录数）integer
    //recordsFiltered过滤后的记录数integer
    //data表中中需要显示的数据array
    //error可选。你可以定义一个错误来描述服务器出了问题后的友好提示
    /* l - Length changing 改变每页显示多少条数据的控件
		f - Filtering input 即时搜索框控件
		t - The Table 表格本身
		i - Information 表格相关信息控件
		p - Pagination 分页控件
		r - pRocessing 加载等待显示信息
		< > - div elements 代表一个div元素 <div><div>
		<"#id" > - div with an id 指定了id的div元素 <div id='id'><div>
		<"class" > - div with a class 指定了样式名的div元素 <div class='class'><div>
		<"#id.class" > - div with an id and class 指定了id和样式的div元素 <div id='id' class='class'><div> */
		//"DT_RowId": "row_25"每行添加ID
    table = $("#tableData").DataTable({
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
		  dom: 'tp',
		  //"pagingType":  "full_numbers",
		  "filter":     false,
		  "processing": true,
		  "serverSide": true, //开启服务器模式
		  //"deferRender": true, //开启延迟渲染
		  "ajax": {
			  "url": "${ctx}/house/queryData",
		    "type": "POST",
		    "data": function ( d ) { //添加额外的参数发送到服务器
		    	//d.tag = "release";
		    	//d.sort = $("#sort").val();
		    }
		  },
		  /* "ajax": function (data, callback, settings) {
		    callback(
		    	JSON.parse( localStorage.getItem('dataTablesData') )
		    );
		  }, */
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
        	content += "    <a href=\"${ctx}/house/detail/" + data.tradeId + "\" target=\"_blank\"><img class=\"img-icon\" src=\"${ctx}/pictures/" + data.url + "\" title=\"" + data.buildingName + "\"></a>";
        	content += "  </div>";
        	content += "  <div class=\"col-sm-8 col-md-8\">";
        	content += "    <h3 class=\"text-primary text-title\">" + data.title + "</h3>";
        	content += "    <h4 class=\"text-warning\">" + jmoney(data.area) + "<small>㎡&nbsp;&nbsp;" + data.room + "室" + data.saloon + "厅&nbsp;&nbsp;|&nbsp;&nbsp;" + data.floor + "/" + data.buildingFloor + "层&nbsp;&nbsp;|&nbsp;&nbsp;南北向&nbsp;&nbsp;|&nbsp;&nbsp;建筑年代：" + data.buildingYear + "</small></h4>";
        	content += "    <h5 class=\"text-info\">" + data.buildingName + "&nbsp;&nbsp;<small><span class=\"glyphicon glyphicon-map-marker\" aria-hidden=\"true\"></span>" + data.townName + "-" + data.buildingAddress + "</small></h5>";
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
    /* $("#search-btn").click(function() {
        var search = "?";
        search += "provinceId=" + $("#s-inputProvince").val();
        search += "&cityId=" + $("#s-inputCity").val();
        search += "&districtId=" + $("#s-inputDistrict").val();
        search += "&townId=" + $("#s-inputTown").val();
        search += "&buildingName=" + $("#s-inputBuildingName").val();
        search += "&startDate=" + $("#s-inputStartDate").val();
        search += "&endDate=" + $("#s-inputEndDate").val();
      table.ajax.url("${ctx}/manage/building/list" + search).load();
    }); */
    
    /* $('#tableData tbody').on('click', 'td', function () {
        alert( 'Clicked on: '+this.innerHTML );
    } ); */
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
   	  //e.target // newly activated tab
   	  //e.relatedTarget // previous active tab
   	  var target = $(e.target).attr("aria-controls");
   	  var relatedTarget = $(e.relatedTarget).attr("aria-controls");

   	  if (relatedTarget == "area") {
   		  var $li = $("#conditions li[data-value='districts']");
   		  if ($li.length) {
   			  $li.remove();
   		  }
   		  $li = $("#conditions li[data-value='towns']");
   		  if ($li.length) {
          $li.remove();
        }
   		  $("#districts li>button.btn-danger").removeClass("btn-danger").addClass("btn-link");
        $("#districts li>button:first").removeClass("btn-link").addClass("btn-danger");
        $("#towns li").remove();
        $("#townsPane").hide();
        
        $("#districtsName").val("");
        $("#townsName").val("");
        $("#districtsValue").val("");
        $("#townsValue").val("");
   	  } else {
   		  $("#conditions li[data-value='" + relatedTarget + "s']").remove();
   		  $("#" + relatedTarget + "s li>button.btn-danger").removeClass("btn-danger").addClass("btn-link");
        $("#" + relatedTarget + "s li>button:first").removeClass("btn-link").addClass("btn-danger");
        
        $("#" + relatedTarget + "sName").val("");
        $("#" + relatedTarget + "sValue").val("");
   	  }
   	  
	   	var length = $("#conditions li").length;
	    if(!length) {
	      $("#conditionsPane").hide();
	    }
   	});

    $("#buildingName").autocompleter({
      // marker for autocomplete matches
      highlightMatches: true,
      // object to local or url to remote search
      source: '${ctx}/building/search',
      // custom template
      template: '{{ label }} <span>({{ districtName }}-{{ townName }})</span>',
      // show hint
      hint: true,
      // abort source if empty field
      empty: false,
      // max results
      //limit: 1,
      combine: function() {
    	  var districtId = $("#districtsValue").val();
    	  var townId = $("#townsValue").val();
    	  if (townId) {
    		  districtId = "";
    	  } else {
    		  townId = "";
    	  }
    	  return {
    		  buildingName: $("#buildingName").val(),
    		  districtId: districtId,
    		  townId: townId
    	  }
      },
      callback: function (value, index, selected) {
        /* if (selected) {
       	  $('.icon').css('background-color', selected.hex);
        } */
      }
    });
    
    $("#search-btn").click(function() {
    	loadHouse();
    });
  });
  
  function queryRegions(regionId, name, _this) {
	  addActivedName("districts", regionId, name, _this);
	  var $districts = $("#towns");
	  $("#towns li").remove();
	  if (regionId != "0") {
		  var url = "${ctx}/region/list?random="+ Math.random();
	    var params = {
	      parentId: regionId
	    };
	    var $htmlLi = $("<li><button type=\"button\" class=\"btn btn-danger btn-xs\" onclick=\"addActivedName('towns', '0', '', this);\">不限</button></li>");
	    $districts.append($htmlLi).append("\n");
	    
	    $.post(url, params, function(result) {
	      if ("500" != result.code) {
	        for (var i=0; i<result.data.length; i++) {
	          $htmlLi = $("<li><button type=\"button\" class=\"btn btn-link btn-xs\" onclick=\"addActivedName('towns', '" + result.data[i].id + "', '" + result.data[i].name + "', this);\">" + result.data[i].name + "</button></li>");
	          $districts.append($htmlLi).append("\n");
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
		  $("#" + fieldId + "Value").val(val);
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
		  
		  var subwaysName = $("#subwaysName").val();
		  if (subwaysName) {
        addActived("subways", subwaysName);
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
	  
	  loadHouse();
  }
  function addActived(fieldId, name) {
	  var $htmlBtn = $("<button type=\"button\" class=\"close close-btn\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button>");
    var $htmlDiv = $("<div class=\"alert alert-warning alert-dismissible fade in alert-btn\" id=\"alert_" + fieldId + "\" role=\"alert\"></div>");
    $htmlDiv.append($htmlBtn);
    $htmlDiv.append($("<span>" + name + "</span>"));
    var $htmlLi = $("<li data-value=\"" + fieldId + "\"></li>");
    $htmlLi.append($htmlDiv);
    $("#conditions").append($htmlLi);
    $("#conditionsPane").show();
    
    $("#alert_" + fieldId).bind("close.bs.alert", function () {
      var $parentLi = $(this).parent();
      $parentLi.remove();
      var parentId = $parentLi.attr("data-value");
      $("#" + parentId + "Value").val("");
      $("#" + parentId + "Name").val("");
      $("#" + parentId + " li>button.btn-danger").removeClass("btn-danger").addClass("btn-link");
      $("#" + parentId + " li:first-child>button").removeClass("btn-link").addClass("btn-danger");

      var length = $("#conditions li").length;
      if(!length) {
    	  $("#conditionsPane").hide();
      }
      if (parentId == "districts") {
    	  $("#towns li").remove();
    	  $("#townsPane").hide();
      }
      
      loadHouse();
    });
  }
  function queryHouse(param) {
	  var values = null;
	  var search = "?random=" + Math.random();
	  var tabName = $("#navTabs li.active").children().attr("aria-controls");
	  if (tabName == "area") {
		  var townsValue = $("#townsValue").val();
	    if (townsValue && townsValue != "0") {
	      search += "&townId=" + townsValue;
	    } else {
	      var districtsValue = $("#districtsValue").val();
	      if (districtsValue && districtsValue != "0") {
	        search += "&districtId=" + districtsValue;
	      }
	    }
	  } else {
		  var tabValue = $("#" + tabName + "sValue").val();
		  if (tabValue && tabValue != "0") {
			  search += "&" + tabName + "=" + tabValue;
		  }
	  }

	  var pricesValue = $("#pricesValue").val();
    if (pricesValue && pricesValue != "0") {
      values = pricesValue.split("-");
      search += "&priceBegin=" + (parseInt(values[0])*100);
      search += "&priceEnd=" + (parseInt(values[1])*100);
    }
	  var patternsValue = $("#patternsValue").val();
    if (patternsValue && patternsValue != "0") {
      values = patternsValue.split(":");
      if (values.length > 1) {
    	  search += "&symbol=" + values[1];
      }
      search += "&pattern=" + values[0];
    }
	  var areasValue = $("#areasValue").val();
    if (areasValue && areasValue != "0") {
    	values = areasValue.split("-");
    	search += "&areaBegin=" + (parseInt(values[0])*100);
    	search += "&areaEnd=" + (parseInt(values[1])*100);
    }
    if (param) {
    	search += param;
    }
    //console.log(search);
	  table.ajax.url("${ctx}/house/queryData" + search).load();
	  d.close();
	  /* var url = "${ctx}/house/queryData?random="+ Math.random();
    var params = {
    	//draw: 0,
    	length: 3
    };
	  $.post(url, params, function(result) {
		  table.clear();
		  //table.rows().remove();
		  table.rows.add(result.data);
	    d.close();
    }, "json"); */
  }
  function loadHouse() {
	  var param = "";
	  var buildingName = $("#buildingName").val();
    if (buildingName) {
    	param += "&buildingName=" + buildingName;
    }
	  
	  var tag = $("#tag").val();
	  if (!tag) {
		  tag = "release";
	  }
    var sort = $("#sort").val();
    param += "&tag=" + tag + "&sort=" + sort;
    
    d = dialog({
      title: '房源载入中...'
    });
    d.showModal();

    queryHouse(param);
  }
  function orders(tag, _this) {
	  var flag = $(_this).hasClass("btn-info");
	  if(!flag) {
		  var $parent = $(_this).parent();
		  $parent.children(".btn-info").removeClass("btn-info").addClass("btn-link");
		  $(_this).removeClass("btn-link").addClass("btn-info");
	  }
	  
	  var $sort = $("#sort");
	  $("#tag").val(tag);
	  var sort = $sort.val();
	  if (sort == "asc") {
		  $sort.val("desc");
		  $(_this).children().removeClass("glyphicon-arrow-up").addClass("glyphicon-arrow-down");
	  } else {
		  $sort.val("asc");
		  $(_this).children().removeClass("glyphicon-arrow-down").addClass("glyphicon-arrow-up");
	  }
	  
	  loadHouse();
  }
  </script>
  </jscript>
</body>
</html>
