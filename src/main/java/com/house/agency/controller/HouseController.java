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

import com.house.agency.data.HouseInfoData;
import com.house.agency.data.HouseData;
import com.house.agency.entity.Image;
import com.house.agency.entity.Region;
import com.house.agency.page.IPage;
import com.house.agency.param.HouseQueryParam;
import com.house.agency.param.ImageQueryParam;
import com.house.agency.param.RegionQueryParam;
import com.house.agency.service.IHouseService;
import com.house.agency.service.IImageService;
import com.house.agency.service.IRegionService;
import com.myself.common.message.JsonResult;

@Controller
@RequestMapping("/house")
public class HouseController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(HouseController.class);
	
	@Autowired
	private IHouseService houseService;
	
	@Autowired
	private IRegionService regionService;
	
	@Autowired
	private IImageService imageService;

	@RequestMapping("")
	public String page(Model model) {
		RegionQueryParam param = new RegionQueryParam();
		param.setCode("SZ");
		List<Region> regions = regionService.list(param);
		model.addAttribute("regions", regions);
		return "house";
	}
	
	@RequestMapping("/queryData")
	@ResponseBody
	public Object queryData(HouseQueryParam param) {
		IPage<HouseData> datas = houseService.queryData(param, param.getPage(),
				param.getLength());
		JsonResult<HouseData> jResult = new JsonResult<HouseData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<HouseData>) datas.getData());
		return jResult;
	}
	
	@RequestMapping(value = "/info/{tradeId}", method = RequestMethod.GET)
	public String info(@PathVariable String tradeId, Model model) {
		HouseInfoData detail = houseService.getData(tradeId);
		model.addAttribute("detail", detail);
		
		ImageQueryParam param = new ImageQueryParam();
		param.setTradeId(tradeId);
		List<Image> images = imageService.queryData(param);
		model.addAttribute("images", images);
		
		param = new ImageQueryParam();
		param.setTradeId(tradeId);
		param.setForeignId(detail.getBuildingId());
		param.setType("1");
		images = imageService.listData(param);
		model.addAttribute("buildingImages", images);
		
		param = new ImageQueryParam();
		param.setTradeId(tradeId);
		param.setForeignId(detail.getHouseId());
		param.setType("2");
		images = imageService.listData(param);
		model.addAttribute("houseImages", images);
		return "houseInfo";
	}
}
