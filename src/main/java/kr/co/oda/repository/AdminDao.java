package kr.co.oda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.oda.vo.AdminUserVo;
import kr.co.oda.vo.MenuVo;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession sqlSession;

	public AdminUserVo login(AdminUserVo vo) {		
		return sqlSession.selectOne("user.login", vo);
	}

	public boolean join(AdminUserVo vo) {
		int result = sqlSession.insert("user.join", vo);
		return result==1;
	}

	public List<MenuVo> getMenu(String stNum) {
		return sqlSession.selectList("manage.getMenu", stNum);
	}

}
