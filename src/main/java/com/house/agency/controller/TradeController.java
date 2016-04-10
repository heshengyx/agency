package com.house.agency.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.agency.service.ITradeService;

@Controller
@RequestMapping("/trade")
public class TradeController extends BaseController {

	@Autowired
	private ITradeService tradeService;
}
