package kr.co.oda.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.oda.repository.AdminDao;
import kr.co.oda.vo.MenuVo;

@Service
public class ManageService {
	
	@Autowired
	private AdminDao adminDao;

	public List<MenuVo> getMenu(String stNum) {
		return adminDao.getMenu(stNum);
	}

}
