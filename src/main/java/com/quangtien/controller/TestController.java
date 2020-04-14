package com.quangtien.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TestController {
	
	@RequestMapping("trang-chu2")
	public String getIndex(ModelMap model, @RequestParam(defaultValue="main") String site,  @RequestParam(defaultValue="index") String route)
	{
		model.addAttribute("site", site);
		model.addAttribute("route", route);
		return "trang-chu";
	}
}
