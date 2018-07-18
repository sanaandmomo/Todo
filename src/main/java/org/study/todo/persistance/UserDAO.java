package org.study.todo.persistance;

import org.study.todo.model.User;

public interface UserDAO {

//	public boolean isValidUser() throws Exception;
	
	public boolean isOverLap(String id) throws Exception;
	
	public void saveUser(User user) throws Exception;
}
