package kr.co.oda.security;

import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.oda.service.AdminService;
import kr.co.oda.vo.AdminUserVo;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private AdminService adminUserService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String adId = request.getParameter("adId");
		String adPw = request.getParameter("adPw");
		
		AdminUserVo vo = new AdminUserVo();
		
		vo.setAdId(adId);
		vo.setAdPw(adPw);
		
		AdminUserVo authUser = adminUserService.login(vo);
		
		response.setStatus(HttpServletResponse.SC_OK);
		
		if(authUser == null) {
			String result = "0";			
			OutputStream os = response.getOutputStream();
			os.write(result.getBytes("utf-8"));
			response.sendRedirect(request.getContextPath()+"/admin/login");
			return false;
		}
		
		String result = "1";		
		OutputStream os = response.getOutputStream();
		os.write(result.getBytes("utf-8"));
		
		HttpSession session = request.getSession();
		session.setAttribute("authUser", authUser);	
		
		return false;		
	}

}
