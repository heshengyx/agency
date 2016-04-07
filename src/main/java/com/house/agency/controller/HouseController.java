package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.entity.Region;
import com.house.agency.param.RegionQueryParam;
import com.house.agency.service.IRegionService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;

@Controller
@RequestMapping("/house")
public class HouseController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(HouseController.class);
	
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
	
	@RequestMapping("/region")
	@ResponseBody
	public Object region(String parentId) {
		JsonMessage jMessage = new JsonMessage();
		RegionQueryParam param = new RegionQueryParam();
		param.setParentId(parentId);
		
		List<Region> regions = null;
		try {
			regions = regionService.list(param);
			jMessage.setCode(JsonMessage.SUCCESS_CODE);
			jMessage.setData(regions);
		} catch (Exception e) {
			jMessage.setCode(JsonMessage.ERROR_CODE);
			if (e instanceof ServiceException) {
				jMessage.setMessage(e.getMessage());
			} else {
				jMessage.setMessage("系统异常");
			}
			logger.error(jMessage.getMessage(), e);
		}
		return jMessage;
	}
	
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {
		/*Product param = new Product();
		param.setId(id);
		param = productService.getData(param);
		model.addAttribute("product", param);*/
		return "house-detail";
	}
}
