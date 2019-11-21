package kr.co.oda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.oda.repository.AdminDao;
import kr.co.oda.vo.AdminUserVo;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;

	public AdminUserVo login(AdminUserVo vo) {
		return adminDao.login(vo);
	}

	public boolean join(AdminUserVo vo) {
		return adminDao.join(vo);
	}
	
}
