package org.study.todo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.study.todo.model.User;
import org.study.todo.persistance.UserDAO;
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDAO dao;
	
	@Override
	public boolean isOverLap(String id) throws Exception {
		return dao.isOverLap(id);
	}

	@Override
	public void saveUser(User user) throws Exception {
		dao.saveUser(user);
	}

}
