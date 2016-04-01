package com.house.agency.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.param.HouseQueryParam;
import com.house.agency.service.IHouseService;

@Controller
@RequestMapping("/house")
public class HouseController extends BaseController {

	@Autowired
	private IHouseService houseService;
	
	@RequestMapping("")
	public String page() {
		return "house";
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public Object query(HouseQueryParam param, int page, int rows) {
		return houseService.query(param, page, rows);
	}
}
