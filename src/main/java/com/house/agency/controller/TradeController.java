package com.house.agency.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.param.TradeQueryParam;
import com.house.agency.service.ITradeService;

@Controller
@RequestMapping("/trade")
public class TradeController extends BaseController {

	@Autowired
	private ITradeService tradeService;
	
	@RequestMapping("/queryData")
	@ResponseBody
	public Object queryData(TradeQueryParam param, int page, int rows) {
		return tradeService.queryData(param, page, rows);
	}
}
