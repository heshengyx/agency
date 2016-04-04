package com.house.agency.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		/*Product param = new Product();
		param.setId(id);
		param = productService.getData(param);
		model.addAttribute("product", param);*/
		model.addAttribute("house", id);
		return "house-detail";
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public Object query(HouseQueryParam param, int page, int rows) {
		return houseService.query(param, page, rows);
	}
}
