package org.study.todo.persistance;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.study.todo.model.User;
@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession session;
	private static String name = "org.study.spring.mapper.todoMapper";
	
	@Override
	public boolean isOverLap(String id) throws Exception {
		return (int)session.selectOne(name+".overLap",id) == 1 ? true : false;
	}

	@Override
	public void saveUser(User user) throws Exception {
		session.insert(name+".join",user);
	}

}
