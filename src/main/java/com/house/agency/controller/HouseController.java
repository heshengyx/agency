package com.house.agency.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.data.HouseData;
import com.house.agency.data.HouseInfoData;
import com.house.agency.entity.Image;
import com.house.agency.entity.Region;
import com.house.agency.enums.ConfigureEnum;
import com.house.agency.enums.HouseEnum;
import com.house.agency.enums.TradeEnum;
import com.house.agency.page.IPage;
import com.house.agency.param.HouseQueryParam;
import com.house.agency.param.ImageQueryParam;
import com.house.agency.param.RegionQueryParam;
import com.house.agency.service.IConfigureService;
import com.house.agency.service.IHouseService;
import com.house.agency.service.IImageService;
import com.house.agency.service.IRegionService;
import com.myself.common.message.JsonResult;
import com.myself.common.utils.MapUtil;

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
	
	@Autowired
	private IConfigureService configureService;

	@RequestMapping("/used")
	public String pageUsed(Model model) {
		page(model);
		return "houseUsed";
	}
	
	@RequestMapping("/new")
	public String pageNew(Model model) {
		page(model);
		return "houseNew";
	}
	
	@RequestMapping("/used/queryData")
	@ResponseBody
	public Object queryUsedData(HouseQueryParam param) {
		param.setType(TradeEnum.SALE.getValue());
		param.setStyle(HouseEnum.USED.getValue());
		return queryData(param);
	}
	
	@RequestMapping("/new/queryData")
	@ResponseBody
	public Object queryNewData(HouseQueryParam param) {
		param.setStyle(HouseEnum.NEW.getValue());
		param.setType(TradeEnum.SALE.getValue());
		return queryData(param);
	}
	
	private JsonResult<HouseData> queryData(HouseQueryParam param) {
		IPage<HouseData> datas = houseService.queryData(param, param.getPage(),
				param.getLength());
		JsonResult<HouseData> jResult = new JsonResult<HouseData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<HouseData>) datas.getData());
		return jResult;
	}
	
	private void page(Model model) {
		RegionQueryParam param = new RegionQueryParam();
		param.setCode("SZ");
		List<Region> regions = regionService.list(param);
		model.addAttribute("regions", regions);
		
		String imageUrl = ConfigureEnum.IMAGE_URL.getValue();
		String faces = ConfigureEnum.FACES.getValue();
		String rooms = ConfigureEnum.ROOMS.getValue();
		String saloons = ConfigureEnum.SALOONS.getValue();
		String toilets = ConfigureEnum.TOILETS.getValue();
		String prices = ConfigureEnum.PRICES.getValue();
		String areas = ConfigureEnum.AREAS.getValue();
		String patterns = ConfigureEnum.PATTERNS.getValue();
		String subways = ConfigureEnum.SUBWAYS.getValue();
		
		StringBuilder keys = new StringBuilder("");
		keys.append("'");
		keys.append(imageUrl);
		keys.append("','");
		keys.append(faces);
		keys.append("','");
		keys.append(rooms);
		keys.append("','");
		keys.append(saloons);
		keys.append("','");
		keys.append(toilets);
		keys.append("','");
		keys.append(prices);
		keys.append("','");
		keys.append(areas);
		keys.append("','");
		keys.append(patterns);
		keys.append("','");
		keys.append(subways);
		keys.append("'");
		
		Map<String, String> map = configureService.queryValueByKey(keys.toString());
		model.addAttribute("imageUrl", map.get(imageUrl));
		model.addAttribute("faces", MapUtil.getMap(map.get(faces), "[,]"));
		model.addAttribute("rooms", MapUtil.getMapKeyLong(map.get(rooms), "[,]"));
		model.addAttribute("saloons", MapUtil.getMapKeyLong(map.get(saloons), "[,]"));
		model.addAttribute("toilets", MapUtil.getMapKeyLong(map.get(toilets), "[,]"));
		model.addAttribute("prices", MapUtil.getMap(map.get(prices), "[,]"));
		model.addAttribute("areas", MapUtil.getMap(map.get(areas), "[,]"));
		model.addAttribute("patterns", MapUtil.getMap(map.get(patterns), "[,]"));
		model.addAttribute("subways", MapUtil.getMap(map.get(subways), "[,]"));
	}
	
	@RequestMapping(value = "/info/{tradeId}", method = RequestMethod.GET)
	public String info(@PathVariable String tradeId, Model model) {
		String imageUrl = ConfigureEnum.IMAGE_URL.getValue();
		String uploadFolder = ConfigureEnum.UPLOAD_FOLDER.getValue();
		String profileBlank = ConfigureEnum.PROFILE_BLANK.getValue();
		String faces = ConfigureEnum.FACES.getValue();
		String rooms = ConfigureEnum.ROOMS.getValue();
		String saloons = ConfigureEnum.SALOONS.getValue();
		String toilets = ConfigureEnum.TOILETS.getValue();
		String fitments = ConfigureEnum.FITMENTS.getValue();
		String buildingTypes = ConfigureEnum.BUILDING_TYPES.getValue();
		String propertys = ConfigureEnum.PROPERTYS.getValue();
		
		StringBuilder keys = new StringBuilder("");
		keys.append("'");
		keys.append(imageUrl);
		keys.append("','");
		keys.append(uploadFolder);
		keys.append("','");
		keys.append(profileBlank);
		keys.append("','");
		keys.append(faces);
		keys.append("','");
		keys.append(rooms);
		keys.append("','");
		keys.append(saloons);
		keys.append("','");
		keys.append(toilets);
		keys.append("','");
		keys.append(fitments);
		keys.append("','");
		keys.append(buildingTypes);
		keys.append("','");
		keys.append(propertys);
		keys.append("'");
		
		Map<String, String> map = configureService.queryValueByKey(keys.toString());
		model.addAttribute("imageUrl", map.get(imageUrl));
		model.addAttribute("uploadFolder", map.get(uploadFolder));
		model.addAttribute("profileBlank", map.get(profileBlank));
		model.addAttribute("faces", MapUtil.getMapKeyLong(map.get(faces), "[,]"));
		model.addAttribute("rooms", MapUtil.getMapKeyLong(map.get(rooms), "[,]"));
		model.addAttribute("saloons", MapUtil.getMapKeyLong(map.get(saloons), "[,]"));
		model.addAttribute("toilets", MapUtil.getMapKeyLong(map.get(toilets), "[,]"));
		model.addAttribute("fitments", MapUtil.getMapKeyLong(map.get(fitments), "[,]"));
		model.addAttribute("buildingTypes", MapUtil.getMapKeyLong(map.get(buildingTypes), "[,]"));
		model.addAttribute("propertys", MapUtil.getMapKeyLong(map.get(propertys), "[,]"));
		
		HouseInfoData detail = houseService.getData(tradeId);
		model.addAttribute("detail", detail);
		
		ImageQueryParam param = new ImageQueryParam();
		param.setTradeId(tradeId);
		List<Image> images = imageService.queryData(param);
		model.addAttribute("images", images);
		
		param = new ImageQueryParam();
		param.setTradeId(tradeId);
		param.setForeignId(detail.getBuildingId());
		param.setType("2");
		images = imageService.queryDataByFid(param);
		model.addAttribute("buildingImages", images);
		
		param = new ImageQueryParam();
		param.setTradeId(tradeId);
		param.setForeignId(detail.getHouseId());
		param.setType("1");
		images = imageService.queryDataByFid(param);
		model.addAttribute("houseImages", images);
		return "houseInfo";
	}
}
