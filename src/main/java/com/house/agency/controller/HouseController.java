package com.house.agency.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.entity.Region;
import com.house.agency.param.HouseQueryParam;
import com.house.agency.param.RegionQueryParam;
import com.house.agency.service.IHouseService;
import com.house.agency.service.IRegionService;

@Controller
@RequestMapping("/house")
public class HouseController extends BaseController {

	@Autowired
	private IHouseService houseService;
	
	@Autowired
	private IRegionService regionService;
	
	@RequestMapping("")
	public String page(Model model) {
		RegionQueryParam param = new RegionQueryParam();
		param.setCode("SZ");
		List<Region> regions = regionService.list(param);
		model.addAttribute("regions", regions);
		return "house";
	}
	
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		/*Product param = new Product();
		param.setId(id);
		param = productService.getData(param);
		model.addAttribute("product", param);*/
		return "house-detail";
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public Object query(HouseQueryParam param, int page, int rows) {
		return houseService.query(param, page, rows);
	}
}
