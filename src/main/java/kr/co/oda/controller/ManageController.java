package kr.co.oda.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.oda.service.ManageService;
import kr.co.oda.vo.MenuVo;

@Controller
@RequestMapping(value="/manage")
public class ManageController {
	
	@Autowired
	private ManageService manageService;
	
	@RequestMapping(value= {"","/index"}, method=RequestMethod.GET)
	public String manage() {
		return "admin/manage";
	}	
	
	@RequestMapping(value="/menu/{stNum}", method=RequestMethod.GET)
	public String menu(@PathVariable(value="stNum", required=true) String stNum) {
		List<MenuVo> menulist = manageService.getMenu(stNum);
		return "admin/menu";
	}
	
	@RequestMapping(value="/code/{stNum}", method=RequestMethod.GET)
	public String code(@PathVariable(value="stNum", required=true) String stNum) {
		return "admin/code";
	}
	
	@RequestMapping(value="/order/{stNum}", method=RequestMethod.POST)
	public String order(@PathVariable(value="stNum", required=true) String stNum) {
		return "admin/order";
	}
}
