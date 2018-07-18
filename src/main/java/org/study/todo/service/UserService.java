package org.study.todo.service;

import org.study.todo.model.User;

public interface UserService {

//	public boolean isValidUser() throws Exception;
	
	public boolean isOverLap(String id) throws Exception;
	
	public void saveUser(User user) throws Exception;
	
}
