package kr.co.oda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.oda.service.AdminService;
import kr.co.oda.vo.AdminUserVo;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value= {"","/login"}, method=RequestMethod.GET )
	public String login() {		
		return "admin/index";
	}
	
	@RequestMapping(value= {"/auth"}, method=RequestMethod.POST )
	public void login(AdminUserVo vo) {
	}
	
	@RequestMapping(value="/logout")
	public void logout() {
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "admin/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(AdminUserVo vo) {
		boolean result = adminService.join(vo);
		if(result) {
			System.out.println("Join Success");
		}
		return "admin/index";
	}		
}
