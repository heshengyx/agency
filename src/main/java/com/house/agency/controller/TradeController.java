package com.house.agency.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.data.TradeData;
import com.house.agency.page.IPage;
import com.house.agency.param.TradeQueryParam;
import com.house.agency.service.ITradeService;
import com.myself.common.message.JsonResult;

@Controller
@RequestMapping("/trade")
public class TradeController extends BaseController {

	@Autowired
	private ITradeService tradeService;
	
	@RequestMapping("/queryData")
	@ResponseBody
	public Object queryData(TradeQueryParam param) {
		IPage<TradeData> datas = tradeService.queryData(param, param.getPage(), param.getLength());
		JsonResult<TradeData> jResult = new JsonResult<TradeData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<TradeData>)datas.getData());
		return jResult;
	}
}
