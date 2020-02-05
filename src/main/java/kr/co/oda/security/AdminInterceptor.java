package kr.co.oda.security;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.oda.vo.AdminUserVo;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		AdminUserVo authUser = (AdminUserVo) session.getAttribute("authUser");
		
		if (authUser == null) {
			response.sendRedirect(request.getContextPath()+"/admin");
			return false;
		}

		Map pathVariables = (Map)request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
	
		if(pathVariables.get("stNum")==null) {
			return true;
		} else {
			if(!pathVariables.get("stNum").equals(authUser.getStNum())) {
				response.sendRedirect(request.getContextPath()+"/manage");
				return false;
			}
		}

		return true;
	}
}
