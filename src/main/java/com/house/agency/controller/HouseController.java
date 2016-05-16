package com.house.agency.controller;

import java.util.HashMap;
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

	@RequestMapping("")
	public String page(Model model) {
		RegionQueryParam param = new RegionQueryParam();
		param.setCode("SZ");
		List<Region> regions = regionService.list(param);
		model.addAttribute("regions", regions);
		
		String imageUrl = ConfigureEnum.IMAGE_URL.getValue();
		String faces = ConfigureEnum.FACES.getValue();
		
		StringBuilder keys = new StringBuilder("");
		keys.append("'");
		keys.append(imageUrl);
		keys.append("','");
		keys.append(faces);
		keys.append("'");
		
		Map<String, String> map = configureService.queryValueByKey(keys.toString());
		model.addAttribute("imageUrl", map.get(imageUrl));
		model.addAttribute("faces", MapUtil.getMap(map.get(faces), "[,]"));
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
		String imageUrl = ConfigureEnum.IMAGE_URL.getValue();
		String faces = ConfigureEnum.FACES.getValue();
		String uploadFolder = ConfigureEnum.UPLOAD_FOLDER.getValue();
		String profileBlank = ConfigureEnum.PROFILE_BLANK.getValue();
		
		StringBuilder keys = new StringBuilder("");
		keys.append("'");
		keys.append(imageUrl);
		keys.append("','");
		keys.append(faces);
		keys.append("','");
		keys.append(uploadFolder);
		keys.append("'");
		
		Map<String, String> map = configureService.queryValueByKey(keys.toString());
		model.addAttribute("imageUrl", map.get(imageUrl));
		model.addAttribute("uploadFolder", map.get(uploadFolder));
		model.addAttribute("profileBlank", map.get(profileBlank));
		model.addAttribute("faces", MapUtil.getMap(map.get(faces), "[,]"));
		Map<String, String> m = new HashMap<String, String>();
		m.put("E", "东");
		m.put("S", "南");
		model.addAttribute("m", m);
		model.addAttribute("k", "S");
		
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
